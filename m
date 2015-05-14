From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v2] ARM: l2c: add options to overwrite prefetching behavior
Date: Thu, 14 May 2015 18:13:55 +0200
Message-ID: <1431620035-7183-1-git-send-email-hauke@hauke-m.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These options make it possible to overwrites the data and instruction
prefetching behavior of the arm pl310 cache controller.

We have to set these values in the aux and the prefetch register,
because these two bits in the aux registers are mapped to the prefetch
register. If only the prefetch register is changed there is an
inconsistence in the state in this driver.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/l2cc.txt |  4 ++++
 arch/arm/mm/cache-l2x0.c                       | 30 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/l2cc.txt b/Documentation/devicetree/bindings/arm/l2cc.txt
index 0dbabe9..528821a 100644
--- a/Documentation/devicetree/bindings/arm/l2cc.txt
+++ b/Documentation/devicetree/bindings/arm/l2cc.txt
@@ -67,6 +67,10 @@ Optional properties:
   disable if zero.
 - arm,prefetch-offset : Override prefetch offset value. Valid values are
   0-7, 15, 23, and 31.
+- arm,prefetch-data : Enable data prefetch. Enabling prefetching
+  can improve performance.
+- arm,prefetch-instr : Enable instruction prefetch. Enabling prefetching
+  can improve performance.
 
 Example:
 
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index e309c8f..088b5ad 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1199,6 +1199,36 @@ static void __init l2c310_of_parse(const struct device_node *np,
 		pr_err("L2C-310 OF arm,prefetch-offset property value is missing\n");
 	}
 
+	ret = of_property_read_u32(np, "arm,prefetch-data", &val);
+	if (ret == 0) {
+		if (val) {
+			prefetch |= L310_PREFETCH_CTRL_DATA_PREFETCH;
+			*aux_val |= L310_AUX_CTRL_DATA_PREFETCH;
+			*aux_mask &= ~L310_AUX_CTRL_DATA_PREFETCH;
+		} else {
+			prefetch &= ~L310_PREFETCH_CTRL_DATA_PREFETCH;
+			*aux_val &= ~L310_AUX_CTRL_DATA_PREFETCH;
+			*aux_mask |= L310_AUX_CTRL_DATA_PREFETCH;
+		}
+	} else if (ret != -EINVAL) {
+		pr_err("L2C-310 OF arm,prefetch-data property value is missing\n");
+	}
+
+	ret = of_property_read_u32(np, "arm,prefetch-instr", &val);
+	if (ret == 0) {
+		if (val) {
+			prefetch |= L310_PREFETCH_CTRL_INSTR_PREFETCH;
+			*aux_val |= L310_AUX_CTRL_INSTR_PREFETCH;
+			*aux_mask &= ~L310_AUX_CTRL_INSTR_PREFETCH;
+		} else {
+			prefetch &= ~L310_PREFETCH_CTRL_INSTR_PREFETCH;
+			*aux_val &= ~L310_AUX_CTRL_INSTR_PREFETCH;
+			*aux_mask |= L310_AUX_CTRL_INSTR_PREFETCH;
+		}
+	} else if (ret != -EINVAL) {
+		pr_err("L2C-310 OF arm,prefetch-instr property value is missing\n");
+	}
+
 	l2x0_saved_regs.prefetch_ctrl = prefetch;
 }
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
