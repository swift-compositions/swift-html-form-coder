public import HTML_Form_Coder
public import HTML_Standard
public import Parser

extension HTML.Form.Coder.Nested.Data.Parse {
    /// Parses raw `key=value&key=value` pairs without percent decoding.
    public struct Pairs<Input: Swift.Collection>: Sendable
    where Input: Sendable, Input.SubSequence == Input, Input.Element == UInt8 {
        @inlinable
        public init() {}
    }
}
