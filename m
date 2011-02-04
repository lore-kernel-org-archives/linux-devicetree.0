From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: [PATCH v2 TIP 09/14] x86/dtb: Add generic bus probe
Date: Fri, 4 Feb 2011 11:21:52 +0100
Message-ID: <20110204102152.GA7231@www.tglx.de>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>
	<1295843342-1122-10-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1295843342-1122-10-git-send-email-bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

For now we probe these busses and we change is to board dependent probes
once we have to.

Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

 renamed -immr to -cp

 arch/x86/kernel/prom.c |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kernel/prom.c b/arch/x86/kernel/prom.c
index 8525ca0..3eaab43 100644
--- a/arch/x86/kernel/prom.c
+++ b/arch/x86/kernel/prom.c
@@ -102,6 +102,25 @@ void __init add_dtb(u64 data)
 	initial_dtb = data + offsetof(struct setup_data, data);
 }
 
+/*
+ * CE4100 ids. Will be moved to machine_device_initcall() once we have it.
+ */
+static struct of_device_id __initdata ce4100_ids[] = {
+	{ .compatible = "intel,ce4100-cp", },
+	{ .compatible = "isa", },
+	{ .compatible = "pci", },
+	{},
+};
+
+static int __init add_bus_probe(void)
+{
+	if (!initial_boot_params)
+		return 0;
+
+	return of_platform_bus_probe(NULL, ce4100_ids, NULL);
+}
+module_init(add_bus_probe);
+
 #ifdef CONFIG_PCI
 static int x86_of_pci_irq_enable(struct pci_dev *dev)
 {
-- 
1.7.3.2
