From: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH v4 0/2] add hix5hd2 mac driver
Date: Tue,  3 Jun 2014 13:49:35 +0800
Message-ID: <1401774577-16683-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, arnd@arndb.de, f.fainelli@gmail.com, sergei.shtylyov@cogentembedded.com, mark.rutland@arm.com, David.Laight@ACULAB.COM, eric.dumazet@gmail.com, haifeng.yan@linaro.org, jchxue@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, Zhangfei Gao <zhangfei.gao@linaro.org>
List-Id: devicetree@vger.kernel.org

v4:
Update indent
Use usleep_range instead of udelay

v3:
Remove .ndo_get_stats as mentioned by Tobias
Add __le32 conversion pointed by Mark

v2:
Update binding accoring to Sergei comments
Update descriptor as Arnd's suggestion

Zhangfei Gao (2):
  Documentation: add Device tree bindings for Hisilicon hix5hd2
    ethernet
  net: hisilicon: add hix5hd2 mac driver

 .../bindings/net/hisilicon-hix5hd2-gmac.txt        |   36 +
 drivers/net/ethernet/Kconfig                       |    1 +
 drivers/net/ethernet/Makefile                      |    1 +
 drivers/net/ethernet/hisilicon/Kconfig             |   27 +
 drivers/net/ethernet/hisilicon/Makefile            |    5 +
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c      | 1066 ++++++++++++++++++++
 6 files changed, 1136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/hisilicon-hix5hd2-gmac.txt
 create mode 100644 drivers/net/ethernet/hisilicon/Kconfig
 create mode 100644 drivers/net/ethernet/hisilicon/Makefile
 create mode 100644 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c

-- 
1.7.9.5
