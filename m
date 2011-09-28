From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCHv2 02/10] ARM: vic: MULTI_IRQ_HANDLER handler
Date: Wed, 28 Sep 2011 11:41:39 +0100
Message-ID: <1317206507-18867-3-git-send-email-jamie@jamieiles.com>
References: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1317206507-18867-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
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
Cc: viresh.kumar-qxv4g6HH51o@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org, rajeev-dlh.kumar-qxv4g6HH51o@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, STEricsson_nomadik_linux-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, rubini-9wsNiZum9E8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a handler for the VIC that is suitable for MULTI_IRQ_HANDLER
platforms.  This can replace the ASM entry macros for platforms that use
the VIC.

v2:	- allow the handler be used for !CONFIG_OF
	- use irq_domain_to_irq()

Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
---
 arch/arm/common/vic.c               |   29 +++++++++++++++++++++++++++++
 arch/arm/include/asm/hardware/vic.h |    4 ++++
 2 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/arch/arm/common/vic.c b/arch/arm/common/vic.c
index 3f9c8f2..71adced 100644
--- a/arch/arm/common/vic.c
+++ b/arch/arm/common/vic.c
@@ -427,3 +427,32 @@ int __init vic_of_init(struct device_node *node, struct device_node *parent)
 	return -EIO;
 }
 #endif /* CONFIG OF */
+
+#ifdef CONFIG_MULTI_IRQ_HANDLER
+static void vic_single_handle_irq(struct vic_device *vic, struct pt_regs *regs)
+{
+	u32 stat, irq;
+	bool handled = false;
+
+	while (!handled) {
+		stat = readl_relaxed(vic->base + VIC_IRQ_STATUS);
+		if (!stat)
+			break;
+
+		while (stat) {
+			irq = fls(stat) - 1;
+			handle_IRQ(irq_domain_to_irq(&vic->domain, irq), regs);
+			stat &= ~(1 << irq);
+			handled = true;
+		}
+	}
+}
+
+asmlinkage void __exception_irq_entry vic_handle_irq(struct pt_regs *regs)
+{
+	int i;
+
+	for (i = 0; i < vic_id; ++i)
+		vic_single_handle_irq(&vic_devices[i], regs);
+}
+#endif /* CONFIG_MULTI_IRQ_HANDLER */
diff --git a/arch/arm/include/asm/hardware/vic.h b/arch/arm/include/asm/hardware/vic.h
index 0135215..c02fd6f 100644
--- a/arch/arm/include/asm/hardware/vic.h
+++ b/arch/arm/include/asm/hardware/vic.h
@@ -45,11 +45,15 @@
 #include <linux/types.h>
 
 struct device_node;
+struct pt_regs;
+
 void vic_init(void __iomem *base, unsigned int irq_start, u32 vic_sources, u32 resume_sources);
 
 #ifdef CONFIG_OF
 int vic_of_init(struct device_node *node, struct device_node *parent);
 #endif /* CONFIG_OF */
 
+void vic_handle_irq(struct pt_regs *regs);
+
 #endif /* __ASSEMBLY__ */
 #endif
-- 
1.7.4.1
