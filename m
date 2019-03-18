From: Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH 5/6] nvmem: sunxi_sid: Support SID on A83T and H5
Date: Mon, 18 Mar 2019 15:33:53 +0800
Message-ID: <20190318073354.12151-6-wens@kernel.org>
References: <20190318073354.12151-1-wens@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190318073354.12151-1-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The device tree binding already lists compatible strings for these two
SoCs. They don't have the defect as seen on the H3, and the size and
register layout is the same as the A64. Furthermore, the driver does
not include nvmem cell definitions.

Add support for these two compatible strings, re-using the config for
the A64.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/nvmem/sunxi_sid.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index 14c114620ed6..e7936380ce89 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -200,8 +200,10 @@ static const struct sunxi_sid_cfg sun50i_a64_cfg = {
 static const struct of_device_id sunxi_sid_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-sid", .data = &sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun7i-a20-sid", .data = &sun7i_a20_cfg },
+	{ .compatible = "allwinner,sun8i-a83t-sid", .data = &sun50i_a64_cfg },
 	{ .compatible = "allwinner,sun8i-h3-sid", .data = &sun8i_h3_cfg },
 	{ .compatible = "allwinner,sun50i-a64-sid", .data = &sun50i_a64_cfg },
+	{ .compatible = "allwinner,sun50i-h5-sid", .data = &sun50i_a64_cfg },
 	{/* sentinel */},
 };
 MODULE_DEVICE_TABLE(of, sunxi_sid_of_match);
-- 
2.20.1
