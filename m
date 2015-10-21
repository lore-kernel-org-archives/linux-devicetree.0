From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH] bus: sunxi-rsb: Allow building sunxi-rsb as a module
Date: Wed, 21 Oct 2015 17:11:05 +0800
Message-ID: <1445418665-14138-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBK5NTWYQKGQEX62XUXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner Reduced Serial Bus support is only needed for sun[89]i
platforms. Having it built-in for multi-platform kernels leads to
a bigger kernel image, without any benefit for non sun[89]i systems.

The driver already exports the needed symbols and supports module
loading/unloading. Change the Kconfig symbol to tristate to allow
the user to build it as a module.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---

Hi Arnd,

Maxime requested we make the RSB driver and subsequent PMIC drivers
tristate. Please squash this patch into patch 2 of the RSB series
when you apply them.


Thanks
ChenYu

---
 drivers/bus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index e921b8c72f8c..78382de19ed9 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -122,7 +122,7 @@ config SIMPLE_PM_BUS
 	  "External Bus Interface") as found on several Renesas ARM SoCs.
 
 config SUNXI_RSB
-	bool "Allwinner sunXi Reduced Serial Bus Driver"
+	tristate "Allwinner sunXi Reduced Serial Bus Driver"
 	  default MACH_SUN8I || MACH_SUN9I
 	  depends on ARCH_SUNXI
 	  select REGMAP
-- 
2.6.1
