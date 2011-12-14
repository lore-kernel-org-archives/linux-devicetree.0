From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/9] ARM: realview: convert pl061 no irq to 0 instead of -1
Date: Wed, 14 Dec 2011 09:28:55 -0600
Message-ID: <1323876538-20406-7-git-send-email-robherring2@gmail.com>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323876538-20406-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Drivers should use 0 for no irq, so convert realview platforms pl061
platform_data over to use 0.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 arch/arm/mach-realview/realview_eb.c     |    3 ---
 arch/arm/mach-realview/realview_pb1176.c |    3 ---
 arch/arm/mach-realview/realview_pb11mp.c |    3 ---
 arch/arm/mach-realview/realview_pba8.c   |    3 ---
 arch/arm/mach-realview/realview_pbx.c    |    3 ---
 5 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-realview/realview_eb.c b/arch/arm/mach-realview/realview_eb.c
index 026c66a..57f5bac 100644
--- a/arch/arm/mach-realview/realview_eb.c
+++ b/arch/arm/mach-realview/realview_eb.c
@@ -117,17 +117,14 @@ static void __init realview_eb_map_io(void)
 
 static struct pl061_platform_data gpio0_plat_data = {
 	.gpio_base	= 0,
-	.irq_base	= -1,
 };
 
 static struct pl061_platform_data gpio1_plat_data = {
 	.gpio_base	= 8,
-	.irq_base	= -1,
 };
 
 static struct pl061_platform_data gpio2_plat_data = {
 	.gpio_base	= 16,
-	.irq_base	= -1,
 };
 
 static struct pl022_ssp_controller ssp0_plat_data = {
diff --git a/arch/arm/mach-realview/realview_pb1176.c b/arch/arm/mach-realview/realview_pb1176.c
index c057540..2267696 100644
--- a/arch/arm/mach-realview/realview_pb1176.c
+++ b/arch/arm/mach-realview/realview_pb1176.c
@@ -113,17 +113,14 @@ static void __init realview_pb1176_map_io(void)
 
 static struct pl061_platform_data gpio0_plat_data = {
 	.gpio_base	= 0,
-	.irq_base	= -1,
 };
 
 static struct pl061_platform_data gpio1_plat_data = {
 	.gpio_base	= 8,
-	.irq_base	= -1,
 };
 
 static struct pl061_platform_data gpio2_plat_data = {
 	.gpio_base	= 16,
-	.irq_base	= -1,
 };
 
 static struct pl022_ssp_controller ssp0_plat_data = {
diff --git a/arch/arm/mach-realview/realview_pb11mp.c b/arch/arm/mach-realview/realview_pb11mp.c
index 671ad6d..8622dbb 100644
--- a/arch/arm/mach-realview/realview_pb11mp.c
+++ b/arch/arm/mach-realview/realview_pb11mp.c
@@ -112,17 +112,14 @@ static void __init realview_pb11mp_map_io(void)
 
 static struct pl061_platform_data gpio0_plat_data = {
 	.gpio_base	= 0,
-	.irq_base	= -1,
 };
 
 static struct pl061_platform_data gpio1_plat_data = {
 	.gpio_base	= 8,
-	.irq_base	= -1,
 };
 
 static struct pl061_platform_data gpio2_plat_data = {
 	.gpio_base	= 16,
-	.irq_base	= -1,
 };
 
 static struct pl022_ssp_controller ssp0_plat_data = {
diff --git a/arch/arm/mach-realview/realview_pba8.c b/arch/arm/mach-realview/realview_pba8.c
index cbf22df..6f9511d 100644
--- a/arch/arm/mach-realview/realview_pba8.c
+++ b/arch/arm/mach-realview/realview_pba8.c
@@ -102,17 +102,14 @@ static void __init realview_pba8_map_io(void)
 
 static struct pl061_platform_data gpio0_plat_data = {
 	.gpio_base	= 0,
-	.irq_base	= -1,
 };
 
 static struct pl061_platform_data gpio1_plat_data = {
 	.gpio_base	= 8,
-	.irq_base	= -1,
 };
 
 static struct pl061_platform_data gpio2_plat_data = {
 	.gpio_base	= 16,
-	.irq_base	= -1,
 };
 
 static struct pl022_ssp_controller ssp0_plat_data = {
diff --git a/arch/arm/mach-realview/realview_pbx.c b/arch/arm/mach-realview/realview_pbx.c
index 63c4114..be3a01f 100644
--- a/arch/arm/mach-realview/realview_pbx.c
+++ b/arch/arm/mach-realview/realview_pbx.c
@@ -124,17 +124,14 @@ static void __init realview_pbx_map_io(void)
 
 static struct pl061_platform_data gpio0_plat_data = {
 	.gpio_base	= 0,
-	.irq_base	= -1,
 };
 
 static struct pl061_platform_data gpio1_plat_data = {
 	.gpio_base	= 8,
-	.irq_base	= -1,
 };
 
 static struct pl061_platform_data gpio2_plat_data = {
 	.gpio_base	= 16,
-	.irq_base	= -1,
 };
 
 static struct pl022_ssp_controller ssp0_plat_data = {
-- 
1.7.5.4
