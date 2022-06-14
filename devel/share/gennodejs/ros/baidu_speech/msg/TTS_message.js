// Auto-generated. Do not edit!

// (in-package baidu_speech.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class TTS_message {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.engine = null;
      this.sentence = null;
      this.language = null;
      this.engine_settings = null;
      this.speaker_settings = null;
      this.time = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('engine')) {
        this.engine = initObj.engine
      }
      else {
        this.engine = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('sentence')) {
        this.sentence = initObj.sentence
      }
      else {
        this.sentence = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('language')) {
        this.language = initObj.language
      }
      else {
        this.language = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('engine_settings')) {
        this.engine_settings = initObj.engine_settings
      }
      else {
        this.engine_settings = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('speaker_settings')) {
        this.speaker_settings = initObj.speaker_settings
      }
      else {
        this.speaker_settings = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = {secs: 0, nsecs: 0};
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TTS_message
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [engine]
    bufferOffset = std_msgs.msg.String.serialize(obj.engine, buffer, bufferOffset);
    // Serialize message field [sentence]
    bufferOffset = std_msgs.msg.String.serialize(obj.sentence, buffer, bufferOffset);
    // Serialize message field [language]
    bufferOffset = std_msgs.msg.String.serialize(obj.language, buffer, bufferOffset);
    // Serialize message field [engine_settings]
    bufferOffset = std_msgs.msg.String.serialize(obj.engine_settings, buffer, bufferOffset);
    // Serialize message field [speaker_settings]
    bufferOffset = std_msgs.msg.String.serialize(obj.speaker_settings, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.time(obj.time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TTS_message
    let len;
    let data = new TTS_message(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [engine]
    data.engine = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [sentence]
    data.sentence = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [language]
    data.language = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [engine_settings]
    data.engine_settings = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [speaker_settings]
    data.speaker_settings = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.time(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += std_msgs.msg.String.getMessageSize(object.engine);
    length += std_msgs.msg.String.getMessageSize(object.sentence);
    length += std_msgs.msg.String.getMessageSize(object.language);
    length += std_msgs.msg.String.getMessageSize(object.engine_settings);
    length += std_msgs.msg.String.getMessageSize(object.speaker_settings);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'baidu_speech/TTS_message';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb6f1b90f95952fc40263a7efbe0490f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    std_msgs/String engine
    std_msgs/String sentence
    std_msgs/String language
    std_msgs/String engine_settings
    std_msgs/String speaker_settings
    time time
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TTS_message(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.engine !== undefined) {
      resolved.engine = std_msgs.msg.String.Resolve(msg.engine)
    }
    else {
      resolved.engine = new std_msgs.msg.String()
    }

    if (msg.sentence !== undefined) {
      resolved.sentence = std_msgs.msg.String.Resolve(msg.sentence)
    }
    else {
      resolved.sentence = new std_msgs.msg.String()
    }

    if (msg.language !== undefined) {
      resolved.language = std_msgs.msg.String.Resolve(msg.language)
    }
    else {
      resolved.language = new std_msgs.msg.String()
    }

    if (msg.engine_settings !== undefined) {
      resolved.engine_settings = std_msgs.msg.String.Resolve(msg.engine_settings)
    }
    else {
      resolved.engine_settings = new std_msgs.msg.String()
    }

    if (msg.speaker_settings !== undefined) {
      resolved.speaker_settings = std_msgs.msg.String.Resolve(msg.speaker_settings)
    }
    else {
      resolved.speaker_settings = new std_msgs.msg.String()
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = {secs: 0, nsecs: 0}
    }

    return resolved;
    }
};

module.exports = TTS_message;
