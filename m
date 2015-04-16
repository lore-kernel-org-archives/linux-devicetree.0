From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: UniPhier: add support for UniPhier SoCs and boards
Date: Thu, 16 Apr 2015 11:44:49 +0200
Message-ID: <2204571.AOVr95oO32@wuerfel>
References: <1429170038-16757-1-git-send-email-yamada.masahiro@socionext.com> <1429170038-16757-4-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429170038-16757-4-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 16 April 2015 16:40:37 Masahiro Yamada wrote:
> +
> +/ {
> +	model = "UniPhier PH1-LD4 Reference Board";
> +	compatible = "socionext,ph1-ld4-ref", "socionext,ph1-ld4";
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS0,115200 earlyprintk";
> +	};

I would remove the 'earlyprintk' option here. You don't add any options
for the platform in Kconfig.debug, and I hope that we can eventually
start using earlycon. Please add an appropriate stdio-path property
here, but note that we are still lacking the fixmap patches to make
earlycon work.

Otherwise looks good.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
