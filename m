From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 05/33] ARM: davinci: pull davinci_intc_base into the
 respective intc drivers
Date: Fri,  8 Feb 2019 18:34:30 +0100
Message-ID: <20190208173458.4801-6-brgl@bgdev.pl>
References: <20190208173458.4801-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208173458.4801-1-brgl@bgdev.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, David Lechner <david@lechnology.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

davinci_intc_base is defined globally in common.c. Define separate
local variables for the aintc and cp-intc drivers and remove the
global one.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: David Lechner <david@lechnology.com>
---
 arch/arm/mach-davinci/common.c              | 2 --
 arch/arm/mach-davinci/cp_intc.c             | 2 ++
 arch/arm/mach-davinci/include/mach/common.h | 1 -
 arch/arm/mach-davinci/irq.c                 | 1 +
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-davinci/common.c b/arch/arm/mach-davinci/common.c
index a87e158a709b..2850ae02aaa4 100644
--- a/arch/arm/mach-davinci/common.c
+++ b/arch/arm/mach-davinci/common.c
@@ -23,8 +23,6 @@
 struct davinci_soc_info davinci_soc_info;
 EXPORT_SYMBOL(davinci_soc_info);
 
-void __iomem *davinci_intc_base;
-
 void davinci_get_mac_addr(struct nvmem_device *nvmem, void *context)
 {
 	char *mac_addr = davinci_soc_info.emac_pdata->mac_addr;
diff --git a/arch/arm/mach-davinci/cp_intc.c b/arch/arm/mach-davinci/cp_intc.c
index 19874f5ef542..4e293cde20fb 100644
--- a/arch/arm/mach-davinci/cp_intc.c
+++ b/arch/arm/mach-davinci/cp_intc.c
@@ -26,6 +26,8 @@
 #define DAVINCI_CP_INTC_PRI_INDX_MASK		GENMASK(9, 0)
 #define DAVINCI_CP_INTC_GPIR_NONE		BIT(31)
 
+static void __iomem *davinci_intc_base;
+
 static inline unsigned int cp_intc_read(unsigned offset)
 {
 	return __raw_readl(davinci_intc_base + offset);
diff --git a/arch/arm/mach-davinci/include/mach/common.h b/arch/arm/mach-davinci/include/mach/common.h
index 34e48de92dcc..3d45b73b9a64 100644
--- a/arch/arm/mach-davinci/include/mach/common.h
+++ b/arch/arm/mach-davinci/include/mach/common.h
@@ -20,7 +20,6 @@
 void davinci_timer_init(struct clk *clk);
 
 extern void davinci_irq_init(void);
-extern void __iomem *davinci_intc_base;
 
 struct davinci_timer_instance {
 	u32		base;
diff --git a/arch/arm/mach-davinci/irq.c b/arch/arm/mach-davinci/irq.c
index 2494d9b36966..19f17ef04381 100644
--- a/arch/arm/mach-davinci/irq.c
+++ b/arch/arm/mach-davinci/irq.c
@@ -43,6 +43,7 @@
 #define IRQ_INTPRI0_REG_OFFSET	0x0030
 #define IRQ_INTPRI7_REG_OFFSET	0x004C
 
+static void __iomem *davinci_intc_base;
 static struct irq_domain *davinci_irq_domain;
 
 static inline void davinci_irq_writel(unsigned long value, int offset)
-- 
2.20.1
