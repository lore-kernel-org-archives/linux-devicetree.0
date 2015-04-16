From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: UniPhier: add basic support for UniPhier architecture
Date: Thu, 16 Apr 2015 11:41:48 +0200
Message-ID: <3655031.20bjeBBBYS@wuerfel>
References: <1429170038-16757-1-git-send-email-yamada.masahiro@socionext.com> <1429170038-16757-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429170038-16757-2-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 16 April 2015 16:40:35 Masahiro Yamada wrote:

>+ENTRY(uniphier_secondary_startup)
>+       bl      v7_invalidate_l1
>+       b       secondary_startup
>+ENDPROC(uniphier_secondary_startup)

Since this file is really trivial, I wonder if you could just use
a 'naked' inline assembly function from C code here, to have
the entire SMP support in one file.

> +
> +#define ROM_BOOT_ROMRSV2		0x59801208

Please don't hardcode any physical addresses, instead find the DT node
or syscon device in the _boot_secondary implementation.


Which device is this register part of?

> +
> +static const char * const uniphier_board_dt_compat[] __initconst = {
> +	"socionext,ph1-sld3",
> +	"socionext,ph1-ld4",
> +	"socionext,ph1-pro4",
> +	"socionext,ph1-sld8",
> +	"socionext,ph1-pro5",
> +	"socionext,ph1-proxstream2",
> +	"socionext,ph1-ld6b",
> +	NULL,
> +};

Are these chip names or board names? The list should normally have
just the socs, which I assume you do, but it's not completely clear
from the source.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
