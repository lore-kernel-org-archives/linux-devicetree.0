From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v3 01/14] drivers: soc: sunxi: Add support for the C1 SRAM region
Date: Mon,  7 May 2018 14:44:47 +0200
Message-ID: <20180507124500.20434-2-paul.kocialkowski@bootlin.com>
References: <20180507124500.20434-1-paul.kocialkowski@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180507124500.20434-1-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S . Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Hans Verkuil <hans.verkuil@cisco.com>, Arnd Bergmann <arnd@arndb.de>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>, Yannick Fertre <yannick.fertre@st.co>
List-Id: devicetree@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

This introduces support for the SRAM C1 section, that is controlled by
the system controller. This SRAM area can be muxed either to the CPU
or the Video Engine, that needs this area to store various tables (e.g.
the Huffman VLD decoding tables).

This only supports devices with the same layout as the A10 (which also
includes the A13, A20, A33 and other SoCs).

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/soc/sunxi/sunxi_sram.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 882be5ed7e84..74cb81f37bd6 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -63,6 +63,12 @@ static struct sunxi_sram_desc sun4i_a10_sram_a3_a4 = {
 				  SUNXI_SRAM_MAP(1, 1, "emac")),
 };
 
+static struct sunxi_sram_desc sun4i_a10_sram_c1 = {
+	.data	= SUNXI_SRAM_DATA("C1", 0x0, 0x0, 31,
+				  SUNXI_SRAM_MAP(0, 0, "cpu"),
+				  SUNXI_SRAM_MAP(0x7fffffff, 1, "ve")),
+};
+
 static struct sunxi_sram_desc sun4i_a10_sram_d = {
 	.data	= SUNXI_SRAM_DATA("D", 0x4, 0x0, 1,
 				  SUNXI_SRAM_MAP(0, 0, "cpu"),
@@ -80,6 +86,10 @@ static const struct of_device_id sunxi_sram_dt_ids[] = {
 		.compatible	= "allwinner,sun4i-a10-sram-a3-a4",
 		.data		= &sun4i_a10_sram_a3_a4.data,
 	},
+	{
+		.compatible	= "allwinner,sun4i-a10-sram-c1",
+		.data		= &sun4i_a10_sram_c1.data,
+	},
 	{
 		.compatible	= "allwinner,sun4i-a10-sram-d",
 		.data		= &sun4i_a10_sram_d.data,
-- 
2.16.3
