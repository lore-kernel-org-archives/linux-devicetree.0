From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/5] ARM: at91: dt: add pinctrl pre-processor define
Date: Wed, 15 May 2013 16:03:03 +0200
Message-ID: <1368626585-24425-3-git-send-email-plagnioj@jcrosoft.com>
References: <20130515135821.GG22508@game.jcrosoft.org>
 <1368626585-24425-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1368626585-24425-1-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 include/dt-bindings/pinctrl/at91.h |   35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/at91.h

diff --git a/include/dt-bindings/pinctrl/at91.h b/include/dt-bindings/pinctrl/at91.h
new file mode 100644
index 0000000..d7988b4
--- /dev/null
+++ b/include/dt-bindings/pinctrl/at91.h
@@ -0,0 +1,35 @@
+/*
+ * This header provides constants for most at91 pinctrl bindings.
+ *
+ * Copyright (C) 2013 Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
+ *
+ * GPLv2 only
+ */
+
+#ifndef __DT_BINDINGS_AT91_PINCTRL_H__
+#define __DT_BINDINGS_AT91_PINCTRL_H__
+
+#define AT91_PINCTRL_NONE		(0 << 0)
+#define AT91_PINCTRL_PULL_UP		(1 << 0)
+#define AT91_PINCTRL_MULTI_DRIVE	(1 << 1)
+#define AT91_PINCTRL_DEGLITCH		(1 << 2)
+#define AT91_PINCTRL_PULL_DOWN		(1 << 3)
+#define AT91_PINCTRL_DIS_SCHMIT		(1 << 4)
+#define AT91_PINCTRL_DEBOUNCE		(1 << 16)
+#define AT91_PINCTRL_DEBOUNCE_VA(x)	(x << 17)
+
+#define AT91_PINCTRL_PULL_UP_DEGLITCH	(AT91_PINCTRL_PULL_UP | AT91_PINCTRL_DEGLITCH)
+
+#define AT91_PIOA	0
+#define AT91_PIOB	1
+#define AT91_PIOC	2
+#define AT91_PIOD	3
+#define AT91_PIOE	4
+
+#define AT91_PERIPH_GPIO	0
+#define AT91_PERIPH_A		1
+#define AT91_PERIPH_B		2
+#define AT91_PERIPH_C		3
+#define AT91_PERIPH_D		4
+
+#endif /* __DT_BINDINGS_AT91_PINCTRL_H__ */
-- 
1.7.10.4
