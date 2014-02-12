From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC/PATCH 2/3] arm: Add ARCH_WANT_OF_RANDOMNESS
Date: Wed, 12 Feb 2014 16:49:07 +0000
Message-ID: <20140212164907.0E958C407C9@trevor.secretlab.ca>
References: <1392168805-14200-1-git-send-email-lauraa@codeaurora.org> < 1392168805-14200-3-git-send-email-lauraa@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392168805-14200-3-git-send-email-lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 11 Feb 2014 17:33:24 -0800, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> The stack canary for ARM is currently the same across reboots
> due to lack of randomness early enough. Add ARCH_WANT_OF_RANDOMNESS
> to allow devices to add whatever randomness they need.
> 
> Signed-off-by: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Do you have a draft patch for a user of this yet?

g.

> ---
>  arch/arm/Kconfig              |    3 +++
>  arch/arm/kernel/vmlinux.lds.S |    1 +
>  2 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index e254198..7ab0db1 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -222,6 +222,9 @@ config NEED_RET_TO_USER
>  config ARCH_MTD_XIP
>  	bool
>  
> +config ARCH_WANT_OF_RANDOMNESS
> +	def_bool n
> +
>  config VECTORS_BASE
>  	hex
>  	default 0xffff0000 if MMU || CPU_HIGH_VECTOR
> diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
> index 7bcee5c..2198258 100644
> --- a/arch/arm/kernel/vmlinux.lds.S
> +++ b/arch/arm/kernel/vmlinux.lds.S
> @@ -202,6 +202,7 @@ SECTIONS
>  		INIT_SETUP(16)
>  		INIT_CALLS
>  		CON_INITCALL
> +		EARLY_RANDOM_FUNCS
>  		SECURITY_INITCALL
>  		INIT_RAM_FS
>  	}
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
