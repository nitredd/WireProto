require './msg_base'


class ReplyMessage < BaseMessage
  def initialize(header: nil, flags: 0, cursor_id: 0, start_from: 0, num_return: 1, doc: nil)
    @header = header
    @flags = flags
    @cursor_id = cursor_id
    @start_from = start_from
    @num_return = num_return
    @doc = doc

    if @doc != nil
      @doc_buffer = @doc.to_bson
    end
  end

  def calculate_message_size
    message_length = @doc_buffer.length + @header.my_size + 20
    if @header != nil
      @header.message_length = message_length
    end
    message_length
  end

  attr_accessor :flags, :cursor_id, :start_from, :num_return, :doc, :doc_buffer
end
