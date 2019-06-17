From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 4/4] clk: kirkwood: Add support for MV98DX1135
Date: Tue, 18 Jun 2019 09:54:58 +1200
Message-ID: <20190617215458.32688-5-chris.packham@alliedtelesis.co.nz>
References: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

The 98DX1135 is a switch chip with an integrated CPU. This is similar to
the 98DX4122 except that the core clock speed is fixed to 166Mhz.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/clk/mvebu/kirkwood.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/clk/mvebu/kirkwood.c b/drivers/clk/mvebu/kirkwood.c
index 35af3aa18f1c..47680237d0be 100644
--- a/drivers/clk/mvebu/kirkwood.c
+++ b/drivers/clk/mvebu/kirkwood.c
@@ -185,6 +185,11 @@ static void __init mv88f6180_get_clk_ratio(
 	}
 }
=20
+static u32 __init mv98dx1135_get_tclk_freq(void __iomem *sar)
+{
+	return 166666667;
+}
+
 static const struct coreclk_soc_desc kirkwood_coreclks =3D {
 	.get_tclk_freq =3D kirkwood_get_tclk_freq,
 	.get_cpu_freq =3D kirkwood_get_cpu_freq,
@@ -201,6 +206,14 @@ static const struct coreclk_soc_desc mv88f6180_corec=
lks =3D {
 	.num_ratios =3D ARRAY_SIZE(kirkwood_coreclk_ratios),
 };
=20
+static const struct coreclk_soc_desc mv98dx1135_coreclks =3D {
+	.get_tclk_freq =3D mv98dx1135_get_tclk_freq,
+	.get_cpu_freq =3D kirkwood_get_cpu_freq,
+	.get_clk_ratio =3D kirkwood_get_clk_ratio,
+	.ratios =3D kirkwood_coreclk_ratios,
+	.num_ratios =3D ARRAY_SIZE(kirkwood_coreclk_ratios),
+};
+
 /*
  * Clock Gating Control
  */
@@ -325,6 +338,8 @@ static void __init kirkwood_clk_init(struct device_no=
de *np)
=20
 	if (of_device_is_compatible(np, "marvell,mv88f6180-core-clock"))
 		mvebu_coreclk_setup(np, &mv88f6180_coreclks);
+	else if (of_device_is_compatible(np, "marvell,mv98dx1135-core-clock"))
+		mvebu_coreclk_setup(np, &mv98dx1135_coreclks);
 	else
 		mvebu_coreclk_setup(np, &kirkwood_coreclks);
=20
@@ -339,3 +354,5 @@ CLK_OF_DECLARE(kirkwood_clk, "marvell,kirkwood-core-c=
lock",
 	       kirkwood_clk_init);
 CLK_OF_DECLARE(mv88f6180_clk, "marvell,mv88f6180-core-clock",
 	       kirkwood_clk_init);
+CLK_OF_DECLARE(98dx1135_clk, "marvell,mv98dx1135-core-clock",
+	       kirkwood_clk_init);
--=20
2.21.0
