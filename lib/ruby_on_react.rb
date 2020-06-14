require "ruby_on_react/version"
require 'thor'
require 'dotenv'
require_relative '../assets/Template'
Dotenv.load

module ReactOnRails
  class Error < StandardError; end
    
  class CLI < Thor
    
    desc "new <APPNAME>", "init new react app"
    option :noredux
    option :rien
    def new(name)
      p "I'm going to create react app #{options[:noredux]}"
      #system("npx create-react-app #{name} && cd #{name}/")
      self.init
      system("rm -r -f src/ && mkdir src/ && cd src/ && mkdir assets components config pages services redux style components/route")
      system("touch src/App.jsx src/index.js")
      File.write("src/App.jsx", appTemplate ) 
      File.write("src/index.js", indexTemplate(options) )
          
    end
    
    desc "init", "init react app"
    def init
      root = Dir.pwd
      
      system("touch .env && echo \"ROOT_PATH=#{root}\nNODE_PATH='src/'\" >> .env") if root != ENV['ROOT_PATH']

    end

    desc "generate", "react generate"
    map %w[-g] => :generate
    def generate(command,name)
      
      p "I'm going to generate #{command}"
      system("touch test.jsx")
      File.write("test.jsx",File.open("#{path_to_gem}/assets/pageTemplate.txt").read.gsub("NAME","#{name}")) 
      case command
        when "page"
          system("mkdir src/pages")
          File.write( "#{ENV['ROOT_PATH']}/src/pages/#{name}.jsx", File.open("#{path_to_gem}/assets/pageTemplate.txt").read.gsub("NAME","#{name}") )
        when "store"
          "Low risk"
        when "components"
          File.write( "#{ENV['ROOT_PATH']}/src/components/#{name}.jsx", File.open("#{path_to_gem}/assets/componentTemplate.txt").read.gsub("NAME","#{name}") )
        else
          p "I'm going to generate nothing !"
      end
    end
    
    desc "destroy", "react destroy"
    map %w[-d] => :destroy
    def destroy(command)
      
      p "I'm going to destroy #{command}"
          
    end
    
  end
end
