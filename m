From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
Subject: [RFC 4/5] powerpc/mpic: Boot print supported interrupt ranges
Date: Fri, 27 Jul 2018 15:18:00 +0530
Message-ID: <1532684881-19310-5-git-send-email-Bharat.Bhushan@nxp.com>
References: <1532684881-19310-1-git-send-email-Bharat.Bhushan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532684881-19310-1-git-send-email-Bharat.Bhushan@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, oss@buserror.net, galak@kernel.crashing.org, mark.rutland@arm.com, kstewart@linuxfoundation.org, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: robh@kernel.org, keescook@chromium.org, tyreld@linux.vnet.ibm.com, joe@perches.com, Bharat Bhushan <Bharat.Bhushan@nxp.com>
List-Id: devicetree@vger.kernel.org

As mpic can have non-contiguous source of interrupt range,
print same during boot.

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
 arch/powerpc/sysdev/mpic.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index cbf3a51..8df248f 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -155,6 +155,21 @@ struct bus_type mpic_subsys = {
 
 #endif /* CONFIG_MPIC_WEIRD */
 
+static void mpic_show_irq_ranges(struct mpic *mpic)
+{
+	int i;
+
+	pr_info("mpic: Initializing for %d sources\n", mpic->num_sources);
+
+	if (mpic->num_ranges) {
+		pr_info(" Supported source of interrupt ranges\n");
+		for (i = 0; i < mpic->num_ranges; i++)
+			pr_info("  > %d - %d\n", mpic->irq_ranges[i].start_irq,
+				mpic->irq_ranges[i].end_irq);
+
+	}
+}
+
 static int mpic_irq_source_invalid(struct mpic *mpic, unsigned int irq)
 {
 	int i;
@@ -1646,8 +1661,7 @@ void __init mpic_init(struct mpic *mpic)
 	int num_timers = 4;
 
 	BUG_ON(mpic->num_sources == 0);
-
-	printk(KERN_INFO "mpic: Initializing for %d sources\n", mpic->num_sources);
+	mpic_show_irq_ranges(mpic);
 
 	/* Set current processor priority to max */
 	mpic_cpu_write(MPIC_INFO(CPU_CURRENT_TASK_PRI), 0xf);
-- 
1.9.3
