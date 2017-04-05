From: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 3/3] clk: vc5: Add support for IDT VersaClock 5P49V5935
Date: Wed, 5 Apr 2017 14:46:59 +0300
Message-ID: <1491392819-698-4-git-send-email-alexey_firago@mentor.com>
References: <1491392819-698-1-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491392819-698-1-git-send-email-alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update IDT VersaClock 5 driver to support 5P49V5935. This chip has
two clock inputs (internal XTAL or external CLKIN), four fractional
dividers (FODs) and five clock outputs (four universal clock outputs
and one reference clock output at OUT0_SELB_I2C).

Current driver supports up to 2 FODs and up to 3 clock outputs. This
patch sets max number of supported FODs to 4 and max number of supported
clock outputs to 5.

Signed-off-by: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/clk-versaclock5.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 7d31390..4c268e3 100644
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
@@ -798,9 +800,17 @@ static const struct vc5_chip_info idt_5p49v5933_info = {
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
@@ -808,6 +818,7 @@ MODULE_DEVICE_TABLE(i2c, vc5_id);
 static const struct of_device_id clk_vc5_of_match[] = {
 	{ .compatible = "idt,5p49v5923", .data = &idt_5p49v5923_info },
 	{ .compatible = "idt,5p49v5933", .data = &idt_5p49v5933_info },
+	{ .compatible = "idt,5p49v5935", .data = &idt_5p49v5935_info },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
