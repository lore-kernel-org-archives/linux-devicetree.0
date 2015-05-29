From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 4/6] drivers: firmware: psci: add PSCI_FEATURES call
Date: Fri, 29 May 2015 13:16:37 +0100
Message-ID: <1432901799-18359-5-git-send-email-lorenzo.pieralisi@arm.com>
References: <1432901799-18359-1-git-send-email-lorenzo.pieralisi@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432901799-18359-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Anup Patel <anup.patel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

PSCI v1.0 introduces a PSCI_FEATURES call that allows to probe for
features related to a specific function identifier.

This patch adds PSCI_FEATURES support to the PSCI firmware layer.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
---
 drivers/firmware/psci.c   | 6 ++++++
 include/uapi/linux/psci.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
index f1579a4..2330099 100644
--- a/drivers/firmware/psci.c
+++ b/drivers/firmware/psci.c
@@ -196,6 +196,12 @@ static void psci_sys_poweroff(void)
 	invoke_psci_fn(PSCI_0_2_FN_SYSTEM_OFF, 0, 0, 0);
 }
 
+static int __init psci_features(u32 psci_func_id)
+{
+	return invoke_psci_fn(PSCI_1_0_FN_PSCI_FEATURES,
+			      psci_func_id, 0, 0);
+}
+
 /*
  * Detect the presence of a resident Trusted OS which may cause CPU_OFF to
  * return DENIED (which would be fatal).
diff --git a/include/uapi/linux/psci.h b/include/uapi/linux/psci.h
index 64469e6..187b828d 100644
--- a/include/uapi/linux/psci.h
+++ b/include/uapi/linux/psci.h
@@ -46,6 +46,8 @@
 #define PSCI_0_2_FN64_MIGRATE			PSCI_0_2_FN64(5)
 #define PSCI_0_2_FN64_MIGRATE_INFO_UP_CPU	PSCI_0_2_FN64(7)
 
+#define PSCI_1_0_FN_PSCI_FEATURES		PSCI_0_2_FN(10)
+
 /* PSCI v0.2 power state encoding for CPU_SUSPEND function */
 #define PSCI_0_2_POWER_STATE_ID_MASK		0xffff
 #define PSCI_0_2_POWER_STATE_ID_SHIFT		0
-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
