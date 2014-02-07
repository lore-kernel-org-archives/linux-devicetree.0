From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 2/5] clk: sunxi: Add USB clock register defintions
Date: Fri,  7 Feb 2014 15:32:30 +0100
Message-ID: <1391783553-8096-3-git-send-email-hdegoede@redhat.com>
References: <1391783553-8096-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBD652OLQKGQEDVBEGDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1391783553-8096-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add register definitions for the usb-clk register found on sun4i, sun5i and
sun7i SoCs.

Signed-off-by: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/sunxi.txt |  5 +++++
 drivers/clk/sunxi/clk-sunxi.c                     | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index 27f19f1..e368a86c 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -38,6 +38,8 @@ Required properties:
 	"allwinner,sun4i-mod0-clk" - for the module 0 family of clocks
 	"allwinner,sun7i-a20-out-clk" - for the external output clocks
 	"allwinner,sun7i-a20-gmac-clk" - for the GMAC clock module on A20/A31
+	"allwinner,sun4i-usb-clk" - for usb gates + resets on A10 / A20
+	"allwinner,sun5i-a13-usb-clk" - for usb gates + resets on A13
 
 Required properties for all clocks:
 - reg : shall be the control register address for the clock.
@@ -54,6 +56,9 @@ Required properties for all clocks:
 For "allwinner,sun7i-a20-gmac-clk", the parent clocks shall be fixed rate
 dummy clocks at 25 MHz and 125 MHz, respectively. See example.
 
+And "allwinner,*-usb-clk" clocks also require:
+- reset-cells : shall be set to 1
+
 Clock consumers should specify the desired clocks they use with a
 "clocks" phandle cell. Consumers that are using a gated clock should
 provide an additional ID in their clock property. This ID is the
diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 1e15e4c..3ba1402 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -910,6 +910,16 @@ static const struct gates_data sun4i_ahb_gates_data __initconst = {
 	.mask = {0x7F77FFF, 0x14FB3F},
 };
 
+static const struct gates_data sun4i_usb_gates_data __initconst = {
+	.mask = {0x1C0},
+	.reset_mask = 0x07,
+};
+
+static const struct gates_data sun5i_a13_usb_gates_data __initconst = {
+	.mask = {0x140},
+	.reset_mask = 0x03,
+};
+
 static const struct gates_data sun5i_a10s_ahb_gates_data __initconst = {
 	.mask = {0x147667e7, 0x185915},
 };
@@ -1257,6 +1267,8 @@ static const struct of_device_id clk_gates_match[] __initconst = {
 	{.compatible = "allwinner,sun6i-a31-apb1-gates-clk", .data = &sun6i_a31_apb1_gates_data,},
 	{.compatible = "allwinner,sun7i-a20-apb1-gates-clk", .data = &sun7i_a20_apb1_gates_data,},
 	{.compatible = "allwinner,sun6i-a31-apb2-gates-clk", .data = &sun6i_a31_apb2_gates_data,},
+	{.compatible = "allwinner,sun4i-usb-clk", .data = &sun4i_usb_gates_data,},
+	{.compatible = "allwinner,sun5i-a13-usb-clk", .data = &sun5i_a13_usb_gates_data,},
 	{}
 };
 
-- 
1.8.4.2
