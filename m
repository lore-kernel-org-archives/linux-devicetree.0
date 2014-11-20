From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/9] clk: sunxi: Make sun4i_a10_mod0_data
 available outside of clk-mod0.c
Date: Thu, 20 Nov 2014 16:55:21 +0100
Message-ID: <1416498928-1300-3-git-send-email-hdegoede@redhat.com>
References: <1416498928-1300-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORB7U5XCRQKGQELGYJ4BY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1416498928-1300-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The sun6i prcm has mod0 compatible clocks, these need a separate driver
because the prcm uses the mfd framework, but we do want to re-use the
standard mod0 clk handling from clk-mod0.c for this, export
sun4i_a10_mod0_data, so that the prcm mod0 clk driver can use this.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/sunxi/clk-mod0.c | 2 +-
 drivers/clk/sunxi/clk-mod0.h | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/sunxi/clk-mod0.h

diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
index 9530833..0989502 100644
--- a/drivers/clk/sunxi/clk-mod0.c
+++ b/drivers/clk/sunxi/clk-mod0.c
@@ -67,7 +67,7 @@ static struct clk_factors_config sun4i_a10_mod0_config = {
 	.pwidth = 2,
 };
 
-static const struct factors_data sun4i_a10_mod0_data __initconst = {
+const struct factors_data sun4i_a10_mod0_data = {
 	.enable = 31,
 	.mux = 24,
 	.table = &sun4i_a10_mod0_config,
diff --git a/drivers/clk/sunxi/clk-mod0.h b/drivers/clk/sunxi/clk-mod0.h
new file mode 100644
index 0000000..49aa9ab
--- /dev/null
+++ b/drivers/clk/sunxi/clk-mod0.h
@@ -0,0 +1,8 @@
+#ifndef __MACH_SUNXI_CLK_MOD0_H
+#define __MACH_SUNXI_CLK_MOD0_H
+
+#include "clk-factors.h"
+
+extern const struct factors_data sun4i_a10_mod0_data;
+
+#endif
-- 
2.1.0
