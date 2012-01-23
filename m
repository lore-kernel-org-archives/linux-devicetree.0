From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFCv2 04/14] irq_domain: convert microblaze from irq_host to
 irq_domain
Date: Mon, 23 Jan 2012 14:07:40 -0700
Message-ID: <1327352870-14687-5-git-send-email-grant.likely@secretlab.ca>
References: <1327352870-14687-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1327352870-14687-1-git-send-email-grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Trivial change, microblaze doesn't use irq remapping yet.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
---
 arch/microblaze/include/asm/irq.h |    4 ++--
 arch/microblaze/kernel/irq.c      |    2 +-
 arch/microblaze/kernel/setup.c    |    2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/microblaze/include/asm/irq.h b/arch/microblaze/include/asm/irq.h
index a175132..7798ad1 100644
--- a/arch/microblaze/include/asm/irq.h
+++ b/arch/microblaze/include/asm/irq.h
@@ -39,7 +39,7 @@ static inline void irq_dispose_mapping(unsigned int virq)
 	return;
 }
 
-struct irq_host;
+struct irq_domain;
 
 /**
  * irq_create_mapping - Map a hardware interrupt into linux virq space
@@ -51,7 +51,7 @@ struct irq_host;
  * If the sense/trigger is to be specified, set_irq_type() should be called
  * on the number returned from that call.
  */
-extern unsigned int irq_create_mapping(struct irq_host *host,
+extern unsigned int irq_create_mapping(struct irq_domain *host,
 					irq_hw_number_t hwirq);
 
 #endif /* _ASM_MICROBLAZE_IRQ_H */
diff --git a/arch/microblaze/kernel/irq.c b/arch/microblaze/kernel/irq.c
index bbebcae..3f613df 100644
--- a/arch/microblaze/kernel/irq.c
+++ b/arch/microblaze/kernel/irq.c
@@ -51,7 +51,7 @@ next_irq:
 
 /* MS: There is no any advance mapping mechanism. We are using simple 32bit
   intc without any cascades or any connection that's why mapping is 1:1 */
-unsigned int irq_create_mapping(struct irq_host *host, irq_hw_number_t hwirq)
+unsigned int irq_create_mapping(struct irq_domain *host, irq_hw_number_t hwirq)
 {
 	return hwirq + IRQ_OFFSET;
 }
diff --git a/arch/microblaze/kernel/setup.c b/arch/microblaze/kernel/setup.c
index d4fc1a9..208cd04 100644
--- a/arch/microblaze/kernel/setup.c
+++ b/arch/microblaze/kernel/setup.c
@@ -52,8 +52,6 @@ void __init setup_arch(char **cmdline_p)
 
 	unflatten_device_tree();
 
-	/* NOTE I think that this function is not necessary to call */
-	/* irq_early_init(); */
 	setup_cpuinfo();
 
 	microblaze_cache_init();
-- 
1.7.5.4
