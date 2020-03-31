# 添加第三方软件包
sudo rm -rf package/lean/luci-app-flowoffload
sudo rm -rf package/diy/adguardhome
sudo rm -rf package/diy/luci-app-adguardhome
git clone https://github.com/weiwuji1/my.git package/my
git clone https://github.com/Leo-Jo-My/luci-app-vssr package/luci-app-vssr            
git clone https://github.com/vernesong/OpenClash package/openclash
git clone https://github.com/kang-mk/luci-app-serverchan package/luci-app-serverchan
git clone https://github.com/kang-mk/luci-app-smartinfo package/luci-app-smartinfo
git clone https://github.com/Leo-Jo-My/luci-theme-argon-mod package/luci-theme-argon-mod
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat package/luci-theme-opentomcat
git clone https://github.com/Leo-Jo/luci-app-koolproxyR package/luci-app-koolproxyR
git clone https://github.com/lisaac/luci-lib-docker.git package/luci-lib-docker
git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman
git clone https://github.com/lisaac/luci-app-diskman package/luci-app-diskman
mkdir -p package/parted && cp -i package/luci-app-diskman/Parted.Makefile package/parted/Makefile

# 自定义定制选项
sed -i 's#192.168.1.1#10.1.1.11#g' package/base-files/files/bin/config_generate #定制默认IP
sed -i 's#max-width:200px#max-width:1000px#g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm #修改首页样式
sed -i 's#max-width:200px#max-width:1000px#g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index_x86.htm #修改X86首页样式
sed -i 's#option commit_interval 24h#option commit_interval 10m#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为10分钟
sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置
sed -i 's#o.default = "admin"#o.default = ""#g' lienol/luci-app-passwall/luasrc/model/cbi/passwall/balancing.lua #去除haproxy默认密码(最新版已无密码)
sed -i 's#page = entry({"admin", "network"#page = entry({"admin", "control"#g' package/OpenAppFilter/luci-app-oaf/luasrc/controller/appfilter.lua #更换应用控制菜单
