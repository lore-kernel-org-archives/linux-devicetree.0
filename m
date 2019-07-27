From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 3/4] phy: enable compile-testing for the Lantiq PHY drivers
Date: Sat, 27 Jul 2019 14:04:14 +0200
Message-ID: <20190727120415.15859-4-martin.blumenstingl@googlemail.com>
References: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, john@phrozen.org, kishon@ti.com, paul.burton@mips.com, ralf@linux-mips.org
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org, hauke@hauke-m.de, mark.rutland@arm.com, ms@dev.tdt.de, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Unconditionally include the lantiq subdirectory in the phy Makefile.

All drivers in there have their dependencies maintained. One of these
(optional) dependencies is COMPILE_TEST, however this can only be
evaluated when Kconfig scans the lantiq subdirectory.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index 0d9fddc498a6..c96a1afc95bd 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -10,7 +10,6 @@ obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_ARCH_SUNXI)		+= allwinner/
 obj-$(CONFIG_ARCH_MESON)		+= amlogic/
-obj-$(CONFIG_LANTIQ)			+= lantiq/
 obj-$(CONFIG_ARCH_MEDIATEK)		+= mediatek/
 obj-$(CONFIG_ARCH_RENESAS)		+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
@@ -19,6 +18,7 @@ obj-y					+= broadcom/	\
 					   cadence/	\
 					   freescale/	\
 					   hisilicon/	\
+					   lantiq/	\
 					   marvell/	\
 					   motorola/	\
 					   mscc/	\
-- 
2.22.0
