From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] clk: vc5: Add support for IDT VersaClock 5P49V5925
Date: Fri,  7 Jul 2017 04:57:48 +0300
Message-ID: <1499392668-9062-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1499392623-9011-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499392623-9011-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Vladimir Barinov <vladimir.barinov+renesas-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

Update IDT VersaClock 5 driver to support 5P49V5925. This chip has only
external clock input, four fractional dividers (FODs) and five clock
outputs (four universal clock outputs and one reference clock output at
OUT0_SELB_I2C).

Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
---
 drivers/clk/clk-versaclock5.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index ea7d552..88b749d 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -126,6 +126,7 @@
 /* Supported IDT VC5 models. */
 enum vc5_model {
 	IDT_VC5_5P49V5923,
+	IDT_VC5_5P49V5925,
 	IDT_VC5_5P49V5933,
 	IDT_VC5_5P49V5935,
 };
@@ -595,6 +596,7 @@ static int vc5_map_index_to_output(const enum vc5_model model,
 	case IDT_VC5_5P49V5933:
 		return (n == 0) ? 0 : 3;
 	case IDT_VC5_5P49V5923:
+	case IDT_VC5_5P49V5925:
 	case IDT_VC5_5P49V5935:
 	default:
 		return n;
@@ -785,6 +787,13 @@ static int vc5_remove(struct i2c_client *client)
 	.flags = 0,
 };
 
+static const struct vc5_chip_info idt_5p49v5925_info = {
+	.model = IDT_VC5_5P49V5925,
+	.clk_fod_cnt = 4,
+	.clk_out_cnt = 5,
+	.flags = 0,
+};
+
 static const struct vc5_chip_info idt_5p49v5933_info = {
 	.model = IDT_VC5_5P49V5933,
 	.clk_fod_cnt = 2,
@@ -801,6 +810,7 @@ static int vc5_remove(struct i2c_client *client)
 
 static const struct i2c_device_id vc5_id[] = {
 	{ "5p49v5923", .driver_data = IDT_VC5_5P49V5923 },
+	{ "5p49v5925", .driver_data = IDT_VC5_5P49V5925 },
 	{ "5p49v5933", .driver_data = IDT_VC5_5P49V5933 },
 	{ "5p49v5935", .driver_data = IDT_VC5_5P49V5935 },
 	{ }
@@ -809,6 +819,7 @@ static int vc5_remove(struct i2c_client *client)
 
 static const struct of_device_id clk_vc5_of_match[] = {
 	{ .compatible = "idt,5p49v5923", .data = &idt_5p49v5923_info },
+	{ .compatible = "idt,5p49v5925", .data = &idt_5p49v5925_info },
 	{ .compatible = "idt,5p49v5933", .data = &idt_5p49v5933_info },
 	{ .compatible = "idt,5p49v5935", .data = &idt_5p49v5935_info },
 	{ },
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
