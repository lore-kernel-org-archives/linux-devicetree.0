From: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 02/10] clk: sunxi: Add support for multiple
 parents to gates
Date: Fri, 15 May 2015 18:38:52 +0200
Message-ID: <1431707940-19372-3-git-send-email-jenskuske@gmail.com>
References: <1431707940-19372-1-git-send-email-jenskuske@gmail.com>
Reply-To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCC5XIE2SIHBBL6C3CVAKGQEVCNXAMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1431707940-19372-1-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some newer sunxi SoCs (A83T, H3) don't have individual registers for
AHB1, APB1 and APB2 gates anymore, but one big bus gates area where each
gate can have a different parent.

The current clock driver sets the same parent for all gates in a group.
This commit adds a new parents field to the gates_data structure, which
allows us to specify an array of parent indices for every single gate.

Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clk/sunxi/clk-sunxi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 9a82f17..17cba4d 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -898,6 +898,8 @@ static void __init sunxi_divider_clk_setup(struct device_node *node,
 
 struct gates_data {
 	DECLARE_BITMAP(mask, SUNXI_GATES_MAX_SIZE);
+	/* If used, ARRAY_SIZE(parents) has to be >= bitmap_weight(mask) */
+	const u8 *parents;
 };
 
 static const struct gates_data sun4i_axi_gates_data __initconst = {
@@ -1000,16 +1002,21 @@ static void __init sunxi_gates_clk_setup(struct device_node *node,
 					 struct gates_data *data)
 {
 	struct clk_onecell_data *clk_data;
+	const char *parents[SUNXI_MAX_PARENTS];
 	const char *clk_parent;
 	const char *clk_name;
 	void __iomem *reg;
+	int npar = 0;
 	int qty;
 	int i = 0;
 	int j = 0;
 
 	reg = of_iomap(node, 0);
 
-	clk_parent = of_clk_get_parent_name(node, 0);
+	while (npar < SUNXI_MAX_PARENTS &&
+	       (parents[npar] = of_clk_get_parent_name(node, npar)) != NULL)
+		npar++;
+	clk_parent = parents[0];
 
 	/* Worst-case size approximation and memory allocation */
 	qty = find_last_bit(data->mask, SUNXI_GATES_MAX_SIZE);
@@ -1026,6 +1033,9 @@ static void __init sunxi_gates_clk_setup(struct device_node *node,
 		of_property_read_string_index(node, "clock-output-names",
 					      j, &clk_name);
 
+		if (data->parents && !WARN_ON(data->parents[j] >= npar))
+			clk_parent = parents[data->parents[j]];
+
 		clk_data->clks[i] = clk_register_gate(NULL, clk_name,
 						      clk_parent, 0,
 						      reg + 4 * (i/32), i % 32,
-- 
2.4.0
