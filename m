From: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 RESEND 3/4] ARM: bcm2835: Add header file for pinctrl
 constants
Date: Wed, 25 Feb 2015 14:21:48 +0000
Message-ID: <20150225142148.GM21323@x1>
References: <1422555050-28509-1-git-send-email-stefan.wahren@i2se.com>
 <1422555050-28509-4-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422555050-28509-4-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 29 Jan 2015, Stefan Wahren wrote:

> This new header file defines pincontrol constants to use
> from bcm2835 DTS files for pincontrol properties option.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  include/dt-bindings/pinctrl/bcm2835.h |   27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/bcm2835.h

Applied with Rob's Ack.

NB: And Stephen's for the set.

> diff --git a/include/dt-bindings/pinctrl/bcm2835.h b/include/dt-bindings/pinctrl/bcm2835.h
> new file mode 100644
> index 0000000..6f0bc37
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/bcm2835.h
> @@ -0,0 +1,27 @@
> +/*
> + * Header providing constants for bcm2835 pinctrl bindings.
> + *
> + * Copyright (C) 2015 Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_BCM2835_H__
> +#define __DT_BINDINGS_PINCTRL_BCM2835_H__
> +
> +/* brcm,function property */
> +#define BCM2835_FSEL_GPIO_IN	0
> +#define BCM2835_FSEL_GPIO_OUT	1
> +#define BCM2835_FSEL_ALT5	2
> +#define BCM2835_FSEL_ALT4	3
> +#define BCM2835_FSEL_ALT0	4
> +#define BCM2835_FSEL_ALT1	5
> +#define BCM2835_FSEL_ALT2	6
> +#define BCM2835_FSEL_ALT3	7
> +
> +#endif /* __DT_BINDINGS_PINCTRL_BCM2835_H__ */
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
