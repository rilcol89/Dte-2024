# MIT License
#
# Copyright (c) 2023 Mark McKay
# https://github.com/blackears/cyclopsLevelBuilder
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

@tool
extends DataVector
class_name DataVectorFloat

@export var data:PackedFloat32Array

func _init(name:StringName = "", data:PackedFloat32Array = [], data_type:DataType = DataType.FLOAT, stride:int = 1):
	self.name = name
	self.data = data
	self.data_type = data_type
	self.stride = stride

func get_data_format_type()->DataFormatType:
	return DataFormatType.FLOAT32

func resize(size:int):
	data.resize(size * stride)
	
func get_value(index:int)->float:
	return data[index]

func get_value_vec2(index:int)->Vector2:
	return Vector2(data[index * stride], data[index * stride + 1])
	
func get_value_vec3(index:int)->Vector3:
	return Vector3(data[index * stride], data[index * stride + 1], data[index * stride + 2])
	
func get_value_vec4(index:int)->Vector4:
	return Vector4(data[index * stride], data[index * stride + 1], data[index * stride + 2], data[index * stride + 3])
	

func set_value(value:int, index:int):
	data[index] = value
	
func set_value_vec2(value:Vector2, index:int):
	data[index * stride] = value.x
	data[index * stride + 1] = value.y

func set_value_vec3(value:Vector3, index:int):
	data[index * stride] = value.x
	data[index * stride + 1] = value.y
	data[index * stride + 2] = value.z

func set_value_vec4(value:Vector4, index:int):
	data[index * stride] = value.x
	data[index * stride + 1] = value.y
	data[index * stride + 2] = value.z
	data[index * stride + 3] = value.w