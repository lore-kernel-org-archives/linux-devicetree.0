From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: mmp: support DT in irq
Date: Fri, 27 Apr 2012 13:06:20 -0600
Message-ID: <20120427190620.D3C313E0B4D@localhost>
References: <1335515957-1798-1-git-send-email-haojian.zhuang@gmail.com>
 <1335515957-1798-4-git-send-email-haojian.zhuang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1335515957-1798-4-git-send-email-haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 27 Apr 2012 16:39:11 +0800, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Append new interrupt driver that could support both pxa168 and mmp2
> silicon. And this driver supports device tree.
> 
> Since CONFIG_SPARSE_IRQ is enabled in arch-mmp, irq driver should
> handle reserved NR_IRQS_LEGACY in irq domain.
> 
> Signed-off-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/mach-mmp/Makefile                   |    2 +-
>  arch/arm/mach-mmp/include/mach/entry-macro.S |    9 +
>  arch/arm/mach-mmp/irq.c                      |  287 ++++++++++++++++++++++++++

It shouldn't be necessary to create an entirely new irq controller
driver that duplicates the functionality of irq-mmp2.c and
irq-pxa168.c.  Instead, the existing drivers should be refactored to
work with both DT and non-DT user.

> diff --git a/arch/arm/mach-mmp/include/mach/entry-macro.S b/arch/arm/mach-mmp/include/mach/entry-macro.S
> index 9cff9e7..6b9d925 100644
> --- a/arch/arm/mach-mmp/include/mach/entry-macro.S
> +++ b/arch/arm/mach-mmp/include/mach/entry-macro.S
> @@ -6,13 +6,19 @@
>   * published by the Free Software Foundation.
>   */
>  
> +#include <asm/irq.h>
>  #include <mach/regs-icu.h>
>  
>  	.macro	get_irqnr_preamble, base, tmp
>  	mrc	p15, 0, \tmp, c0, c0, 0		@ CPUID
>  	and	\tmp, \tmp, #0xff00
>  	cmp	\tmp, #0x5800
> +#ifdef CONFIG_OF
> +	ldr	\base, =mmp_icu_base
> +	ldr	\base, [\base, #0]
> +#else
>  	ldr	\base, =ICU_VIRT_BASE
> +#endif
>  	addne	\base, \base, #0x10c		@ PJ1 AP INT SEL register
>  	addeq	\base, \base, #0x104		@ PJ4 IRQ SEL register
>  	.endm
> @@ -20,5 +26,8 @@
>  	.macro	get_irqnr_and_base, irqnr, irqstat, base, tmp
>  	ldr	\tmp, [\base, #0]
>  	and	\irqnr, \tmp, #0x3f
> +#ifdef CONFIG_OF
> +	add	\irqnr, \irqnr, #NR_IRQS_LEGACY
> +#endif

What do these do?  Does turning on CONFIG_OF break booting with atags?
If so then this will need to be reworked.  CONFIG_OF must not disable
non-devicetree usage.

g.
