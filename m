From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 0/6] ARM: sunxi: Introduce Allwinner H3 support
Date: Thu, 22 Oct 2015 09:58:56 +0200
Message-ID: <20151022095857.50e2330b@OPI2>
References: <1445444007-4260-1-git-send-email-jenskuske@gmail.com>
 <5627E515.6050505@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5627E515.6050505@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jens Kuske <jenskuske@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Emilio =?UTF-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, devicetree@vger.kernel.org, Vishnu Patekar <vishnupatekar0510@gmail.com>, "Reinder E.N. de Haan" <reinder@mveas.com>, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org, zhao_steven@263.net
List-Id: devicetree@vger.kernel.org

On Wed, 21 Oct 2015 21:18:45 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Great to see that you've started working on this again. Last weekend =
I
> ended up working on this too together with Reinder E.N. de Haan <rein=
der@mveas.com>
> (added to the Cc).
>=20
> We took a slightly different approach for the gates clocks, see:
>=20
> https://github.com/jwrdegoede/linux-sunxi/commits/sunxi-wip
>=20
> And specifically:
>=20
> https://github.com/jwrdegoede/linux-sunxi/commit/80a1afe319d5d1a0c426=
d42e75d37f0c64e8ea0b
>=20
> Combined with:
>=20
> https://github.com/jwrdegoede/linux-sunxi/commit/d508da5feb5048f6674d=
6b24b58ac9058fb9d877
>=20
> This deals with the per gate parents the same way the rockchip
> clock code does, and it seems to be quite a bit less code then your s=
olution.

Here is a simpler patch:

diff --git a/drivers/clk/sunxi/clk-simple-gates.c b/drivers/clk/sunxi/c=
lk-simple-gates.c
index 6ce9118..8fecaeab 100644
--- a/drivers/clk/sunxi/clk-simple-gates.c
+++ b/drivers/clk/sunxi/clk-simple-gates.c
@@ -35,6 +35,7 @@ static void __init sunxi_simple_gates_setup(struct de=
vice_node *node,
 	void __iomem *reg;
 	const __be32 *p;
 	int number, i =3D 0, j;
+	bool parent_per_gate;
 	u8 clk_bit;
 	u32 index;
=20
@@ -43,6 +44,7 @@ static void __init sunxi_simple_gates_setup(struct de=
vice_node *node,
 		return;
=20
 	clk_parent =3D of_clk_get_parent_name(node, 0);
+	parent_per_gate =3D of_clk_get_parent_count(node) !=3D 1;
=20
 	clk_data =3D kmalloc(sizeof(struct clk_onecell_data), GFP_KERNEL);
 	if (!clk_data)
@@ -58,6 +60,8 @@ static void __init sunxi_simple_gates_setup(struct de=
vice_node *node,
 	of_property_for_each_u32(node, "clock-indices", prop, p, index) {
 		of_property_read_string_index(node, "clock-output-names",
 					      i, &clk_name);
+		if (parent_per_gate)
+			clk_parent =3D of_clk_get_parent_name(node, i);
=20
 		clk_reg =3D reg + 4 * (index / 32);
 		clk_bit =3D index % 32;


--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
