From: Adrian Alonso <aalonso@freescale.com>
Subject: [PATCH 3/8] ARM: dts: imx: imx7d-sbd add iomuxc-lpsr hoggrp-2 pads
Date: Tue, 18 Aug 2015 10:48:54 -0500
Message-ID: <1439912939-17535-3-git-send-email-aalonso@freescale.com>
References: <1439912939-17535-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1439912939-17535-1-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Anson.Huang@freescale.com, Frank.Li@freescale.com, yibin.gong@freescale.com, nitin.garg@freescale.com
List-Id: devicetree@vger.kernel.org

Add imx7d-sdb iomuxc-lpsr hoggrp-2 default pads settings

Signed-off-by: Adrian Alonso <aalonso@freescale.com>
---
 arch/arm/boot/dts/imx7d-sdb.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index fdd1d7c..63af4ea 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -406,3 +406,18 @@
 
 	};
 };
+
+&iomuxc_lpsr {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog_2>;
+
+	imx7d-sdb {
+		pinctrl_hog_2: hoggrp-2 {
+			fsl,pins = <
+				MX7D_PAD_GPIO1_IO05__GPIO1_IO5    0x14
+				MX7D_PAD_GPIO1_IO07__GPIO1_IO7    0x59
+				MX7D_PAD_GPIO1_IO00__WDOD1_WDOG_B 0x74
+			>;
+		};
+	};
+};
-- 
2.1.4

