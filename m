From: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 6/7] ARM: dts: stm32: Add USB FS support for STM32F746 MCU
Date: Thu, 17 Aug 2017 11:33:05 +0200
Message-ID: <1502962386-6683-7-git-send-email-amelie.delaunay@st.com>
References: <1502962386-6683-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502962386-6683-1-git-send-email-amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the USB pins and nodes for USB FS core on STM32F746 SoC.

Signed-off-by: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stm32f746.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index fcfe5a6..a9476ea 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -419,6 +419,28 @@
 					slew-rate = <2>;
 				};
 			};
+
+			usbotg_fs_pins_a: usbotg_fs@0 {
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
+			usbotg_fs_pins_b: usbotg_fs@1 {
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
@@ -480,6 +502,15 @@
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
