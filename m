From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH v2 2/3] clk: at91: sckc: add support for SAM9X60
Date: Thu, 14 Feb 2019 12:14:32 +0000
Message-ID: <1550146447-1441-3-git-send-email-claudiu.beznea@microchip.com>
References: <1550146447-1441-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550146447-1441-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Add support for SAM9X60.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clk/at91/sckc.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index b7163d3a2269..b3075c51d260 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -459,6 +459,36 @@ static void __init of_at91sam9x5_sckc_setup(struct dev=
ice_node *np)
 CLK_OF_DECLARE(at91sam9x5_clk_sckc, "atmel,at91sam9x5-sckc",
 	       of_at91sam9x5_sckc_setup);
=20
+static const struct clk_slow_offsets at91sam9x60_offsets =3D {
+	.cr_rcen =3D AT91_SCKC_OFFSET_INVALID,
+	.cr_osc32en =3D 1,
+	.cr_osc32byp =3D 2,
+	.cr_oscsel =3D 24,
+};
+
+static void __init of_at91sam9x60_sckc_setup(struct device_node *np)
+{
+	struct device_node *childnp;
+	void (*clk_setup)(struct device_node *np, void __iomem *io,
+			  const struct clk_slow_offsets *offsets);
+	const struct of_device_id *clk_id;
+	void __iomem *regbase =3D of_iomap(np, 0);
+
+	if (!regbase)
+		return;
+
+	for_each_child_of_node(np, childnp) {
+		clk_id =3D of_match_node(sckc_clk_ids, childnp);
+		if (!clk_id)
+			continue;
+		clk_setup =3D clk_id->data;
+		clk_setup(childnp, regbase, &at91sam9x60_offsets);
+	}
+}
+
+CLK_OF_DECLARE(at91sam9x60_clk_sckc, "microchip,sam9x60-sckc",
+	       of_at91sam9x60_sckc_setup);
+
 static int clk_sama5d4_slow_osc_prepare(struct clk_hw *hw)
 {
 	struct clk_sama5d4_slow_osc *osc =3D to_clk_sama5d4_slow_osc(hw);
--=20
2.7.4
