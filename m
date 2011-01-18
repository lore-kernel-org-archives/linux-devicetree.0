From: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] powerpc: make MPIC honor the 'no-reset' device tree
	property
Date: Mon, 17 Jan 2011 18:54:01 -0600
Message-ID: <4D34E4A9.4080807@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "Blanchard, Hollis" <Hollis_Blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This property, defined in the MPIC binding, tells the kernel not to use 
the reset bit in the global configuration register.

Signed-off-by: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
CC: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
  arch/powerpc/sysdev/mpic.c |    4 +++-
  1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index 30c44e6..44aa2c3 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1157,7 +1157,9 @@ struct mpic * __init mpic_alloc(struct device_node 
*node,
  	mpic_map(mpic, node, paddr, &mpic->tmregs, MPIC_INFO(TIMER_BASE), 
0x1000);

  	/* Reset */
-	if (flags & MPIC_WANTS_RESET) {
+	if ((flags & MPIC_WANTS_RESET) &&
+		!of_find_property(node, "no-reset", NULL)) {
+		printk(KERN_DEBUG "mpic: Resetting\n");
  		mpic_write(mpic->gregs, MPIC_INFO(GREG_GLOBAL_CONF_0),
  			   mpic_read(mpic->gregs, MPIC_INFO(GREG_GLOBAL_CONF_0))
  			   | MPIC_GREG_GCONF_RESET);
-- 1.6.3.3
