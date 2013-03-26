From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [RFCv1 04/11] irqchip: armada-370-xp: slightly cleanup irq controller
 driver
Date: Tue, 26 Mar 2013 17:52:19 +0100
Message-ID: <1364316746-8702-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1364316746-8702-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In preparation for the introduction of MSI support in the IRQ
controller driver, we clarify the implementation of IPI using
additional defines for the manipulation of doorbells. Just like IPIs
are implemented using doorbells, MSIs will also use doorbells, so it
makes sense to do this preparatory cleanup first.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/irqchip/irq-armada-370-xp.c |   13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index 1115bf8..ad1e642 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -48,7 +48,9 @@
 
 #define ARMADA_370_XP_TIMER0_PER_CPU_IRQ	(5)
 
-#define ACTIVE_DOORBELLS			(8)
+#define IPI_DOORBELL_START                      (0)
+#define IPI_DOORBELL_END                        (8)
+#define IPI_DOORBELL_MASK                       0xFF
 
 static DEFINE_RAW_SPINLOCK(irq_controller_lock);
 
@@ -192,7 +194,7 @@ void armada_xp_mpic_smp_cpu_init(void)
 	writel(0, per_cpu_int_base + ARMADA_370_XP_IN_DRBEL_CAUSE_OFFS);
 
 	/* Enable first 8 IPIs */
-	writel((1 << ACTIVE_DOORBELLS) - 1, per_cpu_int_base +
+	writel(IPI_DOORBELL_MASK, per_cpu_int_base +
 		ARMADA_370_XP_IN_DRBEL_MSK_OFFS);
 
 	/* Unmask IPI interrupt */
@@ -231,13 +233,14 @@ armada_370_xp_handle_irq(struct pt_regs *regs)
 
 			ipimask = readl_relaxed(per_cpu_int_base +
 						ARMADA_370_XP_IN_DRBEL_CAUSE_OFFS)
-				& 0xFF;
+				& IPI_DOORBELL_MASK;
 
-			writel(0x0, per_cpu_int_base +
+			writel(~IPI_DOORBELL_MASK, per_cpu_int_base +
 				ARMADA_370_XP_IN_DRBEL_CAUSE_OFFS);
 
 			/* Handle all pending doorbells */
-			for (ipinr = 0; ipinr < ACTIVE_DOORBELLS; ipinr++) {
+			for (ipinr = IPI_DOORBELL_START;
+			     ipinr < IPI_DOORBELL_END; ipinr++) {
 				if (ipimask & (0x1 << ipinr))
 					handle_IPI(ipinr, regs);
 			}
-- 
1.7.9.5
