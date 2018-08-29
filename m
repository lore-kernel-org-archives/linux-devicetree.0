From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH] ARM: dts: imx7d-sdb: enable gpio buttons as wakeup source
Date: Wed, 29 Aug 2018 09:45:38 +0800
Message-ID: <1535507138-4626-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

This patch enables i.MX7D SDB board's below GPIO buttons
as wakeup sources:

S1(FUNC1): KEY_VOLUMEUP
S3(FUNC2): KEY_VOLUMEDOWN

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx7d-sdb.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index c9b3c60..f1bafda 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -27,12 +27,14 @@
 			label = "Volume Up";
 			gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
 		};
 
 		volume-down {
 			label = "Volume Down";
 			gpios = <&gpio5 10 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
+			wakeup-source;
 		};
 	};
 
-- 
2.7.4
