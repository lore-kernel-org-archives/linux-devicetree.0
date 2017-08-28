From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCHv2 6/7] ARM: dts: stm32: Add USB FS support for STM32F746 MCU
Date: Mon, 28 Aug 2017 16:20:17 +0200
Message-ID: <1503930018-536-7-git-send-email-amelie.delaunay@st.com>
References: <1503930018-536-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503930018-536-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, John Youn <johnyoun@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds the USB pins and nodes for USB FS core on STM32F746 SoC.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32f746.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index 5d0cc72..b605445 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -401,6 +401,28 @@
 					slew-rate = <2>;
 				};
 			};
+
+			usbotg_fs_pins_a: usbotg-fs@0 {
+				pins {
+					pinmux = <STM32F746_PA10_FUNC_OTG_FS_ID>,
+						 <STM32F746_PA11_FUNC_OTG_FS_DM>,
+						 <STM32F746_PA12_FUNC_OTG_FS_DP>;
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+			};
+
+			usbotg_fs_pins_b: usbotg-fs@1 {
+				pins {
+					pinmux = <STM32F746_PB12_FUNC_OTG_HS_ID>,
+						 <STM32F746_PB14_FUNC_OTG_HS_DM>,
+						 <STM32F746_PB15_FUNC_OTG_HS_DP>;
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <2>;
+				};
+			};
 		};
 
 		crc: crc@40023000 {
@@ -429,6 +451,15 @@
 			clock-names = "otg";
 			status = "disabled";
 		};
+
+		usbotg_fs: usb@50000000 {
+			compatible = "st,stm32f4x9-fsotg";
+			reg = <0x50000000 0x40000>;
+			interrupts = <67>;
+			clocks = <&rcc 0 STM32F7_AHB2_CLOCK(OTGFS)>;
+			clock-names = "otg";
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.7.4
