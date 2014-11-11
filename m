From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH] ARM: imx: temporarily remove CONFIG_SOC_FSL from LS1021A
Date: Tue, 11 Nov 2014 17:03:25 +0100
Message-ID: <1727581.y25NQPsRIm@wuerfel>
References: <1414746073-12394-1-git-send-email-jingchang.lu@freescale.com> <1414746073-12394-6-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414746073-12394-6-git-send-email-jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The newly introduced LS1021A SoC selects CONFIG_SOC_FSL, which
is originally symbol used for the PowerPC based platforms
and guards lots of code that does not build on ARM.

This breaks allmodconfig, so let's remove it for now, until
either all those drivers are fixed or they use a dependency
on IMX instead.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

---
On Friday 31 October 2014 17:01:12 Jingchang Lu wrote:
> From: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> The LS1021A SoC is a dual-core Cortex-A7 based processor,
> this adds the initial support for it.
> 
> Signed-off-by: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

>  
> +config FSL_SOC
> +       bool
> +
> +config SOC_LS1021A
> +       bool "Freescale LS1021A support"
> +       select ARM_GIC
> +       select HAVE_ARM_ARCH_TIMER
> +       select FSL_SOC
>


This broke allmodconfig builds in linux-next, please apply this
partial revert for the moment.

	Arnd

---
diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index ef549ef1cd6d..e8627e04e1e6 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -658,14 +658,10 @@ choice
 
 endchoice
 
-config FSL_SOC
-	bool
-
 config SOC_LS1021A
 	bool "Freescale LS1021A support"
 	select ARM_GIC
 	select HAVE_ARM_ARCH_TIMER
-	select FSL_SOC
 	select PCI_DOMAINS if PCI
 	select ZONE_DMA if ARM_LPAE
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
