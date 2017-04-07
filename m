From: Alexey Firago <alexey_firago@mentor.com>
Subject: [PATCH v4 3/3] clk: vc5: Add support for IDT VersaClock 5P49V5935
Date: Fri, 7 Apr 2017 12:12:24 +0300
Message-ID: <1491556344-9465-4-git-send-email-alexey_firago@mentor.com>
References: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, marek.vasut@gmail.com, geert@linux-m68k.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: Alexey Firago <alexey_firago@mentor.com>
List-Id: devicetree@vger.kernel.org

Update IDT VersaClock 5 driver to support 5P49V5935. This chip has
two clock inputs (internal XTAL or external CLKIN), four fractional
dividers (FODs) and five clock outputs (four universal clock outputs
and one reference clock output at OUT0_SELB_I2C).

Current driver supports up to 2 FODs and up to 3 clock outputs. This
patch sets max number of supported FODs to 4 and max number of supported
clock outputs to 5.

Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
---
 drivers/clk/clk-versaclock5.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 2b1cc69..ea7d552 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -114,10 +114,10 @@
 #define VC5_MUX_IN_CLKIN	BIT(1)
 
 /* Maximum number of clk_out supported by this driver */
-#define VC5_MAX_CLK_OUT_NUM	3
+#define VC5_MAX_CLK_OUT_NUM	5
 
 /* Maximum number of FODs supported by this driver */
-#define VC5_MAX_FOD_NUM	2
+#define VC5_MAX_FOD_NUM	4
 
 /* flags to describe chip features */
 /* chip has built-in oscilator */
@@ -127,6 +127,7 @@
 enum vc5_model {
 	IDT_VC5_5P49V5923,
 	IDT_VC5_5P49V5933,
+	IDT_VC5_5P49V5935,
 };
 
 /* Structure to describe features of a particular VC5 model */
@@ -594,6 +595,7 @@ static int vc5_map_index_to_output(const enum vc5_model model,
 	case IDT_VC5_5P49V5933:
 		return (n == 0) ? 0 : 3;
 	case IDT_VC5_5P49V5923:
+	case IDT_VC5_5P49V5935:
 	default:
 		return n;
 	}
@@ -790,9 +792,17 @@ static const struct vc5_chip_info idt_5p49v5933_info = {
 	.flags = VC5_HAS_INTERNAL_XTAL,
 };
 
+static const struct vc5_chip_info idt_5p49v5935_info = {
+	.model = IDT_VC5_5P49V5935,
+	.clk_fod_cnt = 4,
+	.clk_out_cnt = 5,
+	.flags = VC5_HAS_INTERNAL_XTAL,
+};
+
 static const struct i2c_device_id vc5_id[] = {
 	{ "5p49v5923", .driver_data = IDT_VC5_5P49V5923 },
 	{ "5p49v5933", .driver_data = IDT_VC5_5P49V5933 },
+	{ "5p49v5935", .driver_data = IDT_VC5_5P49V5935 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vc5_id);
@@ -800,6 +810,7 @@ MODULE_DEVICE_TABLE(i2c, vc5_id);
 static const struct of_device_id clk_vc5_of_match[] = {
 	{ .compatible = "idt,5p49v5923", .data = &idt_5p49v5923_info },
 	{ .compatible = "idt,5p49v5933", .data = &idt_5p49v5933_info },
+	{ .compatible = "idt,5p49v5935", .data = &idt_5p49v5935_info },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
-- 
2.7.4

