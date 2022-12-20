function fn(){
var env = karate.env; //get system property 'karate.env' karate.log('karate.env system)
if (!env){
env = 'dev';
}
var config ={
env: env,
myVarName: 'hello karate',
baseUrl: 'https://gorest.co.in',
tokenID:'abadb712b0474a94f66082e11cddefb1ae95ea3002e670ae695c4364d17747e8'
}
if (env== 'dev'){
//customize
//e.g. config.foo ='bar';
} else if (env =='e2e'){
//customize
}
return config;
}
