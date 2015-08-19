From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: [PATCH 2/2] drivers: clk: st: Rename st_pll3200c32_407_c0_x into st_pll3200c32_cx_x
Date: Wed, 19 Aug 2015 10:48:14 +0200
Message-ID: <1439974094-32322-3-git-send-email-gabriel.fernandez@linaro.org>
References: <1439974094-32322-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439974094-32322-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabian Frederick <fabf@skynet.be>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Use a generic name for this kind of PLL

Correction in dts files are already done here:
commit 5eb26c605909 ("ARM: STi: DT: Rename st_pll3200c32_407_c0_x into st_pll3200c32_cx_x")

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 drivers/clk/st/clkgen-fsyn.c |  8 ++++----
 drivers/clk/st/clkgen-pll.c  | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index 83ccf14..576cd03 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -307,7 +307,7 @@ static const struct clkgen_quadfs_data st_fs660c32_F_416 = {
 	.get_rate	= clk_fs660c32_dig_get_rate,
 };
 
-static const struct clkgen_quadfs_data st_fs660c32_C_407 = {
+static const struct clkgen_quadfs_data st_fs660c32_C = {
 	.nrst_present = true,
 	.nrst	= { CLKGEN_FIELD(0x2f0, 0x1, 0),
 		    CLKGEN_FIELD(0x2f0, 0x1, 1),
@@ -350,7 +350,7 @@ static const struct clkgen_quadfs_data st_fs660c32_C_407 = {
 	.get_rate	= clk_fs660c32_dig_get_rate,
 };
 
-static const struct clkgen_quadfs_data st_fs660c32_D_407 = {
+static const struct clkgen_quadfs_data st_fs660c32_D = {
 	.nrst_present = true,
 	.nrst	= { CLKGEN_FIELD(0x2a0, 0x1, 0),
 		    CLKGEN_FIELD(0x2a0, 0x1, 1),
@@ -1077,11 +1077,11 @@ static const struct of_device_id quadfs_of_match[] = {
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
index 47a38a9..b2a332c 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -193,7 +193,7 @@ static const struct clkgen_pll_data st_pll3200c32_407_a0 = {
 	.ops		= &stm_pll3200c32_ops,
 };
 
-static const struct clkgen_pll_data st_pll3200c32_407_c0_0 = {
+static const struct clkgen_pll_data st_pll3200c32_cx_0 = {
 	/* 407 C0 PLL0 */
 	.pdn_status	= CLKGEN_FIELD(0x2a0,	0x1,			8),
 	.locked_status	= CLKGEN_FIELD(0x2a0,	0x1,			24),
@@ -205,7 +205,7 @@ static const struct clkgen_pll_data st_pll3200c32_407_c0_0 = {
 	.ops		= &stm_pll3200c32_ops,
 };
 
-static const struct clkgen_pll_data st_pll3200c32_407_c0_1 = {
+static const struct clkgen_pll_data st_pll3200c32_cx_1 = {
 	/* 407 C0 PLL1 */
 	.pdn_status	= CLKGEN_FIELD(0x2c8,	0x1,			8),
 	.locked_status	= CLKGEN_FIELD(0x2c8,	0x1,			24),
@@ -624,12 +624,12 @@ static const struct of_device_id c32_pll_of_match[] = {
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
