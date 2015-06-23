From: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 8/9] drivers: clk: st: Rename st_pll3200c32_407_c0_x into st_pll3200c32_cx_x
Date: Tue, 23 Jun 2015 16:09:26 +0200
Message-ID: <1435068567-30995-9-git-send-email-gabriel.fernandez@linaro.org>
References: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435068567-30995-1-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>, Olivier Bideau <olivier.bideau-qxv4g6HH51o@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use a generic name for this kind of PLL

Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clk/st/clkgen-fsyn.c |  8 ++++----
 drivers/clk/st/clkgen-pll.c  | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index d9eb2e1..a2239cf 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -306,7 +306,7 @@ static const struct clkgen_quadfs_data st_fs660c32_F_416 = {
 	.get_rate	= clk_fs660c32_dig_get_rate,
 };
 
-static const struct clkgen_quadfs_data st_fs660c32_C_407 = {
+static const struct clkgen_quadfs_data st_fs660c32_C = {
 	.nrst_present = true,
 	.nrst	= { CLKGEN_FIELD(0x2f0, 0x1, 0),
 		    CLKGEN_FIELD(0x2f0, 0x1, 1),
@@ -349,7 +349,7 @@ static const struct clkgen_quadfs_data st_fs660c32_C_407 = {
 	.get_rate	= clk_fs660c32_dig_get_rate,
 };
 
-static const struct clkgen_quadfs_data st_fs660c32_D_407 = {
+static const struct clkgen_quadfs_data st_fs660c32_D = {
 	.nrst_present = true,
 	.nrst	= { CLKGEN_FIELD(0x2a0, 0x1, 0),
 		    CLKGEN_FIELD(0x2a0, 0x1, 1),
@@ -1076,11 +1076,11 @@ static const struct of_device_id quadfs_of_match[] = {
 	},
 	{
 		.compatible = "st,stih407-quadfs660-C",
-		.data = &st_fs660c32_C_407
+		.data = &st_fs660c32_C
 	},
 	{
 		.compatible = "st,stih407-quadfs660-D",
-		.data = &st_fs660c32_D_407
+		.data = &st_fs660c32_D
 	},
 	{}
 };
diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index 72d1c27..6742b3d 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -192,7 +192,7 @@ static const struct clkgen_pll_data st_pll3200c32_407_a0 = {
 	.ops		= &stm_pll3200c32_ops,
 };
 
-static const struct clkgen_pll_data st_pll3200c32_407_c0_0 = {
+static const struct clkgen_pll_data st_pll3200c32_cx_0 = {
 	/* 407 C0 PLL0 */
 	.pdn_status	= CLKGEN_FIELD(0x2a0,	0x1,			8),
 	.locked_status	= CLKGEN_FIELD(0x2a0,	0x1,			24),
@@ -204,7 +204,7 @@ static const struct clkgen_pll_data st_pll3200c32_407_c0_0 = {
 	.ops		= &stm_pll3200c32_ops,
 };
 
-static const struct clkgen_pll_data st_pll3200c32_407_c0_1 = {
+static const struct clkgen_pll_data st_pll3200c32_cx_1 = {
 	/* 407 C0 PLL1 */
 	.pdn_status	= CLKGEN_FIELD(0x2c8,	0x1,			8),
 	.locked_status	= CLKGEN_FIELD(0x2c8,	0x1,			24),
@@ -623,12 +623,12 @@ static const struct of_device_id c32_pll_of_match[] = {
 		.data = &st_pll3200c32_407_a0,
 	},
 	{
-		.compatible = "st,stih407-plls-c32-c0_0",
-		.data = &st_pll3200c32_407_c0_0,
+		.compatible = "st,plls-c32-cx_0",
+		.data = &st_pll3200c32_cx_0,
 	},
 	{
-		.compatible = "st,stih407-plls-c32-c0_1",
-		.data = &st_pll3200c32_407_c0_1,
+		.compatible = "st,plls-c32-cx_1",
+		.data = &st_pll3200c32_cx_1,
 	},
 	{
 		.compatible = "st,stih407-plls-c32-a9",
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
