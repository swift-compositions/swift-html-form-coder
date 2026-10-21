public import Byte
public import Coder
public import Foundation
public import HTML_Form_Coder
public import HTML_Standard
public import HTTP
public import HTTP_Router
import Media_Type_Standard
public import RFC_9110

extension HTML.Form.Coder.Value: HTTP.Body.Coder.`Protocol` {
    public typealias Input = [Byte]
    public typealias Buffer = [Byte]
    public typealias Failure = HTML.Form.Coder.Error
    public typealias Body = Never

    public static var contentType: HTTP.MediaType { .formUrlEncoded }

    public func parse(_ input: inout [Byte]) throws(Failure) -> Output {
        do {
            let value = try decoder.decode(
                Output.self,
                from: Foundation.Data(input.map(\.bitPattern))
            )
            input = []
            return value
        } catch {
            throw .coding(String(describing: error))
        }
    }

    public func serialize(
        _ output: Output,
        into buffer: inout [Byte]
    ) throws(Failure) {
        do {
            buffer.append(contentsOf: try encoder.encode(output).map(Byte.init(bitPattern:)))
        } catch {
            throw .coding(String(describing: error))
        }
    }
}
