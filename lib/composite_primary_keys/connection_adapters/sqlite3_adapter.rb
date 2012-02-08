require 'active_record/connection_adapters/sqlite_adapter'

module ActiveRecord
  module ConnectionAdapters #:nodoc:
    PARENT = defined?(JRuby) ? JdbcAdapter : SQLiteAdapter
    class SQLite3Adapter < PARENT # :nodoc:
      def supports_count_distinct? #:nodoc:
        false
      end
      
      def concat(*columns)
        "(#{columns.join('||')})"
      end
    end
  end
end
