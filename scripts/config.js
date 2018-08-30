//@ts-check
var os = require('os')
var os_type = os.type()
var os_arch = os.arch()
var is_windows = !(os_type.indexOf('Windows') < 0)
var is_bsd = !(os_type.indexOf('BSD') < 0) || os_type == 'DragonFly'

exports.is_windows = is_windows
var sys_extension;
switch (os.type()) {
    case 'Darwin':
    case 'FreeBSD':
    case 'DragonFly':
    case 'Linux':        
    case 'Windows_NT':
        sys_extension = "." + os.platform(); break;
    default: throw ("Not supported" + os.type())
}

exports.sys_extension  = sys_extension
var make = is_bsd ? 'gmake' : 'make'
exports.make  = make
