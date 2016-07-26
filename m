From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 2/9] clk: sunxi-ng: nk: Make ccu_nk_find_best static
Date: Tue, 26 Jul 2016 15:04:24 +0800
Message-ID: <1469516671-19377-3-git-send-email-wens@csie.org>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBCMX3S6AKGQELAO7LZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1469516671-19377-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

make C=2 reports:

  CHECK   drivers/clk/sunxi-ng/ccu_nk.c
drivers/clk/sunxi-ng/ccu_nk.c:17:6: warning: symbol 'ccu_nk_find_best' was
not declared. Should it be static?

ccu_nk_find_best is only used within ccu_nk.c. So make it static to get
rid of this warning.

Fixes: adbfb0056e03 ("clk: sunxi-ng: Add N-K-factor clock support")
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu_nk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nk.c b/drivers/clk/sunxi-ng/ccu_nk.c
index 4470ffc8cf0d..d6fafb397489 100644
--- a/drivers/clk/sunxi-ng/ccu_nk.c
+++ b/drivers/clk/sunxi-ng/ccu_nk.c
@@ -14,9 +14,9 @@
 #include "ccu_gate.h"
 #include "ccu_nk.h"
 
-void ccu_nk_find_best(unsigned long parent, unsigned long rate,
-		      unsigned int max_n, unsigned int max_k,
-		      unsigned int *n, unsigned int *k)
+static void ccu_nk_find_best(unsigned long parent, unsigned long rate,
+			     unsigned int max_n, unsigned int max_k,
+			     unsigned int *n, unsigned int *k)
 {
 	unsigned long best_rate = 0;
 	unsigned int best_k = 0, best_n = 0;
-- 
2.8.1
