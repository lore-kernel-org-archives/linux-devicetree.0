From: Frank Wunderlich <frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org>
Subject: [PATCH v6 06/13] mfd: mt6397: add mutex include
Date: Sun, 18 Aug 2019 15:56:04 +0200
Message-ID: <20190818135611.7776-7-frank-w@public-files.de>
References: <20190818135611.7776-1-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190818135611.7776-1-frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel @ lists . infradead . org Alessandro Zummo" <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Wunderlich <frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org>, Josef Friedl <josef.friedl-D4IDLmZPRBc@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tianping Fang <tianping.fang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Josef Friedl <josef.friedl-D4IDLmZPRBc@public.gmane.org>

add missing mutex.h

Signed-off-by: Josef Friedl <josef.friedl-D4IDLmZPRBc@public.gmane.org>
Signed-off-by: Frank Wunderlich <frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org>
---
changes since v5: separated from "power: reset: add driver for mt6323 poweroff"
---
 include/linux/mfd/mt6397/core.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
index 25a95e72179b..652da61e3711 100644
--- a/include/linux/mfd/mt6397/core.h
+++ b/include/linux/mfd/mt6397/core.h
@@ -7,6 +7,8 @@
 #ifndef __MFD_MT6397_CORE_H__
 #define __MFD_MT6397_CORE_H__
 
+#include <linux/mutex.h>
+
 enum mt6397_irq_numbers {
 	MT6397_IRQ_SPKL_AB = 0,
 	MT6397_IRQ_SPKR_AB,
-- 
2.17.1
