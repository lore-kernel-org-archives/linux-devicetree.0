From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH V6 12/12] ARM: dts: ipq8074: Enable few peripherals for hk01 board
Date: Wed, 16 May 2018 18:20:04 +0530
Message-ID: <1526475004-10341-13-git-send-email-sricharan@codeaurora.org>
References: <1526475004-10341-1-git-send-email-sricharan@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526475004-10341-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, absahu@codeaurora.org, marc.zyngier@arm.com, richardcochran@gmail.com, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

Reviewed-by: Abhishek Sahu <absahu@codeaurora.org>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts | 62 ++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
index 6a838b5..c13ddee 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
@@ -21,6 +21,7 @@
 
 	aliases {
 		serial0 = &blsp1_uart5;
+		serial1 = &blsp1_uart3;
 	};
 
 	chosen {
@@ -33,20 +34,61 @@
 	};
 
 	soc {
-		pinctrl@1000000 {
-			serial_4_pins: serial4_pinmux {
-				mux {
-					pins = "gpio23", "gpio24";
-					function = "blsp4_uart1";
-					bias-disable;
-				};
+		serial@78b3000 {
+			status = "ok";
+		};
+
+		spi@78b5000 {
+			status = "ok";
+
+			m25p80@0 {
+				  #address-cells = <1>;
+				  #size-cells = <1>;
+				  compatible = "jedec,spi-nor";
+				  reg = <0>;
+				  spi-max-frequency = <50000000>;
 			};
 		};
 
-		serial@78b3000 {
-			pinctrl-0 = <&serial_4_pins>;
-			pinctrl-names = "default";
+		serial@78b1000 {
+			 status = "ok";
+		};
+
+		i2c@78b6000 {
+			 status = "ok";
+		};
+
+		dma@7984000 {
+			 status = "ok";
+		};
+
+		nand@79b0000 {
+			status = "ok";
+
+			nand@0 {
+				reg = <0>;
+				nand-ecc-strength = <4>;
+				nand-ecc-step-size = <512>;
+				nand-bus-width = <8>;
+			};
+		};
+
+		phy@86000 {
+			status = "ok";
+		};
+
+		phy@8e000 {
+			status = "ok";
+		};
+
+		pci@20000000 {
+			status = "ok";
+			perst-gpio = <&tlmm 58 0x1>;
+		};
+
+		pci@10000000 {
 			status = "ok";
+			perst-gpio = <&tlmm 61 0x1>;
 		};
 	};
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
