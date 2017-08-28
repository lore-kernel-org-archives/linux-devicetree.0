From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCHv2 7/7] ARM: dts: stm32: Enable USB FS on stm32f746-disco
Date: Mon, 28 Aug 2017 16:20:18 +0200
Message-ID: <1503930018-536-8-git-send-email-amelie.delaunay@st.com>
References: <1503930018-536-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503930018-536-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, John Youn <johnyoun@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patch enables USB FS on stm32f746-disco (Host mode) with 5V VBUS
enable.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32f746-disco.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f746-disco.dts b/arch/arm/boot/dts/stm32f746-disco.dts
index 8f0c3d5..eeb430c 100644
--- a/arch/arm/boot/dts/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/stm32f746-disco.dts
@@ -67,6 +67,14 @@
 		clocks = <&rcc 0 STM32F7_AHB1_CLOCK(OTGHSULPI)>;
 		clock-names = "main_clk";
 	};
+
+	/* This turns on vbus for otg fs for host mode (dwc2) */
+	vcc5v_otg_fs: vcc5v-otg-fs-regulator {
+		compatible = "regulator-fixed";
+		gpio = <&gpiod 5 0>;
+		regulator-name = "vcc5_host1";
+		regulator-always-on;
+	};
 };
 
 &clk_hse {
@@ -87,3 +95,10 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usbotg_fs {
+	dr_mode = "host";
+	pinctrl-0 = <&usbotg_fs_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.7.4
