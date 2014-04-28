From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 4/7] mfd: sun6i-prcm: document DT bindings
Date: Mon, 28 Apr 2014 16:58:47 +0200
Message-ID: <1398697130-8338-5-git-send-email-boris.brezillon@free-electrons.com>
References: <1398697130-8338-1-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBB3GZ7GNAKGQEHCMCMLI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1398697130-8338-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document DT bindings of the PRCM (Power/Reset/Clock Management) unit.

Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../devicetree/bindings/mfd/sun6i-prcm.txt         | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/sun6i-prcm.txt

diff --git a/Documentation/devicetree/bindings/mfd/sun6i-prcm.txt b/Documentation/devicetree/bindings/mfd/sun6i-prcm.txt
new file mode 100644
index 0000000..de92429
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/sun6i-prcm.txt
@@ -0,0 +1,71 @@
+* Allwinner PRCM (Power/Reset/Clock Management) Multi-Functional Device
+
+PRCM is an MFD device exposing several Power Management related devices
+(like clks and reset controllers).
+
+Required properties:
+ - compatible: "allwinner,sun6i-a31-prcm"
+ - reg: The PRCM registers range
+
+The prcm node may contain several subdevices definitions:
+ - see Documentation/devicetree/clk/sunxi.txt for clock devices
+ - see Documentation/devicetree/reset/allwinner,sunxi-clock-reset.txt for reset
+   controller devices
+
+
+Example:
+
+	prcm: prcm@01f01400 {
+		compatible = "allwinner,sun6i-a31-prcm";
+		reg = <0x01f01400>;
+
+		/* Put subdevices here */
+		ar100_mux: ar100_mux {
+			compatible = "allwinner,sun6i-a31-ar100-mux-clk";
+			#clock-cells = <0>;
+			clocks = <&osc32k>, <&osc24M>, <&pll6>, <&pll6>;
+		};
+
+		ar100: ar100 {
+			compatible = "allwinner,sun6i-a31-ar100-clk";
+			#clock-cells = <0>;
+			clocks = <&ar100_mux>;
+		};
+
+		ar100_div: ar100_div {
+			compatible = "allwinner,sun6i-a31-ar100-div-clk";
+			#clock-cells = <0>;
+			clocks = <&ar100>;
+		};
+
+		ahb0: ahb0 {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clock-div = <1>;
+			clock-mult = <1>;
+			clocks = <&ar100_div>;
+			clock-output-names = "ahb0";
+		};
+
+		apb0: apb0 {
+			compatible = "allwinner,sun6i-a31-apb0-clk";
+			#clock-cells = <0>;
+			clocks = <&ahb0>;
+			clock-output-names = "apb0";
+		};
+
+		apb0_gates: apb0_gates {
+			compatible = "allwinner,sun6i-a31-apb0-gates-clk";
+			#clock-cells = <1>;
+			clocks = <&apb0>;
+			clock-output-names = "apb0_pio", "apb0_ir",
+					"apb0_timer01", "apb0_p2wi",
+					"apb0_uart", "apb0_1wire",
+					"apb0_i2c";
+		};
+
+		apb0_rst: apb0_rst {
+			compatible = "allwinner,sun6i-a31-clock-reset";
+			#reset-cells = <1>;
+		};
+	};
-- 
1.8.3.2
