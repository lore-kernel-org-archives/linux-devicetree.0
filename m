From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 4/7] ARM: sun6i: Protect CPU clock
Date: Thu, 13 Mar 2014 16:14:16 +0100
Message-ID: <1394723659-4995-5-git-send-email-maxime.ripard@free-electrons.com>
References: <1394723659-4995-1-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB74WQ6MQKGQEQAD4EUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1394723659-4995-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Right now, AHB is an indirect child clock of the CPU clock. If that happens to
change, since the CPU clock has no other consumers declared in Linux, it would
be shut down, which is not really a good idea.

Prevent this by forcing it enabled.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/mach-sunxi/sun6i.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/mach-sunxi/sun6i.c b/arch/arm/mach-sunxi/sun6i.c
index c5dc81988ce9..6b3905505fe0 100644
--- a/arch/arm/mach-sunxi/sun6i.c
+++ b/arch/arm/mach-sunxi/sun6i.c
@@ -10,6 +10,7 @@
  * warranty of any kind, whether express or implied.
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <linux/init.h>
@@ -22,9 +23,17 @@
 
 static void __init sun6i_dt_init(void)
 {
+	struct clk *clk;
+
 	sunxi_setup_restart();
 
 	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
+
+	/* Make sure the clocks we absolutely need are enabled */
+	/* CPU clock */
+	clk = clk_get(NULL, "cpu");
+	if (!IS_ERR(clk))
+		clk_prepare_enable(clk);
 }
 
 extern void __init sun6i_reset_init(void);
-- 
1.9.0
