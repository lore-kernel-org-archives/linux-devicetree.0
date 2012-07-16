From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 6/7] ARM: EXYNOS5: Add the bus clock for FIMD
Date: Mon, 16 Jul 2012 17:41:25 +0530
Message-ID: <1342440686-21860-7-git-send-email-l.krishna@samsung.com>
References: <1342440686-21860-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1342440686-21860-1-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Leela Krishna <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

This patch adds the bus clock for FIMD and changes
the device name for lcd clock

Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-exynos/clock-exynos5.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index fefa336..61bf88d 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -629,6 +629,11 @@ static struct clk exynos5_init_clocks_off[] = {
 		.enable		= exynos5_clk_ip_disp1_ctrl,
 		.ctrlbit	= (1 << 3),
 	}, {
+		.name           = "fimd",
+		.devname        = "exynos5-fb",
+		.enable         = exynos5_clk_ip_disp1_ctrl,
+		.ctrlbit        = (1 << 0),
+	}, {
 		.name		= "iis",
 		.devname	= "samsung-i2s.1",
 		.enable		= exynos5_clk_ip_peric_ctrl,
@@ -1046,7 +1051,7 @@ static struct clksrc_clk exynos5_clksrcs[] = {
 	}, {
 		.clk	= {
 			.name		= "sclk_fimd",
-			.devname	= "s3cfb.1",
+			.devname	= "exynos5-fb",
 			.enable		= exynos5_clksrc_mask_disp1_0_ctrl,
 			.ctrlbit	= (1 << 0),
 		},
-- 
1.7.0.4
