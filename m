From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 1/2] ARM: exynos5: Add gate clocks for HS-I2C
Date: Fri, 28 Dec 2012 17:10:50 +0530
Message-ID: <1356694851-1345-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: w.sang@pengutronix.de, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, naveenkrishna.ch@gmail.com, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Adds clock gating bits for High Speed I2C channels 0, 1, 2 and 3.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 0208c3a..f9fa0c7 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -753,6 +753,30 @@ static struct clk exynos5_init_clocks_off[] = {
 		.enable		= exynos5_clk_ip_peric_ctrl,
 		.ctrlbit	= (1 << 27),
 	}, {
+		.name		= "hsi2c",
+		.devname	= "exynos5-hsi2c.0",
+		.enable		= exynos5_clk_ip_peric_ctrl,
+		.parent		= &exynos5_clk_aclk_66.clk,
+		.ctrlbit	= (1 << 28),
+	}, {
+		.name		= "hsi2c",
+		.devname	= "exynos5-hsi2c.1",
+		.enable		= exynos5_clk_ip_peric_ctrl,
+		.parent		= &exynos5_clk_aclk_66.clk,
+		.ctrlbit	= (1 << 29),
+	}, {
+		.name		= "hsi2c",
+		.devname	= "exynos5-hsi2c.2",
+		.enable		= exynos5_clk_ip_peric_ctrl,
+		.parent		= &exynos5_clk_aclk_66.clk,
+		.ctrlbit	= (1 << 30),
+	}, {
+		.name		= "hsi2c",
+		.devname	= "exynos5-hsi2c.3",
+		.enable		= exynos5_clk_ip_peric_ctrl,
+		.parent		= &exynos5_clk_aclk_66.clk,
+		.ctrlbit	= (1 << 31),
+	}, {
 		.name		= "usbhost",
 		.enable		= exynos5_clk_ip_fsys_ctrl ,
 		.ctrlbit	= (1 << 18),
-- 
1.7.9.5
