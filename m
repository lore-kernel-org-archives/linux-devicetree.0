From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 4/5] nvmem: sunxi-sid: add support for H6's SID controller
Date: Sun, 17 Feb 2019 11:23:15 -0500
Message-ID: <20190217162316.14111-5-tiny.windzz@gmail.com>
References: <20190217162316.14111-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190217162316.14111-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

Add support for H6's SID controller. It supports 4K-bit
EFUSE, bigger than before.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/nvmem/sunxi_sid.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index 036029e90921..8692b58d76ce 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -224,12 +224,18 @@ static const struct sunxi_sid_cfg sun50i_h5_cfg = {
 	.size = 0x100,
 };
 
+static const struct sunxi_sid_cfg sun50i_h6_cfg = {
+	.value_offset = 0x200,
+	.size = 0x200,
+};
+
 static const struct of_device_id sunxi_sid_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-sid", .data = &sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun7i-a20-sid", .data = &sun7i_a20_cfg },
 	{ .compatible = "allwinner,sun8i-h3-sid", .data = &sun8i_h3_cfg },
 	{ .compatible = "allwinner,sun50i-a64-sid", .data = &sun50i_a64_cfg },
 	{ .compatible = "allwinner,sun50i-h5-sid", .data = &sun50i_h5_cfg },
+	{ .compatible = "allwinner,sun50i-h6-sid", .data = &sun50i_h6_cfg },
 	{/* sentinel */},
 };
 MODULE_DEVICE_TABLE(of, sunxi_sid_of_match);
-- 
2.17.0
