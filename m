From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC PATCH] EDAC: Cleanup atomic_scrub mess
Date: Thu, 28 May 2015 13:34:49 +0100
Message-ID: <20150528123448.GA2067@n2100.arm.linux.org.uk>
References: <1431991481-25684-1-git-send-email-lho@apm.com>
 <1431991481-25684-2-git-send-email-lho@apm.com>
 <20150519170308.GL4641@pd.tnic>
 <CAPw-ZT=mTpt_vz+e=rM5ywK8feNKkJQrpEWg=noRCziJ0840TQ@mail.gmail.com>
 <20150519203336.GP4641@pd.tnic>
 <20150521180719.GE3689@pd.tnic>
 <20150521181157.GF3689@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150521181157.GF3689-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Chris Metcalf <cmetcalf-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "Steven J. Hill" <Steven.Hill-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, ". Maciej W. Rozycki" <macro-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 08:11:57PM +0200, Borislav Petkov wrote:
> From: Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>
> 
> So first of all, this atomic_scrub() function's naming is bad. It looks
> like an atomic_t helper. Change it to edac_atomic_scrub().
> 
> The bigger problem is that this function is arch-specific and every new
> arch which doesn't necessarily need that functionality still needs to
> define it, otherwise EDAC doesn't compile.
> 
> So instead of doing that and including arch-specific headers, have each
> arch define an EDAC_ATOMIC_SCRUB symbol which can be used in edac_mc.c
> for ifdeffery. Much cleaner.
> 
> We already are doing this with another symbol - EDAC_SUPPORT. This is
> also much cleaner than having CONFIG_EDAC explicitly depend on all the
> arches which need/have EDAC support and drivers.
> 
> This way I can kill the useless edac.h header in tile too.
> 
> Signed-off-by: Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>

Acked-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>

> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 45df48ba0b12..325d6f3a596a 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -15,6 +15,8 @@ config ARM
>  	select CLONE_BACKWARDS
>  	select CPU_PM if (SUSPEND || CPU_IDLE)
>  	select DCACHE_WORD_ACCESS if HAVE_EFFICIENT_UNALIGNED_ACCESS
> +	select EDAC_SUPPORT
> +	select EDAC_ATOMIC_SCRUB

I wonder if it would make sense to conditionalise EDAC_SUPPORT on...
		if CPU_32v6 || CPU_32v7

since presumably its not useful for older architectures (certainly
edac_atomic_scrub() is a no-op for earlier arches.)

>  	select GENERIC_ALLOCATOR
>  	select GENERIC_ATOMIC64 if (CPU_V7M || CPU_V6 || !CPU_32v6K || !AEABI)
>  	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
> diff --git a/arch/arm/include/asm/edac.h b/arch/arm/include/asm/edac.h
> index 0df7a2c1fc3d..5189fa819b60 100644
> --- a/arch/arm/include/asm/edac.h
> +++ b/arch/arm/include/asm/edac.h
> @@ -18,11 +18,12 @@
>  #define ASM_EDAC_H
>  /*
>   * ECC atomic, DMA, SMP and interrupt safe scrub function.
> - * Implements the per arch atomic_scrub() that EDAC use for software
> + * Implements the per arch edac_atomic_scrub() that EDAC use for software
>   * ECC scrubbing.  It reads memory and then writes back the original
>   * value, allowing the hardware to detect and correct memory errors.
>   */
> -static inline void atomic_scrub(void *va, u32 size)
> +
> +static inline void edac_atomic_scrub(void *va, u32 size)
>  {
>  #if __LINUX_ARM_ARCH__ >= 6
>  	unsigned int *virt_addr = va;

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
