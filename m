Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190502122657.15577-3-jonas.gorski@gmail.com>
References: <20190502122657.15577-1-jonas.gorski@gmail.com> <20190502122657.15577-3-jonas.gorski@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] clk: add BCM63XX gated clock controller driver
Date: Thu, 27 Jun 2019 13:43:17 -0700
Message-Id: <20190627204318.828302075E@mail.kernel.org>
To: Jonas Gorski <jonas.gorski@gmail.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-mips@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Kevin Cernekee <cernekee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Jonas Gorski (2019-05-02 05:26:56)
> Add a driver for the gated clock controller found on MIPS based BCM63XX
> SoCs.
>=20
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---

Applied to clk-next with some extra fixes

diff --git a/drivers/clk/bcm/clk-bcm63xx-gate.c b/drivers/clk/bcm/clk-bcm63=
xx-gate.c
index 4fd10645a192..9e1dcd43258c 100644
--- a/drivers/clk/bcm/clk-bcm63xx-gate.c
+++ b/drivers/clk/bcm/clk-bcm63xx-gate.c
@@ -1,8 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-License-Identifier: GPL-2.0
=20
 #include <linux/clk-provider.h>
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -20,7 +19,7 @@ struct clk_bcm63xx_hw {
 	struct clk_hw_onecell_data data;
 };
=20
-const struct clk_bcm63xx_table_entry bcm3368_clocks[] =3D {
+static const struct clk_bcm63xx_table_entry bcm3368_clocks[] =3D {
 	{ .name =3D "mac", .bit =3D 3, },
 	{ .name =3D "tc", .bit =3D 5, },
 	{ .name =3D "us_top", .bit =3D 6, },
@@ -41,7 +40,7 @@ const struct clk_bcm63xx_table_entry bcm3368_clocks[] =3D=
 {
 	{ },
 };
=20
-const struct clk_bcm63xx_table_entry bcm6328_clocks[] =3D {
+static const struct clk_bcm63xx_table_entry bcm6328_clocks[] =3D {
 	{ .name =3D "phy_mips", .bit =3D 0, },
 	{ .name =3D "adsl_qproc", .bit =3D 1, },
 	{ .name =3D "adsl_afe", .bit =3D 2, },
@@ -57,7 +56,7 @@ const struct clk_bcm63xx_table_entry bcm6328_clocks[] =3D=
 {
 	{ },
 };
=20
-const struct clk_bcm63xx_table_entry bcm6358_clocks[] =3D {
+static const struct clk_bcm63xx_table_entry bcm6358_clocks[] =3D {
 	{ .name =3D "enet", .bit =3D 4, },
 	{ .name =3D "adslphy", .bit =3D 5, },
 	{ .name =3D "pcm", .bit =3D 8, },
@@ -72,7 +71,7 @@ const struct clk_bcm63xx_table_entry bcm6358_clocks[] =3D=
 {
 	{ },
 };
=20
-const struct clk_bcm63xx_table_entry bcm6362_clocks[] =3D {
+static const struct clk_bcm63xx_table_entry bcm6362_clocks[] =3D {
 	{ .name =3D "adsl_qproc", .bit =3D 1, },
 	{ .name =3D "adsl_afe", .bit =3D 2, },
 	{ .name =3D "adsl", .bit =3D 3, },
@@ -95,7 +94,7 @@ const struct clk_bcm63xx_table_entry bcm6362_clocks[] =3D=
 {
 	{ },
 };
=20
-const struct clk_bcm63xx_table_entry bcm6368_clocks[] =3D {
+static const struct clk_bcm63xx_table_entry bcm6368_clocks[] =3D {
 	{ .name =3D "vdsl_qproc", .bit =3D 2, },
 	{ .name =3D "vdsl_afe", .bit =3D 3, },
 	{ .name =3D "vdsl_bonding", .bit =3D 4, },
@@ -116,7 +115,7 @@ const struct clk_bcm63xx_table_entry bcm6368_clocks[] =
=3D {
 	{ },
 };
=20
-const struct clk_bcm63xx_table_entry bcm63268_clocks[] =3D {
+static const struct clk_bcm63xx_table_entry bcm63268_clocks[] =3D {
 	{ .name =3D "disable_gless", .bit =3D 0, },
 	{ .name =3D "vdsl_qproc", .bit =3D 1, },
 	{ .name =3D "vdsl_afe", .bit =3D 2, },
@@ -225,22 +224,15 @@ static const struct of_device_id clk_bcm63xx_dt_ids[]=
 =3D {
 	{ .compatible =3D "brcm,bcm6362-clocks", .data =3D &bcm6362_clocks, },
 	{ .compatible =3D "brcm,bcm6368-clocks", .data =3D &bcm6368_clocks, },
 	{ .compatible =3D "brcm,bcm63268-clocks", .data =3D &bcm63268_clocks, },
-	{ },
+	{ }
 };
=20
-MODULE_DEVICE_TABLE(of, clk_bcm63xx_dt_ids);
-
 static struct platform_driver clk_bcm63xx =3D {
 	.probe =3D clk_bcm63xx_probe,
 	.remove =3D clk_bcm63xx_remove,
 	.driver =3D {
 		.name =3D "bcm63xx-clock",
-		.of_match_table =3D of_match_ptr(clk_bcm63xx_dt_ids),
+		.of_match_table =3D clk_bcm63xx_dt_ids,
 	},
 };
-
 builtin_platform_driver(clk_bcm63xx);
-
-MODULE_AUTHOR("Jonas Gorski <jonas.gorski@gmail.com>");
-MODULE_DESCRIPTION("BCM63XX (MIPS) gated clock controller driver");
-MODULE_LICENSE("GPL");
