import Foundation
import Capacitor

@objc(UsbSerialPlugin)
public class UsbSerialPlugin: CAPPlugin, CAPBridgedPlugin {

    public let identifier = "UsbSerialPlugin"
    public let jsName = "UsbSerial"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "requestPermission", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "listDevices", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "connect", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "disconnect", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "write", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "read", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "startListening", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "stopListening", returnType: CAPPluginReturnPromise)
    ]
    
    private var implementation: UsbSerial?
    
    public override func load() {
        implementation = UsbSerial(plugin: self)
    }
    
    deinit {
        implementation?.cleanup()
    }
    
    @objc func requestPermission(_ call: CAPPluginCall) {
        guard let impl = implementation else {
            call.reject("Plugin not initialized")
            return
        }
        impl.requestPermission(call)
    }
    
    @objc func listDevices(_ call: CAPPluginCall) {
        guard let impl = implementation else {
            call.reject("Plugin not initialized")
            return
        }
        impl.listDevices(call)
    }
    
    @objc func connect(_ call: CAPPluginCall) {
        guard let impl = implementation else {
            call.reject("Plugin not initialized")
            return
        }
        impl.connect(call)
    }
    
    @objc func disconnect(_ call: CAPPluginCall) {
        guard let impl = implementation else {
            call.reject("Plugin not initialized")
            return
        }
        impl.disconnect(call)
    }
    
    @objc func write(_ call: CAPPluginCall) {
        guard let impl = implementation else {
            call.reject("Plugin not initialized")
            return
        }
        impl.write(call)
    }
    
    @objc func startListening(_ call: CAPPluginCall) {
        guard let impl = implementation else {
            call.reject("Plugin not initialized")
            return
        }
        impl.startListening(call)
    }
    
    @objc func stopListening(_ call: CAPPluginCall) {
        guard let impl = implementation else {
            call.reject("Plugin not initialized")
            return
        }
        impl.stopListening(call)
    }
    
    @objc func read(_ call: CAPPluginCall) {
        guard let impl = implementation else {
            call.reject("Plugin not initialized")
            return
        }
        impl.read(call)
    }
}