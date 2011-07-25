From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCH 3/3] versatile: convert to common VIC DT probing
Date: Mon, 25 Jul 2011 17:10:00 +0100
Message-ID: <1311610200-12408-4-git-send-email-jamie@jamieiles.com>
References: <1311610200-12408-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1311610200-12408-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use the common VIC probing code in the VIC driver to instantiate the VIC
from the DT.

Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
---
 arch/arm/mach-versatile/core.c |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-versatile/core.c b/arch/arm/mach-versatile/core.c
index 15c0091..3f29c01 100644
--- a/arch/arm/mach-versatile/core.c
+++ b/arch/arm/mach-versatile/core.c
@@ -85,12 +85,6 @@ static struct fpga_irq_data sic_irq = {
 #define PIC_MASK	0
 #endif
 
-/* Lookup table for finding a DT node that represents the vic instance */
-static const struct of_device_id vic_of_match[] __initconst = {
-	{ .compatible = "arm,vic", },
-	{}
-};
-
 static const struct of_device_id sic_of_match[] __initconst = {
 	{ .compatible = "arm,sic", },
 	{}
@@ -98,8 +92,7 @@ static const struct of_device_id sic_of_match[] __initconst = {
 
 void __init versatile_init_irq(void)
 {
-	vic_init(VA_VIC_BASE, IRQ_VIC_START, ~0, 0);
-	irq_domain_generate_simple(vic_of_match, VERSATILE_VIC_BASE, IRQ_VIC_START);
+	vic_of_init();
 
 	writel(~0, VA_SIC_BASE + SIC_IRQ_ENABLE_CLEAR);
 
-- 
1.7.4.1
