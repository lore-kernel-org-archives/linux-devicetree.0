From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 02/10] clk: sunxi: Add support for sun9i A80
 USB clocks and resets
Date: Wed, 28 Jan 2015 03:54:07 +0800
Message-ID: <1422388455-25923-3-git-send-email-wens@csie.org>
References: <1422388455-25923-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB3WZT6TAKGQEQOKHTPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1422388455-25923-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The USB controller/phy clocks and reset controls are in a separate
address block, unlike previous SoCs where they were in the clock
controller. Also, access to the address block is controlled by a
clock gate to AHB.

Add support for resets requiring a clock to be enabled when
asserting/deasserting the reset controls, and add the sun9i USB
clocks.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/sunxi.txt |  2 ++
 drivers/clk/sunxi/clk-usb.c                       | 43 +++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index 60b44285250d..3f1dcd879af7 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -66,6 +66,8 @@ Required properties:
 	"allwinner,sun4i-a10-usb-clk" - for usb gates + resets on A10 / A20
 	"allwinner,sun5i-a13-usb-clk" - for usb gates + resets on A13
 	"allwinner,sun6i-a31-usb-clk" - for usb gates + resets on A31
+	"allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on A80
+	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
 
 Required properties for all clocks:
 - reg : shall be the control register address for the clock.
diff --git a/drivers/clk/sunxi/clk-usb.c b/drivers/clk/sunxi/clk-usb.c
index f1dcc8fb5a7d..a86ed2f8d7af 100644
--- a/drivers/clk/sunxi/clk-usb.c
+++ b/drivers/clk/sunxi/clk-usb.c
@@ -29,6 +29,7 @@
 struct usb_reset_data {
 	void __iomem			*reg;
 	spinlock_t			*lock;
+	struct clk			*clk;
 	struct reset_controller_dev	rcdev;
 };
 
@@ -41,12 +42,14 @@ static int sunxi_usb_reset_assert(struct reset_controller_dev *rcdev,
 	unsigned long flags;
 	u32 reg;
 
+	clk_prepare_enable(data->clk);
 	spin_lock_irqsave(data->lock, flags);
 
 	reg = readl(data->reg);
 	writel(reg & ~BIT(id), data->reg);
 
 	spin_unlock_irqrestore(data->lock, flags);
+	clk_disable_unprepare(data->clk);
 
 	return 0;
 }
@@ -60,12 +63,14 @@ static int sunxi_usb_reset_deassert(struct reset_controller_dev *rcdev,
 	unsigned long flags;
 	u32 reg;
 
+	clk_prepare_enable(data->clk);
 	spin_lock_irqsave(data->lock, flags);
 
 	reg = readl(data->reg);
 	writel(reg | BIT(id), data->reg);
 
 	spin_unlock_irqrestore(data->lock, flags);
+	clk_disable_unprepare(data->clk);
 
 	return 0;
 }
@@ -84,6 +89,7 @@ static struct reset_control_ops sunxi_usb_reset_ops = {
 struct usb_clk_data {
 	u32 clk_mask;
 	u32 reset_mask;
+	bool reset_needs_clk;
 };
 
 static void __init sunxi_usb_clk_setup(struct device_node *node,
@@ -146,6 +152,15 @@ static void __init sunxi_usb_clk_setup(struct device_node *node,
 	if (!reset_data)
 		return;
 
+	if (data->reset_needs_clk) {
+		reset_data->clk = of_clk_get(node, 0);
+		if (IS_ERR(reset_data->clk)) {
+			pr_err("Could not get clock for reset controls\n");
+			kfree(reset_data);
+			return;
+		}
+	}
+
 	reset_data->reg = reg;
 	reset_data->lock = lock;
 	reset_data->rcdev.nr_resets = __fls(data->reset_mask) + 1;
@@ -188,3 +203,31 @@ static void __init sun6i_a31_usb_setup(struct device_node *node)
 	sunxi_usb_clk_setup(node, &sun6i_a31_usb_clk_data, &sun4i_a10_usb_lock);
 }
 CLK_OF_DECLARE(sun6i_a31_usb, "allwinner,sun6i-a31-usb-clk", sun6i_a31_usb_setup);
+
+static const struct usb_clk_data sun9i_a80_usb_mod_data __initconst = {
+	.clk_mask = BIT(6) | BIT(5) | BIT(4) | BIT(3) | BIT(2) | BIT(1),
+	.reset_mask = BIT(19) | BIT(18) | BIT(17),
+	.reset_needs_clk = 1,
+};
+
+static DEFINE_SPINLOCK(a80_usb_mod_lock);
+
+static void __init sun9i_a80_usb_mod_setup(struct device_node *node)
+{
+	sunxi_usb_clk_setup(node, &sun9i_a80_usb_mod_data, &a80_usb_mod_lock);
+}
+CLK_OF_DECLARE(sun9i_a80_usb_mod, "allwinner,sun9i-a80-usb-mod-clk", sun9i_a80_usb_mod_setup);
+
+static const struct usb_clk_data sun9i_a80_usb_phy_data __initconst = {
+	.clk_mask = BIT(10) | BIT(5) | BIT(4) | BIT(3) | BIT(2) | BIT(1),
+	.reset_mask = BIT(21) | BIT(20) | BIT(19) | BIT(18) | BIT(17),
+	.reset_needs_clk = 1,
+};
+
+static DEFINE_SPINLOCK(a80_usb_phy_lock);
+
+static void __init sun9i_a80_usb_phy_setup(struct device_node *node)
+{
+	sunxi_usb_clk_setup(node, &sun9i_a80_usb_phy_data, &a80_usb_phy_lock);
+}
+CLK_OF_DECLARE(sun9i_a80_usb_phy, "allwinner,sun9i-a80-usb-phy-clk", sun9i_a80_usb_phy_setup);
-- 
2.1.4
