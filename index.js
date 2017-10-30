var express = require('express');
var ejs = require('ejs');
var app = express();
var path = require('path');
var cors = require('cors');
var mysql = require('mysql');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var cookie = require("cookie");
var server = require('http').createServer(app);
var io = require('socket.io')(server);
app.use(cors());
app.use(cookieParser());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
// view engine setup
app.set(express.static(path.join(__dirname, '')));
app.set('view engine', 'html');
app.engine('html', ejs.renderFile);

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Apple#123",
  database: "shopping"
});

con.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
});

server.listen(3002, function () {
  console.log('Server listening at port %d', 3002);
});

app.get('/', function (req, res) {
  res.sendfile(path.join(__dirname + '/views/login.html'))
})

app.get('/home', function (req, res) {
  res.sendfile(path.join(__dirname + '/views/home.html'))
})

app.get('/items', function (req, res) {
  res.sendfile(path.join(__dirname + '/views/items.html'))
})

app.get('/orderlist', function (req, res) {
  res.sendfile(path.join(__dirname + '/views/orderlist.html'))
})

app.post('/login', function (req, res) {
  console.log("login");
  // console.log(req.body.employeename);
  var username = req.body.employeename;
  var password = req.body.password;

  var sql = con.query('call emplogin(?, ?)', [username, password], function (err, result) {
    if (err) {
      res.send({ "error": err });
      return;
    }


    // console.log(result[0])
    if (Array.isArray(result) && Array.isArray(result[0]) && result[0].length > 0) {
      var data = result[0];
      res.cookie('eidcookie', data[0].employeeid);
      res.cookie('enamecookie', data[0].employeename);
      res.cookie('ephnocookie', data[0].employeephno);
      res.cookie('eemailcookie', data[0].employeeemail);
      // if (username === data[0].employeename && password === data[0].password) {
      res.redirect('/home')
      // res.send({ "success": "login success" });
    }
    else {
      res.send({ "failure": "wrong username and password" });
    }
    // }

  })

  console.log('createred success');
})
app.post('/api/login', function (req, res) {
  console.log("login");
  console.log(req.body.employeename);
  var username = req.body.employeename;
  var password = req.body.password;

  var sql = con.query('call emplogin(?, ?)', [username, password], function (err, result) {
    if (err) {
      res.send({ "error": err });
      return;
    }


    console.log(result[0])
    if (Array.isArray(result) && Array.isArray(result[0]) && result[0].length > 0) {
      var data = result[0];
      res.cookie('eidcookie', data[0].employeeid);
      res.cookie('enamecookie', data[0].employeename);
      res.cookie('ephnocookie', data[0].employeephno);
      res.cookie('eemailcookie', data[0].employeeemail);
      // if (username === data[0].employeename && password === data[0].password) {
      //  res.redirect('/home') 
      res.send({ "message": "login success" });
    }
    else {
      res.send({ "message": "wrong username and password" });
    }
    // }

  })

  console.log('createred success');
})
io.on('connection', function (socket) {
  var cookief = socket.handshake.headers.cookie;
  var cookies = cookie.parse(socket.handshake.headers.cookie);

  socket.on('createitems', function (data) {
    var itemname = data.name;
    var price = data.price;
    var quantity = data.quantity;
    var sql = con.query('call shopping.createItems(?, ?, ?)', [itemname, price, quantity], function (err, result) {
      if (err) throw err
      // console.log(result[0]);
      io.emit('itemlists', result[0])
    })
  })
  socket.on('showitemlist', function () {
    con.query('call shopping.showitemlist()', true, function (err, result, fields) {
      if (err) { throw err }
      socket.emit('itemlist', result[0])
    })
  })

  socket.on('updateitems', function (data) {
    var iid = data.itemid;
    var itemname = data.name;
    var price = data.price;
    var quantity = data.quantity;
    var sql = con.query('call shopping.updateItems(?, ?, ?, ?)', [iid, itemname, price, quantity], function (err, result) {
      if (err) throw err
      // console.log(result[0]);
      io.emit('itemlist1', result[0])
    })

  })
  socket.on('createorder', function () {
    var eid = cookies.eidcookie;
    var sql = con.query('call shopping.createorder(?)', eid, function (err, result) {
      if (err) throw err
      // console.log(result[0]);
      socket.emit('orderslist', result[0])
    })
  })
  socket.on('getorderlist', function () {
    var eid = cookies.eidcookie;
    var sql = con.query('call shopping.getorderlist(?)', eid, function (err, result) {
      if (err) throw err
      // console.log(result[0]);
      socket.emit('orderlist', result[0])
      socket.emit('empdetails', {
        id: cookies.eidcookie,
        name: cookies.enamecookie,
        phno: cookies.ephnocookie,
        email: cookies.eemailcookie,
      })
    })
  })
  socket.on('addcustomer', function (data) {
    var cname = data.cname;
    var cphno = data.cphno;
    var caddress = data.caddress;
    var sql = con.query('call shopping.addcustomer(?, ?, ?, ?)', [cname, cphno, caddress], function (err, result) {
      if (err) throw err
    })
  })
  socket.on('gettaxpercentage', function (data) {
    var itemid = data;
    var sql = con.query('call shopping.gettaxpercentage(?)', itemid, function (err, result) {
      if (err) throw err
      // console.log(result[0][0]);         
      socket.emit('taxpercentage', result[0])
    })
  })
  socket.on('addorderitems', function (data) {
    // console.log(JSON.stringify(data));
    var oid = data.orderid;
    var iname = data.itemselected;
    var iprice = data.price;
    var iquantity = data.quantity;
    var iamount = data.amount;
    var itax = data.tax;
    var itotalamount = data.totalamount;
    var sql = con.query('call shopping.addorderitems(?, ?, ?, ?, ?, ?, ?)', [oid, iname, iprice, iquantity, iamount, itax, itotalamount], function (err, result) {
      if (err) throw err
      // console.log(result[0]);
      socket.emit('orderdetails', result[0]);
    })
    var sql2 = con.query('call shopping.updateorders(?)', oid, function (err, result) {
      if (err) throw err
      console.log(result[0])
      socket.emit('sum', result[0]);
    })
  })
  socket.on('updateitemlist', function (data) {
    var iid = data.itemid;
    var iquantity = data.quantity
    var sql = con.query('call shopping.updateItemlist(?, ?)', [iid, iquantity], function (err, result) {
      if (err) throw err
      io.emit('itemlist', result[0])
    })
  })

})
