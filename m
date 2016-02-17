From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH] ARM: at91: sama5/dts: move hsmc_clk out of nfc node
Date: Wed, 17 Feb 2016 13:42:21 +0800
Message-ID: <1455687741-9625-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Josh Wu <josh.wu@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

From: Josh Wu <josh.wu@atmel.com>

In sama5d3, sama5d4 chips, pmecc will use the hsmc clock. As pmecc is
part of HSMC. So move out hsmc_clk from nfc node to nand node.

Signed-off-by: Josh Wu <rainyfeeling@outlook.com>
Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
---

 arch/arm/boot/dts/sama5d3.dtsi |    2 +-
 arch/arm/boot/dts/sama5d4.dtsi |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index a532791..a242d27 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -1474,6 +1474,7 @@
 			atmel,nand-has-dma;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_nand0_ale_cle>;
+			clocks = <&hsmc_clk>;
 			atmel,pmecc-lookup-table-offset = <0x0 0x8000>;
 			status = "disabled";
 
@@ -1486,7 +1487,6 @@
 					0xffffc000 0x00000070	/* NFC HSMC regs */
 					0x00200000 0x00100000	/* NFC SRAM banks */
 					>;
-				clocks = <&hsmc_clk>;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index b8032bc..1499b33 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -295,6 +295,7 @@
 			atmel,nand-has-dma;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_nand>;
+			clocks = <&hsmc_clk>;
 			status = "disabled";
 
 			nfc@90000000 {
@@ -306,7 +307,6 @@
 					0xfc05c000 0x00000070	/* NFC HSMC regs */
 					0x00100000 0x00100000	/* NFC SRAM banks */
                                          >;
-				clocks = <&hsmc_clk>;
 				atmel,write-by-sram;
 			};
 		};
-- 
1.7.9.5
