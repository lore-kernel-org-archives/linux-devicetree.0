From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/2] clk: fixed-rate: use full DT node name
Date: Thu, 13 Feb 2014 23:16:52 -0700
Message-ID: <1392358613-19962-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

clk-fixed-rate currently names clocks according to a node's name without
the unit address. When faced with the legal and technically correct DT
structure below, this causes rgistration attempts for 3 clocks with the
same name, 2 of which fail.

	clocks {
		compatible = "simple-bus";
		#address-cells = <1>;
		#size-cells = <0>;

		clk_mmc: clock@0 {
			compatible = "fixed-clock";
			reg = <0>;
...
		clk_i2c: clock@1 {
			compatible = "fixed-clock";
			reg = <1>;
...
		clk_spi: clock@2 {
			compatible = "fixed-clock";
			reg = <2>;
...

Solve this by naming the clocks after the full node name rather than the
short version (e.g. /clocks/clock@0).

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
Note that if this is accepted, I intend to submit a patch for the RPi DTS
which uses the naming structure above, so it might be useful to place this
patch in its own branch. Or, I could submit the cleanup after 3.15-rc1.
---
 drivers/clk/clk-fixed-rate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index 0fc56ab..3335b3c 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -115,7 +115,7 @@ EXPORT_SYMBOL_GPL(clk_register_fixed_rate);
 void of_fixed_clk_setup(struct device_node *node)
 {
 	struct clk *clk;
-	const char *clk_name = node->name;
+	const char *clk_name = node->full_name;
 	u32 rate;
 	u32 accuracy = 0;
 
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
