From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 04/17] clk: at91: add PMC macro file for dt definitions
Date: Thu, 17 Oct 2013 17:47:44 +0200
Message-ID: <526006A0.1080704@atmel.com>
References: <1381477081-6041-1-git-send-email-b.brezillon@overkiz.com> <1381480885-11994-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381480885-11994-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/10/2013 10:41, Boris BREZILLON :
> This patch adds a new macro file for PMC macros.
>
> This macro file includes the definitions of SR (status register) bit
> offsets and will be use to reference PMC irqs.
>
> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

> ---
>   include/dt-bindings/clk/at91.h |   22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>   create mode 100644 include/dt-bindings/clk/at91.h
>
> diff --git a/include/dt-bindings/clk/at91.h b/include/dt-bindings/clk/at91.h
> new file mode 100644
> index 0000000..0b4cb99
> --- /dev/null
> +++ b/include/dt-bindings/clk/at91.h
> @@ -0,0 +1,22 @@
> +/*
> + * This header provides constants for AT91 pmc status.
> + *
> + * The constants defined in this header are being used in dts.
> + *
> + * Licensed under GPLv2 or later.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_AT91_H
> +#define _DT_BINDINGS_CLK_AT91_H
> +
> +#define AT91_PMC_MOSCS		0		/* MOSCS Flag */
> +#define AT91_PMC_LOCKA		1		/* PLLA Lock */
> +#define AT91_PMC_LOCKB		2		/* PLLB Lock */
> +#define AT91_PMC_MCKRDY		3		/* Master Clock */
> +#define AT91_PMC_LOCKU		6		/* UPLL Lock */
> +#define AT91_PMC_PCKRDY(id)	(8 + (id))	/* Programmable Clock */
> +#define AT91_PMC_MOSCSELS	16		/* Main Oscillator Selection */
> +#define AT91_PMC_MOSCRCS	17		/* Main On-Chip RC */
> +#define AT91_PMC_CFDEV		18		/* Clock Failure Detector Event */
> +
> +#endif
>


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
