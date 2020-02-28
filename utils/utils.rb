module Utils
    def self.get_task_details
      raw_data = JSON.parse(File.read('test_data/test_data.json'))
      return raw_data['DATA']
    end
end
