From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 3/3] ARM: dts: stm32: enable USB HS on stm32f769-disco
Date: Thu, 15 Feb 2018 16:54:40 +0100
Message-ID: <1518710080-18164-4-git-send-email-amelie.delaunay@st.com>
References: <1518710080-18164-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518710080-18164-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patch enables USB HS on stm32f749-disco in OTG (DRD) mode.
The USB connector used will determine the role of USB OTG controller.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32f769-disco.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
index 4463ca1..427bafe 100644
--- a/arch/arm/boot/dts/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/stm32f769-disco.dts
@@ -61,6 +61,12 @@
 		serial0 = &usart1;
 	};
 
+	usbotg_hs_phy: usb-phy {
+		#phy-cells = <0>;
+		compatible = "usb-nop-xceiv";
+		clocks = <&rcc 0 STM32F7_AHB1_CLOCK(OTGHSULPI)>;
+		clock-names = "main_clk";
+	};
 };
 
 &cec {
@@ -78,3 +84,12 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usbotg_hs {
+	dr_mode = "otg";
+	phys = <&usbotg_hs_phy>;
+	phy-names = "usb2-phy";
+	pinctrl-0 = <&usbotg_hs_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.7.4
