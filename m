From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH 1/7] mfd: menelaus: delete omap_has_menelaus
Date: Sat, 27 Dec 2014 19:52:53 +0200
Message-ID: <1419702779-16001-2-git-send-email-aaro.koskinen@iki.fi>
References: <1419702779-16001-1-git-send-email-aaro.koskinen@iki.fi>
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1419702779-16001-1-git-send-email-aaro.koskinen@iki.fi>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
List-Id: devicetree@vger.kernel.org

Delete unused macro.

Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 include/linux/mfd/menelaus.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/mfd/menelaus.h b/include/linux/mfd/menelaus.h
index f097e89..a1e12bf3 100644
--- a/include/linux/mfd/menelaus.h
+++ b/include/linux/mfd/menelaus.h
@@ -38,10 +38,4 @@ extern int menelaus_set_vcore_hw(unsigned int roof_mV, unsigned int floor_mV);
 
 extern int menelaus_set_regulator_sleep(int enable, u32 val);
 
-#if defined(CONFIG_ARCH_OMAP2) && defined(CONFIG_MENELAUS)
-#define omap_has_menelaus()	1
-#else
-#define omap_has_menelaus()	0
-#endif
-
 #endif
-- 
2.2.0

