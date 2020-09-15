// get the value of the object based on the object and key , if not send the default value as null
function getValue(obj, key, defval){
  if (typeof defval == 'undefined') defval = null;
  key = key.split('/');
  for (var i = 0; i < key.length; i++) {
      if(typeof obj[key[i]] == 'undefined')
          return defval;
      obj = obj[key[i]];
  }
  return obj;
}


var data =  {"x":{"y":{"z":"a"}}};

var keys = "x/y/z";
try {
console.log('The value of ' + keys + ' is ' + getValue(data, keys));
} catch (error) {
  console.log(error);
}