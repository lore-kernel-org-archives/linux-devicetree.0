From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: vexpress: Initial RS1 memory map support
Date: Thu, 17 Nov 2011 15:36:24 +0000
Message-ID: <20111117153624.GR9581@n2100.arm.linux.org.uk>
References: <1321036026-23411-1-git-send-email-pawel.moll@arm.com>
 <1321036026-23411-5-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1321036026-23411-5-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 11, 2011 at 06:27:05PM +0000, Pawel Moll wrote:
> diff --git a/arch/arm/mach-vexpress/Kconfig b/arch/arm/mach-vexpress/Kconfig
> index 4c11e90..d1b0f35 100644
> --- a/arch/arm/mach-vexpress/Kconfig
> +++ b/arch/arm/mach-vexpress/Kconfig
> @@ -1,6 +1,14 @@
>  menu "Versatile Express platform type"
>  	depends on ARCH_VEXPRESS
>  
> +config ARCH_VEXPRESS_LEGACY
> +	bool
> +	select AUTO_ZRELADDR
> +	select ARM_PATCH_PHYS_VIRT
> +
> +config ARCH_VEXPRESS_RS1
> +	bool
> +
>  config ARCH_VEXPRESS_CA9X4
>  	bool "Versatile Express Cortex-A9x4 tile"
>  	select CPU_V7
> @@ -8,6 +16,7 @@ config ARCH_VEXPRESS_CA9X4
>  	select ARM_ERRATA_720789
>  	select ARM_ERRATA_751472
>  	select ARM_ERRATA_753970
> +	select ARCH_VEXPRESS_LEGACY

This doesn't make sense.  Why should CA9x4 be forced to use the P2V stuff
and the AUTO_ZRELADDR stuff?  Hint: it works fine today without.

>  
>  config ARCH_VEXPRESS_DT
>  	bool
> diff --git a/arch/arm/mach-vexpress/Makefile.boot b/arch/arm/mach-vexpress/Makefile.boot
> index 8630b3d..3278615 100644
> --- a/arch/arm/mach-vexpress/Makefile.boot
> +++ b/arch/arm/mach-vexpress/Makefile.boot
> @@ -1,3 +1,3 @@
> -   zreladdr-y	+= 0x60008000
> -params_phys-y	:= 0x60000100
> -initrd_phys-y	:= 0x60800000
> +   zreladdr-y	+= 0x80008000
> +params_phys-y	:= 0x80000100
> +initrd_phys-y	:= 0x80800000

So is this the reason - you don't want to turn this into a config, so you
want to force all the automatic zreladdr stuff on?  You do know that this
will probably cause uboot to load the uImage at 0x80008000 instead of
0x60008000, and therefore we'll lose half the RAM on this board?
