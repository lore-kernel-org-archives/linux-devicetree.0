From: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: restrict BCM_KONA_UART to ARCH_BCM_MOBILE
Date: Thu, 6 Mar 2014 19:25:08 -0800
Message-ID: <CAAYSxhpFDGyaABe7CrgBFYBcA+0VXSF1kewV1ENKt3VGpYK6aQ@mail.gmail.com>
References: <1394127959-3159-1-git-send-email-f.fainelli@gmail.com>
	<1394127959-3159-3-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394127959-3159-3-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jpeshkin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 6, 2014 at 9:45 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Low-level debugging using the Broadcom Kona UART only makes sense on the
> ARCH_BCM_MOBILE platform and would otherwise prevent ARCH_BCM_63XX from
> picking up the right UART implementation by default.
>
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/Kconfig.debug | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index 0531da8e5216..c23f52445308 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -108,7 +108,7 @@ choice
>
>         config DEBUG_BCM_KONA_UART
>                 bool "Kernel low-level debugging messages via BCM KONA UART"
> -               depends on ARCH_BCM
> +               depends on ARCH_BCM_MOBILE
>                 select DEBUG_UART_8250
>                 help
>                   Say Y here if you want kernel low-level debugging support
> --
> 1.8.3.2

Reviewed-by: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
