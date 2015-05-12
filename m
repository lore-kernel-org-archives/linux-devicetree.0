From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v7 0/4] ARM: SoC: add a new platform, UniPhier (arch/arm/mach-uniphier)
Date: Tue, 12 May 2015 17:00:04 +0200
Message-ID: <2101307.fSn8Z2ZyBq@wuerfel>
References: <1431058034-5508-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431058034-5508-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 08 May 2015 13:07:10 Masahiro Yamada wrote:
> This is an initial series for supporting Socionext UniPhier SoCs,
> based on ARM Cortex-A9, mainly used for digital TVs, video recorders, etc.
> 
> 
> Masahiro Yamada (4):
>   ARM: UniPhier: add basic support for UniPhier architecture
>   ARM: multi_v7_defconfig: enable UniPhier SoC family
>   ARM: dts: UniPhier: add support for UniPhier SoCs and boards
>   MAINTAINERS: add myself as ARM/UniPhier maintainer

Applied all four patches, to the next/soc, next/defconfig, next/dt and
next/soc branches respectively.

Welcome as our latest new maintainer. In the future, please send
any follow-up patches for the architecture specific code to
arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org in addition to the normal recipients, once you
consider them ready to be applied.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
