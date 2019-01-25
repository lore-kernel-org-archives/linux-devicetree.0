From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 09/11] ARM: dts: sun8i-a23: Add compatible strings to display pipeline device nodes
Date: Fri, 25 Jan 2019 11:23:12 +0800
Message-ID: <20190125032314.20915-10-wens@csie.org>
References: <20190125032314.20915-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125032314.20915-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that the compatible strings for the display pipeline on the A23 have
been added to the bindings, add the corresponding compatibles to the
device nodes already in the A23/A33 shared dtsi.

While the A23 has the TCON ch1 clock defined in the CCU, and the channel
1 registers are available, it does not have any means to use channel 1
due to a lack of downstream encoders, and the enable bit for channel 1 is
hard-wired to 0 (off). Hence the ch1 clock is left out.

As the MIPI DSI output device is not officially documented, and there
are no reference devices to test it, it is not covered by this patch.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-a23.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a23.dtsi b/arch/arm/boot/dts/sun8i-a23.dtsi
index d00055e9eef5..a5e884a8b2ae 100644
--- a/arch/arm/boot/dts/sun8i-a23.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23.dtsi
@@ -62,10 +62,26 @@
 	};
 };
 
+&be0 {
+	compatible = "allwinner,sun8i-a23-display-backend";
+};
+
 &ccu {
 	compatible = "allwinner,sun8i-a23-ccu";
 };
 
+&de {
+	compatible = "allwinner,sun8i-a23-display-engine";
+};
+
+&drc0 {
+	compatible = "allwinner,sun8i-a23-drc";
+};
+
+&fe0 {
+	compatible = "allwinner,sun8i-a23-display-frontend";
+};
+
 &pio {
 	compatible = "allwinner,sun8i-a23-pinctrl";
 	interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
@@ -73,6 +89,10 @@
 		     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 };
 
+&tcon0 {
+	compatible = "allwinner,sun8i-a23-tcon";
+};
+
 &usb_otg {
 	compatible = "allwinner,sun6i-a31-musb";
 };
-- 
2.20.1
