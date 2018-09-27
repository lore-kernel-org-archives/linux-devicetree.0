From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 09/12] dt-bindings: panel: Add Bananapi S070WV20-CT16 MIPI-DSI panel bindings
Date: Thu, 27 Sep 2018 17:18:47 +0530
Message-ID: <20180927114850.24565-10-jagan@amarulasolutions.com>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180927114850.24565-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Bananapi S070WV20-CT16 is 800x480, 4-lane MIPI-DSI panel, the
same panel PCB comes with parallel RBG which is supported via
panel-simple with "bananapi,s070wv20-ct16" compatible.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../panel/bananapi,s070wv20-ct16-dsi.txt      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16-dsi.txt

diff --git a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16-dsi.txt b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16-dsi.txt
new file mode 100644
index 000000000000..c477163f7999
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16-dsi.txt
@@ -0,0 +1,21 @@
+Bananapi S070WV20 CT16 MIPI-DSI panel
+
+Required properties:
+- compatible: must be "bananapi,s070wv20-ct16-dsi"
+- reg: DSI virtual channel used by that screen
+- avdd-supply: analog regulator dc1 switch
+- dvdd-supply: 3v3 digital regulator
+- reset-gpios: a GPIO phandle for the reset pin
+
+Optional properties:
+- backlight: phandle for the backlight control.
+
+Example:
+panel@0 {
+	compatible = "bananapi,s070wv20-ct16-dsi";
+	reg = <0>;
+	avdd-supply = <&reg_dc1sw>;
+	dvdd-supply = <&reg_dldo1>;
+	reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
+	backlight = <&backlight_dsi>;
+};
-- 
2.18.0.321.gffc6fa0e3
