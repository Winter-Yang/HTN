import SwiftCLI

class BuildCommand: Command {
    
    let name = "build"
    let shortDescription = "Build H5Editor Url to Native file."
    let type = OptionalParameter()
    let urlFlag = Key<String>("-u", "--urls")
    let outputFlag = Key<String>("-o", "--output")
    
    public func execute() throws {
        let buildType = type.value ?? "h5editor" //默认是H5Editor的json类型
        let urls = (urlFlag.value ?? "").split(separator: ",").map(String.init).filter{ $0.count > 0}
        let outputPath = outputFlag.value ?? "."
        
        let htn = HTNCLI()
        if buildType == "h5editor" {
            //convert h5editor
            htn.buildH5Editor(urls: urls, outputPath: outputPath)
        }
    }
}
