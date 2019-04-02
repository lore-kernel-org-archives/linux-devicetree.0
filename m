From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v2 5/5] nvmem: sunxi-sid: add support for H6's SID controller
Date: Tue,  2 Apr 2019 11:45:14 -0400
Message-ID: <20190402154514.11284-6-tiny.windzz@gmail.com>
References: <20190402154514.11284-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402154514.11284-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

Add support for H6's SID controller. It supports 4K-bit
EFUSE, bigger than before. And convert to use sunxi_sid_read_native
func.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/nvmem/sunxi_sid.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index 5b8a42f686cd..3c2b06140490 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -239,11 +239,18 @@ static const struct sunxi_sid_cfg sun50i_a64_cfg = {
 	.size = 0x100,
 };
 
+static const struct sunxi_sid_cfg sun50i_h6_cfg = {
+	.value_offset = 0x200,
+	.size = 0x200,
+	.native_endian = true,
+};
+
 static const struct of_device_id sunxi_sid_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-sid", .data = &sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun7i-a20-sid", .data = &sun7i_a20_cfg },
 	{ .compatible = "allwinner,sun8i-h3-sid", .data = &sun8i_h3_cfg },
 	{ .compatible = "allwinner,sun50i-a64-sid", .data = &sun50i_a64_cfg },
+	{ .compatible = "allwinner,sun50i-h6-sid", .data = &sun50i_h6_cfg },
 	{/* sentinel */},
 };
 MODULE_DEVICE_TABLE(of, sunxi_sid_of_match);
-- 
2.17.0
