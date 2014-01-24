From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 4/8] ARM: do CPU-specific init for Broadcom Brahma15
 cores
Date: Fri, 24 Jan 2014 10:54:48 +0000
Message-ID: <20140124105448.GA814@e106331-lin.cambridge.arm.com>
References: <1390361452-3124-1-git-send-email-marc.ceeeee@gmail.com>
 <1390361452-3124-5-git-send-email-marc.ceeeee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1390361452-3124-5-git-send-email-marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 22, 2014 at 03:30:48AM +0000, Marc Carino wrote:
> Perform any CPU-specific initialization required on the
> Broadcom Brahma-15 core.
> 
> Signed-off-by: Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/mm/proc-v7.S |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
> index bd17819..98ea423 100644
> --- a/arch/arm/mm/proc-v7.S
> +++ b/arch/arm/mm/proc-v7.S
> @@ -193,6 +193,7 @@ __v7_cr7mp_setup:
>  	b	1f
>  __v7_ca7mp_setup:
>  __v7_ca15mp_setup:
> +__v7_b15mp_setup:
>  	mov	r10, #0
>  1:
>  #ifdef CONFIG_SMP
> @@ -494,6 +495,16 @@ __v7_ca15mp_proc_info:
>  	.size	__v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
>  
>  	/*
> +	 * Broadcom Corporation Brahma-B15 processor.
> +	 */
> +	.type	__v7_b15mp_proc_info, #object
> +__v7_b15mp_proc_info:
> +	.long	0x420f00f0
> +	.long	0xff0ffff0
> +	__v7_proc __v7_b15mp_setup, hwcaps = HWCAP_IDIV

On the third posting, Will Deacon asked if the hwcap override was really
required [1]. Two postings later there's been no answer.

Is your CPUID_EXT_ISAR0 value wrong? If so, please add a comment to that
effect (as with __krait_proc_info).

Thanks,
Mark.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-January/225895.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
