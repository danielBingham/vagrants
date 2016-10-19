%w(php5 php5-mysql libapache2-mod-php5).each do |pkg|
  package pkg do
   action :install
  end
end 
