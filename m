From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH 1/5] pinctrl: sunxi: refactor pinctrl choice
 selecting for ARM64
Date: Wed,  1 Mar 2017 01:24:40 +0800
Message-ID: <20170228172444.59655-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB6PE23CQKGQENXKW76Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

ARM64 Allwinner SoCs used to have every pinctrl driver selected in
ARCH_SUNXI. Change this to make their default value to (ARM64 &&
ARCH_SUNXI).

Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
---
 drivers/pinctrl/sunxi/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index 816015cf7053..92325736d953 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -48,8 +48,9 @@ config PINCTRL_SUN8I_H3
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN8I_H3_R
-	def_bool MACH_SUN8I
-	select PINCTRL_SUNXI_COMMON
+	def_bool MACH_SUN8I || (ARM64 && ARCH_SUNXI)
+	depends on RESET_CONTROLLER
+	select PINCTRL_SUNXI
 
 config PINCTRL_SUN8I_V3S
 	def_bool MACH_SUN8I
@@ -65,11 +66,11 @@ config PINCTRL_SUN9I_A80_R
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN50I_A64
-	bool
+	def_bool ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
 config PINCTRL_SUN50I_H5
-	bool
+	def_bool ARM64 && ARCH_SUNXI
 	select PINCTRL_SUNXI
 
 endif
-- 
2.11.1
