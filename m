From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH] clk: sunxi: Extend the simple gates and handle
 the Allwinner H3
Date: Sun, 6 Dec 2015 10:04:12 +0100
Message-ID: <20151206100412.1a74b71da8e9ca28c6e61589@free.fr>
Reply-To: moinejf-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV6DL6LYMNBBEPUR6ZQKGQEVYOGLBA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The H3 has a clock gate definition similar to the other Allwinner SoCs,
but with a different parent clock for each single gate.

Adding the names of the parent clocks in both the source and output clocks
permits the use of the simple-gates driver to define the bus gates
of all known Allwinner SoCs.

Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
---
This patch replaces a part of Jens Kuske's patch
	[PATCH v5 1/4] clk: sunxi: Add H3 clocks support
---
 Documentation/devicetree/bindings/clock/sunxi.txt | 25 +++++++++++++++++++=
++++
 drivers/clk/sunxi/clk-simple-gates.c              | 14 ++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentat=
ion/devicetree/bindings/clock/sunxi.txt
index 8a47b77..5736e6d 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -70,6 +70,7 @@ Required properties:
 	"allwinner,sun8i-a23-usb-clk" - for usb gates + resets on A23
 	"allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on A80
 	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
+	"allwinner,sunxi-gates-clk" - simple gates
=20
 Required properties for all clocks:
 - reg : shall be the control register address for the clock.
@@ -93,6 +94,12 @@ The "allwinner,sun9i-a80-mmc-config-clk" clock also requ=
ires:
 - #reset-cells : shall be set to 1
 - resets : shall be the reset control phandle for the mmc block.
=20
+The "allwinner,sunxi-gates-clk" clock also requires:
+- clock-names : corresponding names of the parent clocks
+when the output clocks have different parents.
+These names must be 4 characters long and must appear as a prefix in
+the names of the output clocks. See example.
+
 For "allwinner,sun7i-a20-gmac-clk", the parent clocks shall be fixed rate
 dummy clocks at 25 MHz and 125 MHz, respectively. See example.
=20
@@ -203,3 +210,21 @@ mmc_config_clk: clk@01c13000 {
 	clock-output-names =3D "mmc0_config", "mmc1_config",
 			     "mmc2_config", "mmc3_config";
 };
+
+bus_gates: clk@01c20060 {
+	compatible =3D "allwinner,sunxi-gates-clk";
+	reg =3D <0x01c20060 0x14>;
+	clocks =3D <&ahb1>, <&ahb2>;
+	clock-names =3D "ahb1", "ahb2";
+	clock-indices =3D <5>, <6>, <8>,
+			<17>, <18>,
+			<26>, <27>,
+			<28>, <29>,
+			<128>, <135>;
+	clock-output-names =3D "ahb1_ce", "ahb1_dma", "ahb1_mmc0",
+			     "ahb2_emac", "ahb1_ts",
+			     "ahb1_ehci2", "ahb1_ehci3",
+			     "ahb1_otg_ohci0", "ahb2_ohci1",
+			     "ahb1_ephy", "ahb1_dbg";
+	};
+};
diff --git a/drivers/clk/sunxi/clk-simple-gates.c b/drivers/clk/sunxi/clk-s=
imple-gates.c
index 0214c65..81c4cb0 100644
--- a/drivers/clk/sunxi/clk-simple-gates.c
+++ b/drivers/clk/sunxi/clk-simple-gates.c
@@ -29,12 +29,14 @@ static void __init sunxi_simple_gates_setup(struct devi=
ce_node *node,
 {
 	struct clk_onecell_data *clk_data;
 	const char *clk_parent, *clk_name;
+	char dyn_clk_parent[8];
 	struct property *prop;
 	struct resource res;
 	void __iomem *clk_reg;
 	void __iomem *reg;
 	const __be32 *p;
 	int number, i =3D 0, j;
+	bool parent_per_gate;
 	u8 clk_bit;
 	u32 index;
=20
@@ -42,7 +44,13 @@ static void __init sunxi_simple_gates_setup(struct devic=
e_node *node,
 	if (IS_ERR(reg))
 		return;
=20
-	clk_parent =3D of_clk_get_parent_name(node, 0);
+	parent_per_gate =3D of_clk_get_parent_count(node) !=3D 1;
+	if (parent_per_gate) {
+		clk_parent =3D dyn_clk_parent;
+		dyn_clk_parent[4] =3D '\0';
+	} else {
+		clk_parent =3D of_clk_get_parent_name(node, 0);
+	}
=20
 	clk_data =3D kmalloc(sizeof(struct clk_onecell_data), GFP_KERNEL);
 	if (!clk_data)
@@ -58,6 +66,8 @@ static void __init sunxi_simple_gates_setup(struct device=
_node *node,
 	of_property_for_each_u32(node, "clock-indices", prop, p, index) {
 		of_property_read_string_index(node, "clock-output-names",
 					      i, &clk_name);
+		if (parent_per_gate)
+			strncpy(dyn_clk_parent, clk_name, 4);
=20
 		clk_reg =3D reg + 4 * (index / 32);
 		clk_bit =3D index % 32;
@@ -140,6 +150,8 @@ CLK_OF_DECLARE(sun9i_a80_apb0, "allwinner,sun9i-a80-apb=
0-gates-clk",
 	       sunxi_simple_gates_init);
 CLK_OF_DECLARE(sun9i_a80_apb1, "allwinner,sun9i-a80-apb1-gates-clk",
 	       sunxi_simple_gates_init);
+CLK_OF_DECLARE(sunxi_gates, "allwinner,sunxi-gates-clk",sunxi-gates
+	       sunxi_simple_gates_init);
=20
 static const int sun4i_a10_ahb_critical_clocks[] __initconst =3D {
 	14,	/* ahb_sdram */

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
