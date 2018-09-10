From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] DT: marvell,mmp2: add MMC controllers
Date: Mon, 10 Sep 2018 14:02:43 +0200
Message-ID: <20180910120243.163979-1-lkundrak@v3.sk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

There's apparently four of them on a MMP2.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp2.dtsi | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index 766bbb8495b6..51d4a2d70db9 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -18,6 +18,10 @@
 		serial3 = &uart4;
 		i2c0 = &twsi1;
 		i2c1 = &twsi2;
+		sdhci0 = &mmc1;
+		sdhci1 = &mmc2;
+		sdhci2 = &mmc3;
+		sdhci3 = &mmc4;
 	};
 
 	soc {
@@ -239,6 +243,42 @@
 				resets = <&soc_clocks MMP2_CLK_RTC>;
 				status = "disabled";
 			};
+
+			mmc1: mmc@d4280000 {
+				compatible = "mrvl,pxav3-mmc";
+				reg = <0xd4280000 0x120>;
+				clocks = <&soc_clocks MMP2_CLK_SDH0>;
+				clock-names = "io";
+				interrupts = <39>;
+				status = "disabled";
+			};
+
+			mmc2: mmc@d4280800 {
+				compatible = "mrvl,pxav3-mmc";
+				reg = <0xd4280800 0x120>;
+				clocks = <&soc_clocks MMP2_CLK_SDH1>;
+				clock-names = "io";
+				interrupts = <52>;
+				status = "disabled";
+			};
+
+			mmc3: mmc@d4281000 {
+				compatible = "mrvl,pxav3-mmc";
+				reg = <0xd4281000 0x120>;
+				clocks = <&soc_clocks MMP2_CLK_SDH2>;
+				clock-names = "io";
+				interrupts = <53>;
+				status = "disabled";
+			};
+
+			mmc4: mmc@d4288000 {
+				compatible = "mrvl,pxav3-mmc";
+				reg = <0xd4281800 0x120>;
+				clocks = <&soc_clocks MMP2_CLK_SDH3>;
+				clock-names = "io";
+				interrupts = <54>;
+				status = "disabled";
+			};
 		};
 
 		soc_clocks: clocks{
-- 
2.17.1
