From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V4 Resend 2/3] mfd: stmpe: Remove irq_trigger from platform
 data
Date: Thu, 29 Nov 2012 00:17:16 +0530
Message-ID: <33d71d9d29a3edd2c4a33e0f187cdb89f344af72.1354128258.git.viresh.kumar@linaro.org>
References: <d1f012d7bb2835f696fc100073f2eb16d9f6204d.1354128258.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <d1f012d7bb2835f696fc100073f2eb16d9f6204d.1354128258.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
In-Reply-To: <d1f012d7bb2835f696fc100073f2eb16d9f6204d.1354128258.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
References: <d1f012d7bb2835f696fc100073f2eb16d9f6204d.1354128258.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rabin.vincent-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, shiraz.hashim-qxv4g6HH51o@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

STMPE can confige the way the device emits interrupts and till now this
information is passed as part of platform data.

It would actually be good to ask the interrupt controller driver what kind of
interrupt signal it expects for a given interrupt line. We can get the irq type
by calling: irqd_get_trigger_type() routine.

So, now we don't need to pass it via platform data. This is earlier discussed
here:

https://lkml.org/lkml/2012/11/26/711

Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

@Linus/Shiraz: Can you please test this patch? You don't really need to test 1/3
and 3/3, but would be good if you do that too..

This is actually V1 of this patch.

 arch/arm/mach-ux500/board-mop500-stuib.c | 1 -
 drivers/mfd/stmpe.c                      | 7 ++++---
 include/linux/mfd/stmpe.h                | 2 --
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-ux500/board-mop500-stuib.c b/arch/arm/mach-ux500/board-mop500-stuib.c
index 564f57d..0efcf97 100644
--- a/arch/arm/mach-ux500/board-mop500-stuib.c
+++ b/arch/arm/mach-ux500/board-mop500-stuib.c
@@ -57,7 +57,6 @@ static struct stmpe_keypad_platform_data stmpe1601_keypad_data = {
 static struct stmpe_platform_data stmpe1601_data = {
 	.id		= 1,
 	.blocks		= STMPE_BLOCK_KEYPAD,
-	.irq_trigger    = IRQF_TRIGGER_FALLING,
 	.irq_base       = MOP500_STMPE1601_IRQ(0),
 	.keypad		= &stmpe1601_keypad_data,
 	.autosleep      = true,
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 34408b4..10819e6 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -914,7 +914,6 @@ static int __devinit stmpe_irq_init(struct stmpe *stmpe,
 
 static int __devinit stmpe_chip_init(struct stmpe *stmpe)
 {
-	unsigned int irq_trigger = stmpe->pdata->irq_trigger;
 	int autosleep_timeout = stmpe->pdata->autosleep_timeout;
 	struct stmpe_variant_info *variant = stmpe->variant;
 	u8 icr = 0;
@@ -941,6 +940,9 @@ static int __devinit stmpe_chip_init(struct stmpe *stmpe)
 		return ret;
 
 	if (stmpe->irq >= 0) {
+		unsigned int irq_trigger =
+			irqd_get_trigger_type(irq_get_irq_data(stmpe->irq));
+
 		if (id == STMPE801_ID)
 			icr = STMPE801_REG_SYS_CTRL_INT_EN;
 		else
@@ -1118,8 +1120,7 @@ int __devinit stmpe_probe(struct stmpe_client_info *ci, int partnum)
 			return ret;
 
 		ret = devm_request_threaded_irq(ci->dev, stmpe->irq, NULL,
-				stmpe_irq, pdata->irq_trigger | IRQF_ONESHOT,
-				"stmpe", stmpe);
+				stmpe_irq, IRQF_ONESHOT, "stmpe", stmpe);
 		if (ret) {
 			dev_err(stmpe->dev, "failed to request IRQ: %d\n",
 					ret);
diff --git a/include/linux/mfd/stmpe.h b/include/linux/mfd/stmpe.h
index 383ac15..2519326 100644
--- a/include/linux/mfd/stmpe.h
+++ b/include/linux/mfd/stmpe.h
@@ -189,7 +189,6 @@ struct stmpe_ts_platform_data {
  * struct stmpe_platform_data - STMPE platform data
  * @id: device id to distinguish between multiple STMPEs on the same board
  * @blocks: bitmask of blocks to enable (use STMPE_BLOCK_*)
- * @irq_trigger: IRQ trigger to use for the interrupt to the host
  * @autosleep: bool to enable/disable stmpe autosleep
  * @autosleep_timeout: inactivity timeout in milliseconds for autosleep
  * @irq_base: base IRQ number.  %STMPE_NR_IRQS irqs will be used, or
@@ -205,7 +204,6 @@ struct stmpe_platform_data {
 	int id;
 	unsigned int blocks;
 	int irq_base;
-	unsigned int irq_trigger;
 	bool autosleep;
 	bool irq_over_gpio;
 	int irq_gpio;
-- 
1.7.12.rc2.18.g61b472e
