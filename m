From: Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v1] rtc: snvs: add poweroff function
Date: Thu, 25 Sep 2014 10:13:53 +0800
Message-ID: <1411611233-29919-1-git-send-email-b38343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On i.mx6 chips, PMIC_ON_REQ can be pulled by snvs LPCR. That can be
used poweroff system if PMIC_ON_REQ connected with external PMIC or
power control circuit.Power up again if PMIC_ON_REQ pulled high.

Signed-off-by: Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/crypto/fsl-sec4.txt |  4 ++++
 drivers/rtc/rtc-snvs.c                                | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/fsl-sec4.txt b/Documentation/devicetree/bindings/crypto/fsl-sec4.txt
index e402277..00d67f2 100644
--- a/Documentation/devicetree/bindings/crypto/fsl-sec4.txt
+++ b/Documentation/devicetree/bindings/crypto/fsl-sec4.txt
@@ -363,11 +363,15 @@ Secure Non-Volatile Storage (SNVS) Low Power (LP) RTC Node
       Value type: <prop-encoded-array>
       Definition: A standard property.  Specifies the physical
           address and length of the SNVS LP configuration registers.
+  - fsl,poweroff
+      Usage: opertional, recommend if PMIC_ON_REQ connected with external
+	PMIC or power control circuit.
 
 EXAMPLE
 	sec_mon_rtc_lp@314000 {
 		compatible = "fsl,sec-v4.0-mon-rtc-lp";
 		reg = <0x34 0x58>;
+		fsl,poweroff;
 	};
 
 =====================================================================
diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index fa384fe..ef32541 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -29,6 +29,8 @@
 #define SNVS_LPCR_SRTC_ENV	(1 << 0)
 #define SNVS_LPCR_LPTA_EN	(1 << 1)
 #define SNVS_LPCR_LPWUI_EN	(1 << 3)
+#define SNVS_LPCR_DP		(1 << 5)
+#define SNVS_LPCR_TOP		(1 << 6)
 #define SNVS_LPSR_LPTA		(1 << 0)
 
 #define SNVS_LPPGDR_INIT	0x41736166
@@ -41,6 +43,8 @@ struct snvs_rtc_data {
 	spinlock_t lock;
 };
 
+static void __iomem *snvs_base;
+
 static u32 rtc_read_lp_counter(void __iomem *ioaddr)
 {
 	u64 read1, read2;
@@ -241,8 +245,17 @@ static irqreturn_t snvs_rtc_irq_handler(int irq, void *dev_id)
 	return events ? IRQ_HANDLED : IRQ_NONE;
 }
 
+static void snvs_poweroff(void)
+{
+	u32 value;
+
+	value = readl(snvs_base + SNVS_LPCR);
+	writel(value | SNVS_LPCR_DP | SNVS_LPCR_TOP, snvs_base + SNVS_LPCR);
+}
+
 static int snvs_rtc_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct snvs_rtc_data *data;
 	struct resource *res;
 	int ret;
@@ -260,6 +273,11 @@ static int snvs_rtc_probe(struct platform_device *pdev)
 	if (data->irq < 0)
 		return data->irq;
 
+	if (np && of_get_property(np, "fsl,poweroff", NULL)) {
+		snvs_base = data->ioaddr;
+		pm_power_off = snvs_poweroff;
+	}
+
 	platform_set_drvdata(pdev, data);
 
 	spin_lock_init(&data->lock);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
