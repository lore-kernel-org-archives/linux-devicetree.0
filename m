From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 4/4] arm/arm64: arch_timer: Use archdata to indicate
 vdso suitability
Date: Thu, 7 Jul 2016 16:18:43 +0100
Message-ID: <20160707151843.GD20682@arm.com>
References: <1467877572-10817-1-git-send-email-oss@buserror.net>
 <1467877572-10817-4-git-send-email-oss@buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467877572-10817-4-git-send-email-oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 07, 2016 at 02:46:12AM -0500, Scott Wood wrote:
> Instead of comparing the name to a magic string, use archdata to
> explicitly communicate whether the arch timer is suitable for
> direct vdso access.
> 
> Signed-off-by: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
> ---
> v4: new patch
> 
> I'm putting this after the other patches, in the hopes that if there
> are issues with this patch, it doesn't hold up the others.
> 
>  arch/arm/Kconfig                     |  1 +
>  arch/arm/include/asm/clocksource.h   |  8 ++++++++
>  arch/arm/kernel/vdso.c               |  2 +-
>  arch/arm64/Kconfig                   |  1 +
>  arch/arm64/include/asm/clocksource.h |  8 ++++++++
>  arch/arm64/kernel/vdso.c             |  2 +-
>  drivers/clocksource/arm_arch_timer.c | 11 +++--------
>  7 files changed, 23 insertions(+), 10 deletions(-)
>  create mode 100644 arch/arm/include/asm/clocksource.h
>  create mode 100644 arch/arm64/include/asm/clocksource.h
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 90542db..dcdcd78 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1,6 +1,7 @@
>  config ARM
>  	bool
>  	default y
> +	select ARCH_CLOCKSOURCE_DATA
>  	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
>  	select ARCH_HAS_DEVMEM_IS_ALLOWED
>  	select ARCH_HAS_ELF_RANDOMIZE
> diff --git a/arch/arm/include/asm/clocksource.h b/arch/arm/include/asm/clocksource.h
> new file mode 100644
> index 0000000..0b350a7
> --- /dev/null
> +++ b/arch/arm/include/asm/clocksource.h
> @@ -0,0 +1,8 @@
> +#ifndef _ASM_CLOCKSOURCE_H
> +#define _ASM_CLOCKSOURCE_H
> +
> +struct arch_clocksource_data {
> +	bool vdso_direct;	/* Usable for direct VDSO access? */
> +};
> +
> +#endif
> diff --git a/arch/arm/kernel/vdso.c b/arch/arm/kernel/vdso.c
> index 994e971..a0affd1 100644
> --- a/arch/arm/kernel/vdso.c
> +++ b/arch/arm/kernel/vdso.c
> @@ -270,7 +270,7 @@ static bool tk_is_cntvct(const struct timekeeper *tk)
>  	if (!IS_ENABLED(CONFIG_ARM_ARCH_TIMER))
>  		return false;
>  
> -	if (strcmp(tk->tkr_mono.clock->name, "arch_sys_counter") != 0)
> +	if (!tk->tkr_mono.clock->archdata.vdso_direct)
>  		return false;
>  
>  	return true;
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 5a0a691..24c4b2c 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -3,6 +3,7 @@ config ARM64
>  	select ACPI_CCA_REQUIRED if ACPI
>  	select ACPI_GENERIC_GSI if ACPI
>  	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
> +	select ARCH_CLOCKSOURCE_DATA
>  	select ARCH_HAS_DEVMEM_IS_ALLOWED
>  	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
>  	select ARCH_HAS_ELF_RANDOMIZE
> diff --git a/arch/arm64/include/asm/clocksource.h b/arch/arm64/include/asm/clocksource.h
> new file mode 100644
> index 0000000..0b350a7
> --- /dev/null
> +++ b/arch/arm64/include/asm/clocksource.h
> @@ -0,0 +1,8 @@
> +#ifndef _ASM_CLOCKSOURCE_H
> +#define _ASM_CLOCKSOURCE_H
> +
> +struct arch_clocksource_data {
> +	bool vdso_direct;	/* Usable for direct VDSO access? */
> +};

Looks fine to me. I'd rather we followed exactly what x86 does here, in
the hope that it can eventually find its way into core code, but there's
no ABI implication for this structure so we can always do that later.

Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
