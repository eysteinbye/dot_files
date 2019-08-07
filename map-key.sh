#!/bin/bash

# Key mapping

# Find key values here:
#https://developer.apple.com/library/archive/technotes/tn2450/_index.html#//apple_ref/doc/uid/DTS40017618-CH1-KEY_TABLE_USAGES

#0xE1 shift
#0x39 capslock

#Mapping capslock to left shift
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E1}]}'
