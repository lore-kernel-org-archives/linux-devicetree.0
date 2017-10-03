From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/2] pinctrl: rza1: add support for RZ/A1L
Date: Tue,  3 Oct 2017 02:33:33 -0500
Message-ID: <20171003073334.18917-2-chris.brandt@renesas.com>
References: <20171003073334.18917-1-chris.brandt@renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171003073334.18917-1-chris.brandt@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Aspects like the number of ports and the location where peripherals are
brought out differ between the RZ/A1H and RZ/A1L.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/pinctrl/pinctrl-rza1.c | 134 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 04d058706b80..717c0f4449a0 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -302,6 +302,134 @@ static const struct rza1_pinmux_conf rza1h_pmx_conf = {
 	.swio_entries	= rza1h_swio_entries,
 };
 
+/* ----------------------------------------------------------------------------
+ * RZ/A1L (r7s72102) pinmux flags
+ */
+
+static const struct rza1_bidir_pin rza1l_bidir_pins_p1[] = {
+	{ .pin = 0, .func = 1 },
+	{ .pin = 1, .func = 1 },
+	{ .pin = 2, .func = 1 },
+	{ .pin = 3, .func = 1 },
+	{ .pin = 4, .func = 1 },
+	{ .pin = 5, .func = 1 },
+	{ .pin = 6, .func = 1 },
+	{ .pin = 7, .func = 1 },
+};
+
+static const struct rza1_bidir_pin rza1l_bidir_pins_p3[] = {
+	{ .pin = 0, .func = 2 },
+	{ .pin = 1, .func = 2 },
+	{ .pin = 2, .func = 2 },
+	{ .pin = 4, .func = 2 },
+	{ .pin = 5, .func = 2 },
+	{ .pin = 10, .func = 2 },
+	{ .pin = 11, .func = 2 },
+	{ .pin = 12, .func = 2 },
+	{ .pin = 13, .func = 2 },
+};
+
+static const struct rza1_bidir_pin rza1l_bidir_pins_p4[] = {
+	{ .pin = 1, .func = 4 },
+	{ .pin = 2, .func = 2 },
+	{ .pin = 3, .func = 2 },
+	{ .pin = 6, .func = 2 },
+	{ .pin = 7, .func = 2 },
+};
+
+static const struct rza1_bidir_pin rza1l_bidir_pins_p5[] = {
+	{ .pin = 0, .func = 1 },
+	{ .pin = 1, .func = 1 },
+	{ .pin = 2, .func = 1 },
+	{ .pin = 3, .func = 1 },
+	{ .pin = 4, .func = 1 },
+	{ .pin = 5, .func = 1 },
+	{ .pin = 6, .func = 1 },
+	{ .pin = 7, .func = 1 },
+	{ .pin = 8, .func = 1 },
+	{ .pin = 9, .func = 1 },
+	{ .pin = 10, .func = 1 },
+	{ .pin = 11, .func = 1 },
+	{ .pin = 12, .func = 1 },
+	{ .pin = 13, .func = 1 },
+	{ .pin = 14, .func = 1 },
+	{ .pin = 15, .func = 1 },
+	{ .pin = 0, .func = 2 },
+	{ .pin = 1, .func = 2 },
+	{ .pin = 2, .func = 2 },
+	{ .pin = 3, .func = 2 },
+};
+
+static const struct rza1_bidir_pin rza1l_bidir_pins_p6[] = {
+	{ .pin = 0, .func = 1 },
+	{ .pin = 1, .func = 1 },
+	{ .pin = 2, .func = 1 },
+	{ .pin = 3, .func = 1 },
+	{ .pin = 4, .func = 1 },
+	{ .pin = 5, .func = 1 },
+	{ .pin = 6, .func = 1 },
+	{ .pin = 7, .func = 1 },
+	{ .pin = 8, .func = 1 },
+	{ .pin = 9, .func = 1 },
+	{ .pin = 10, .func = 1 },
+	{ .pin = 11, .func = 1 },
+	{ .pin = 12, .func = 1 },
+	{ .pin = 13, .func = 1 },
+	{ .pin = 14, .func = 1 },
+	{ .pin = 15, .func = 1 },
+};
+
+static const struct rza1_bidir_pin rza1l_bidir_pins_p7[] = {
+	{ .pin = 2, .func = 2 },
+	{ .pin = 3, .func = 2 },
+	{ .pin = 5, .func = 2 },
+	{ .pin = 6, .func = 2 },
+	{ .pin = 7, .func = 2 },
+	{ .pin = 2, .func = 3 },
+	{ .pin = 3, .func = 3 },
+	{ .pin = 5, .func = 3 },
+	{ .pin = 6, .func = 3 },
+	{ .pin = 7, .func = 3 },
+};
+
+static const struct rza1_bidir_pin rza1l_bidir_pins_p9[] = {
+	{ .pin = 1, .func = 2 },
+	{ .pin = 0, .func = 3 },
+	{ .pin = 1, .func = 3 },
+	{ .pin = 3, .func = 3 },
+	{ .pin = 4, .func = 3 },
+	{ .pin = 5, .func = 3 },
+};
+
+static const struct rza1_swio_pin rza1l_swio_pins[] = {
+	{ .port = 2, .pin = 8, .func = 2, .input = 0 },
+	{ .port = 5, .pin = 6, .func = 3, .input = 0 },
+	{ .port = 6, .pin = 6, .func = 3, .input = 0 },
+	{ .port = 6, .pin = 10, .func = 3, .input = 0 },
+	{ .port = 7, .pin = 10, .func = 2, .input = 0 },
+	{ .port = 8, .pin = 2, .func = 3, .input = 0 },
+};
+
+static const struct rza1_bidir_entry rza1l_bidir_entries[RZA1_NPORTS] = {
+	[1] = { ARRAY_SIZE(rza1l_bidir_pins_p1), rza1l_bidir_pins_p1 },
+	[3] = { ARRAY_SIZE(rza1l_bidir_pins_p3), rza1l_bidir_pins_p3 },
+	[4] = { ARRAY_SIZE(rza1l_bidir_pins_p4), rza1l_bidir_pins_p4 },
+	[5] = { ARRAY_SIZE(rza1l_bidir_pins_p4), rza1l_bidir_pins_p5 },
+	[6] = { ARRAY_SIZE(rza1l_bidir_pins_p6), rza1l_bidir_pins_p6 },
+	[7] = { ARRAY_SIZE(rza1l_bidir_pins_p7), rza1l_bidir_pins_p7 },
+	[9] = { ARRAY_SIZE(rza1l_bidir_pins_p9), rza1l_bidir_pins_p9 },
+};
+
+static const struct rza1_swio_entry rza1l_swio_entries[] = {
+	[0] = { ARRAY_SIZE(rza1h_swio_pins), rza1h_swio_pins },
+};
+
+/* RZ/A1L (r7s72102x) pinmux flags table */
+static const struct rza1_pinmux_conf rza1l_pmx_conf = {
+	.bidir_entries	= rza1l_bidir_entries,
+	.swio_entries	= rza1l_swio_entries,
+};
+
 /* ----------------------------------------------------------------------------
  * RZ/A1 types
  */
@@ -1283,9 +1411,15 @@ static int rza1_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id rza1_pinctrl_of_match[] = {
 	{
+		/* RZ/A1H, RZ/A1M */
 		.compatible	= "renesas,r7s72100-ports",
 		.data		= &rza1h_pmx_conf,
 	},
+	{
+		/* RZ/A1L */
+		.compatible	= "renesas,r7s72102-ports",
+		.data		= &rza1l_pmx_conf,
+	},
 	{ }
 };
 
-- 
2.14.1


