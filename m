From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 2/4] mtd: nand: Allow MTD_NAND_BRCMNAND to be selected for ARM64
Date: Fri, 16 Oct 2015 18:24:21 +0200
Message-ID: <5673177.0QYFhMPCBq@wuerfel>
References: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com> <1444986537-28387-3-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444986537-28387-3-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Sandeep Tripathy <tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pramod KUMAR <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 16 October 2015 14:38:55 Anup Patel wrote:
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 3324281..a1b5819 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -393,7 +393,7 @@ config MTD_NAND_GPMI_NAND
>  
>  config MTD_NAND_BRCMNAND
>         tristate "Broadcom STB NAND controller"
> -       depends on ARM || MIPS
> +       depends on ARM || ARM64 || MIPS
>         help
>           Enables the Broadcom NAND controller driver. The controller was
>           originally designed for Set-Top Box but is used on various BCM7xxx,
> -- 
> 

I think you also need this one:

8<-----------
>From 0ab7b2d32921b3f3da15274d8c3982ba1d54660f Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Date: Thu, 4 Jun 2015 09:25:59 +0200
Subject: [PATCH] mtd: brcmnand depends on MTD_NAND

MTD_NAND_BRCMNAND uses the generic nand functions, but is currently allowed
to be built without CONFIG_MTD_NAND, which results in a link error:

drivers/built-in.o: In function `brcmnand_remove':
coresight-replicator.c:(.text+0x17ae6c): undefined reference to `nand_release'
drivers/built-in.o: In function `brcmnand_probe':
coresight-replicator.c:(.text+0x17d4b4): undefined reference to `nand_scan_ident'
coresight-replicator.c:(.text+0x17d948): undefined reference to `nand_scan_tail'

This adds an explicit Kconfig dependency.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 289664089cf3..4b7e853ce35d 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -393,6 +393,7 @@ config MTD_NAND_GPMI_NAND
 
 config MTD_NAND_BRCMNAND
 	tristate "Broadcom STB NAND controller"
+	depends on MTD_NAND
 	depends on ARM || ARM64 || MIPS
 	help
 	  Enables the Broadcom NAND controller driver. The controller was

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
