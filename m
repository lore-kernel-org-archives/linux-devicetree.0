From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6sx-sdb: enable gpio buttons as wakeup source
Date: Thu, 30 Aug 2018 14:59:39 +0800
Message-ID: <1535612379-8793-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

This patch enables i.MX6SX SDB board's below GPIO buttons
as wakeup sources:

SW4(FUNC1): KEY_VOLUMEUP
SW5(FUNC2): KEY_VOLUMEDOWN

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6sx-sdb.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx-sdb.dtsi b/arch/arm/boot/dts/imx6sx-sdb.dtsi
index f8f3187..53b3408 100644
--- a/arch/arm/boot/dts/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/imx6sx-sdb.dtsi
@@ -40,12 +40,14 @@
 			label = "Volume Up";
 			gpios = <&gpio1 18 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
 		};
 
 		volume-down {
 			label = "Volume Down";
 			gpios = <&gpio1 19 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
+			wakeup-source;
 		};
 	};
 
-- 
2.7.4
