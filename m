From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: [PATCH 06/11] x86/dtb: add support hpet
Date: Thu, 25 Nov 2010 18:39:56 +0100
Message-ID: <1290706801-7323-7-git-send-email-bigeasy@linutronix.de>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1290706801-7323-1-git-send-email-bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Set hpet_address based on information provied form DTB

Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
CC: x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Tested-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/x86/kernel/prom.c |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kernel/prom.c b/arch/x86/kernel/prom.c
index 9551f2f..f61c541 100644
--- a/arch/x86/kernel/prom.c
+++ b/arch/x86/kernel/prom.c
@@ -9,6 +9,7 @@
 #include <linux/of_platform.h>
 #include <linux/slab.h>
 
+#include <asm/hpet.h>
 #include <asm/irq_controller.h>
 #include <asm/io_apic.h>
 
@@ -99,6 +100,27 @@ void __init add_dtb(u64 data)
 				offsetof(struct setup_data, data));
 }
 
+static int __init early_scan_hpet(unsigned long node, const char *uname,
+				   int depth, void *data)
+{
+	unsigned long l;
+	int ret;
+	__be32 *cell;
+
+	if (depth != 2)
+		return 0;
+
+	ret = of_flat_dt_is_compatible(node, "intel,hpet");
+	if (!ret)
+		return 0;
+
+	cell = of_get_flat_dt_prop(node, "phys_reg", &l);
+	if (!cell)
+		return 0;
+	hpet_address = of_read_ulong(cell, l / 4);
+	return 1;
+}
+
 static void __init of_lapic_setup(void)
 {
 #ifdef CONFIG_X86_LOCAL_APIC
@@ -195,6 +217,7 @@ void __init x86_early_of_parse(void)
 
 	/* root level address cells */
 	of_scan_flat_dt(early_init_dt_scan_root, NULL);
+	of_scan_flat_dt(early_scan_hpet, NULL);
 	of_apic_setup();
 
 	early_iounmap(initial_boot_params, size);
-- 
1.7.3.2
