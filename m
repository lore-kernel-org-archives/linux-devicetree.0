From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/5] clk: sunxi: Add USB clock register defintions
Date: Wed, 22 Jan 2014 22:36:24 +0100
Message-ID: <1390426587-16287-3-git-send-email-hdegoede@redhat.com>
References: <1390426587-16287-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRB2PTQCLQKGQE3NB52XI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1390426587-16287-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
index 79c7197..8bccb6a 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -37,6 +37,8 @@ Required properties:
 	"allwinner,sun6i-a31-apb2-gates-clk" - for the APB2 gates on A31
 	"allwinner,sun4i-mod0-clk" - for the module 0 family of clocks
 	"allwinner,sun7i-a20-out-clk" - for the external output clocks
+	"allwinner,sun4i-usb-gates-clk" - for usb gates + resets on A10 / A20
+	"allwinner,sun5i-a13-usb-gates-clk" - for usb gates + resets on A13
 
 Required properties for all clocks:
 - reg : shall be the control register address for the clock.
@@ -49,6 +51,9 @@ Required properties for all clocks:
 Additionally, "allwinner,*-gates-clk" clocks require:
 - clock-output-names : the corresponding gate names that the clock controls
 
+And "allwinner,*-usb-gates-clk" clocks also require:
+- reset-cells : shall be set to 1
+
 Clock consumers should specify the desired clocks they use with a
 "clocks" phandle cell. Consumers that are using a gated clock should
 provide an additional ID in their clock property. This ID is the
diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index f1a147c..18cbc3c 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -813,6 +813,16 @@ static const struct gates_data sun4i_ahb_gates_data __initconst = {
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
@@ -1159,6 +1169,8 @@ static const struct of_device_id clk_gates_match[] __initconst = {
 	{.compatible = "allwinner,sun6i-a31-apb1-gates-clk", .data = &sun6i_a31_apb1_gates_data,},
 	{.compatible = "allwinner,sun7i-a20-apb1-gates-clk", .data = &sun7i_a20_apb1_gates_data,},
 	{.compatible = "allwinner,sun6i-a31-apb2-gates-clk", .data = &sun6i_a31_apb2_gates_data,},
+	{.compatible = "allwinner,sun4i-usb-gates-clk", .data = &sun4i_usb_gates_data,},
+	{.compatible = "allwinner,sun5i-a13-usb-gates-clk", .data = &sun5i_a13_usb_gates_data,},
 	{}
 };
 
-- 
1.8.5.3
