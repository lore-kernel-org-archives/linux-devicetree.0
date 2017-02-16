From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM64: Initial Realtek RTD1295 enablement
Date: Thu, 16 Feb 2017 14:51:08 +0100
Message-ID: <2627010.mZmgFkHdOI@wuerfel>
References: <20170214033440.18667-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170214033440.18667-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, service-qoVzM6YEWSw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, February 14, 2017 4:34:35 AM CET Andreas Färber wrote:
> 
> This mini-series adds initial support for the Realtek RTD1295 SoC and
> the Zidoo X9S TV box.
> 
> With these patches CPU0 can be booted with earlycon.
> 
> PSCI doesn't work despite present in the vendor device tree; as enable-method
> it instead used a custom "rtk-spin-table" that I sadly have no source code of.
> 
> The UARTs use a custom interrupt controller that I again lack source code of;
> with interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH> it can boot into an initrd.
> 
> The boot process is slightly twisted: The files need to be loaded from a
> 32-bit U-Boot, then boot into 64-bit U-Boot where the kernel can be booted.
> Similar to my previous Amlogic S905 work, the TEXT_OFFSET poses a problem, so
> a uImage needs to be used (or the kernel patched) for load address 0x00280000.
> I haven't succeeded loading an initrd via bootm/booti; but as quick workaround
> initrd=$rootfs_loadaddr,0x$filesize can manually be specified in $bootargs.
> 
> 

Nice!

You can add my

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

please them to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org after the merge window as a patch
set, so we can add them for 4.12.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
