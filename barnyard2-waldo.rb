#!/usr/bin/env ruby

# Ruby String #unpack
# V | Integer | 32-bit unsigned, VAX (little-endian) byte order

# <spooler.h>
# define MAX_FILEPATH_BUF    1024

# typedef struct _WaldoData
# {
#    char                    spool_dir[MAX_FILEPATH_BUF];
#    char                    spool_filebase[MAX_FILEPATH_BUF];
#    uint32_t                timestamp;
#    uint32_t                record_idx;
# } WaldoData;

MAX_FILEPATH_BUF = 1024
UINT32_t = 4
bookmark = '/var/spool/barnyard.waldo'
fp = open(bookmark, 'rb')


s = fp.read(MAX_FILEPATH_BUF)
spool_dir = s.strip

s = fp.read(MAX_FILEPATH_BUF)
spool_filebase = s.strip

s = fp.read(UINT32_t)
epoch = s.unpack('V').first

s = fp.read(UINT32_t)
record = s.unpack('V').first

# Unpack the bytes and the array:
puts "Barnyard spool: #{spool_dir}/#{spool_filebase}.#{epoch}"
puts "Record Idx: #{record}"
puts Time.at(epoch)
