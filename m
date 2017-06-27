From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH v3 1/4] soc: brcmstb: Add Product ID and Family ID helper
 functions
Date: Tue, 27 Jun 2017 10:59:10 -0400
Message-ID: <1498575553-19311-2-git-send-email-alcooperx@gmail.com>
References: <1498575553-19311-1-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1498575553-19311-1-git-send-email-alcooperx@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Cooper <alcooperx@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/soc/bcm/brcmstb/common.c    | 12 ++++++++++++
 include/linux/soc/brcmstb/brcmstb.h | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/soc/bcm/brcmstb/common.c b/drivers/soc/bcm/brcmstb/common.c
index b6195fd..184dbf5 100644
--- a/drivers/soc/bcm/brcmstb/common.c
+++ b/drivers/soc/bcm/brcmstb/common.c
@@ -40,6 +40,18 @@ bool soc_is_brcmstb(void)
 	return of_match_node(brcmstb_machine_match, root) != NULL;
 }
 
+u32 brcmstb_get_family_id(void)
+{
+	return family_id;
+}
+EXPORT_SYMBOL(brcmstb_get_family_id);
+
+u32 brcmstb_get_product_id(void)
+{
+	return product_id;
+}
+EXPORT_SYMBOL(brcmstb_get_product_id);
+
 static const struct of_device_id sun_top_ctrl_match[] = {
 	{ .compatible = "brcm,bcm7125-sun-top-ctrl", },
 	{ .compatible = "brcm,bcm7346-sun-top-ctrl", },
diff --git a/include/linux/soc/brcmstb/brcmstb.h b/include/linux/soc/brcmstb/brcmstb.h
index 337ce41..23e4dc9 100644
--- a/include/linux/soc/brcmstb/brcmstb.h
+++ b/include/linux/soc/brcmstb/brcmstb.h
@@ -1,10 +1,20 @@
 #ifndef __BRCMSTB_SOC_H
 #define __BRCMSTB_SOC_H
 
+#define BRCM_ID(reg)	((u32)reg >> 28 ? (u32)reg >> 16 : (u32)reg >> 8)
+#define BRCM_REV(reg)	((u32)reg & 0xff)
+
 /*
  * Bus Interface Unit control register setup, must happen early during boot,
  * before SMP is brought up, called by machine entry point.
  */
 void brcmstb_biuctrl_init(void);
 
+/*
+ * Helper functions for getting family or product id from the
+ * SoC driver.
+ */
+u32 brcmstb_get_family_id(void);
+u32 brcmstb_get_product_id(void);
+
 #endif /* __BRCMSTB_SOC_H */
-- 
1.9.0.138.g2de3478
