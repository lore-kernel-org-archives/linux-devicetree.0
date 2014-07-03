From: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH v3 0/2] phy: add hix5hd2-sata-phy driver
Date: Thu,  3 Jul 2014 22:28:36 +0800
Message-ID: <1404397718-11495-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, arnd@arndb.de, mark.rutland@arm.com, haifeng.yan@linaro.org, jchxue@gmail.com, zhangfei.gao@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

v3:
Suggested by Kishon
Change binding doc name to hix5hd2-phy.txt
Add HAS_IOMEM depends, and change include file sequence

v2:
Suggested by Mark
Remove hisilicon,reg-init and init the register in phy-hix5hd2-sata.c
Change property name accordingly.

Jiancheng Xue (2):
  Documentation: Document Hisilicon hix5hd2 sata PHY
  phy: add hix5hd2-sata-phy driver

 .../devicetree/bindings/phy/hix5hd2-phy.txt        |   22 +++
 drivers/phy/Kconfig                                |    8 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/phy-hix5hd2-sata.c                     |  192 ++++++++++++++++++++
 4 files changed, 223 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/hix5hd2-phy.txt
 create mode 100644 drivers/phy/phy-hix5hd2-sata.c

-- 
1.7.9.5
