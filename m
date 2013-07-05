From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 7/9] clocksource: dw_apb_timer: quirk for inverted timer mode
 setting
Date: Sat, 6 Jul 2013 00:55:31 +0200
Message-ID: <201307060055.31882.heiko@sntech.de>
References: <201307060051.09716.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201307060051.09716.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
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
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

Some variants of SOCs using dw_apb_timer have inverted logic for the
bit that sets one-shot / periodic mode or free running timer. This
commit adds the new APBTMR_QUIRK_INVERSE_PERIODIC.

Signed-off-by: Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/clocksource/dw_apb_timer.c |   11 +++++++++--
 include/linux/dw_apb_timer.h       |    6 ++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/dw_apb_timer.c 
b/drivers/clocksource/dw_apb_timer.c
index 7705d13..a2e8306 100644
--- a/drivers/clocksource/dw_apb_timer.c
+++ b/drivers/clocksource/dw_apb_timer.c
@@ -159,7 +159,11 @@ static void apbt_set_mode(enum clock_event_mode mode,
 	case CLOCK_EVT_MODE_PERIODIC:
 		period = DIV_ROUND_UP(timer->freq, HZ);
 		ctrl = apbt_readl(timer, timer->reg_control);
-		ctrl |= APBTMR_CONTROL_MODE_PERIODIC;
+
+		if (timer->quirks & APBTMR_QUIRK_INVERSE_PERIODIC)
+			ctrl &= ~APBTMR_CONTROL_MODE_PERIODIC;
+		else
+			ctrl |= APBTMR_CONTROL_MODE_PERIODIC;
 		apbt_writel(timer, ctrl, timer->reg_control);
 		/*
 		 * DW APB p. 46, have to disable timer before load counter,
@@ -186,7 +190,10 @@ static void apbt_set_mode(enum clock_event_mode mode,
 		 * the next event, therefore emulate the one-shot mode.
 		 */
 		ctrl &= ~APBTMR_CONTROL_ENABLE;
-		ctrl &= ~APBTMR_CONTROL_MODE_PERIODIC;
+		if (timer->quirks & APBTMR_QUIRK_INVERSE_PERIODIC)
+			ctrl |= APBTMR_CONTROL_MODE_PERIODIC;
+		else
+			ctrl &= ~APBTMR_CONTROL_MODE_PERIODIC;
 
 		apbt_writel(timer, ctrl, timer->reg_control);
 		/* write again to set free running mode */
diff --git a/include/linux/dw_apb_timer.h b/include/linux/dw_apb_timer.h
index 7d36d91..5d9210cc 100644
--- a/include/linux/dw_apb_timer.h
+++ b/include/linux/dw_apb_timer.h
@@ -36,6 +36,12 @@
  */
 #define APBTMR_QUIRK_INVERSE_INTMASK	BIT(2)
 
+/* The IP uses inverted logic for the bit setting periodic mode.
+ * Periodic means it times out after the period is over and is set to
+ * 1 in the original IP. This IP uses 1 for free running mode.
+ */
+#define APBTMR_QUIRK_INVERSE_PERIODIC	BIT(3)
+
 struct dw_apb_timer {
 	void __iomem				*base;
 	unsigned long				freq;
-- 
1.7.10.4
