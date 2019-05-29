From: Anson.Huang@nxp.com
Subject: [PATCH] ARM: dts: imx7d-sdb: Make SW2's voltage fixed
Date: Wed, 29 May 2019 14:50:56 +0800
Message-ID: <20190529065056.27516-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

On i.MX7D SDB board, SW2 supplies a lot of peripheral devices,
its voltage should be fixed at 1.8V. The commit 43967d9b5a7c
("ARM: dts: imx7d-sdb: Assign corresponding power supply for LDOs")
assigns SW2 as the supplier of vdd1p0d, and when its comsumers
pcie-phy/mipi-phy try to set the vdd1p0d to 1.0V, regulator core
will also set SW2 to its best(min) voltage to 1.5V, and it will
lead to board reset.

This patch makes SW2's voltage fixed at 1.8V to avoid this issue.

Fixes: 43967d9b5a7c ("ARM: dts: imx7d-sdb: Assign corresponding power supply for LDOs")
Reported-by: Leonard Crestez <leonard.crestez@nxp.com>
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx7d-sdb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index efc83bc..a5365b8 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -263,8 +263,8 @@
 			};
 
 			sw2_reg: sw2 {
-				regulator-min-microvolt = <1500000>;
-				regulator-max-microvolt = <1850000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
-- 
2.7.4
