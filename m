From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/7] arm: Add basic support for MediaTek MT8127 & MT8135
 SoCs
Date: Fri, 19 Sep 2014 13:10:17 +0200
Message-ID: <541C0F19.9020103@gmail.com>
References: <1411095859-18737-1-git-send-email-srv_yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411095859-18737-1-git-send-email-srv_yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Joe.C" <srv_yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anders Berg <anders.berg-M7mHMAq9Yzo@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 19/09/14 05:04, Joe.C wrote:
> This is v3 of adding basic device tree support for MT8127 & MT8135.
> This series is based on Matthias' pull request for mediatek support [1]
> 
> We are planning to upstream drivers for MT8127 & MT8135 SoCs.
> MT8135 is a tablet soc featuring 2 CA7 + 2 CA15. MT8127 is a
> tablet soc with 4 CA7. They share many similar IP components
> with MT65xx series.

The patches look good to me.
I will wait a couple of days if others have comments on them and if not
send a pull request.

Cheers,
Matthias

> 
> Changes in v3:
>  - Changing earlyprintk order and dt-binding based on Matthias' suggestion.
> 
> v2:
>  - Change timer compatible string.
>  - Build dtb for mt8127 & mt8135
>  - Adding earlyprintk support for mt8127 & mt8135
> 
> Joe.C (7):
>   arm: MTK: Add basic support for mt8127
>   arm: mediatek: add dts for 8127 Moose board
>   arm: MTK: Add basic support for mt8135
>   arm: mediatek: add dts for MT8135 evaluation board.
>   dt-bindings: add more chips in documentation for Mediatek SoC
>   arm: dts: Build dtb for mt8127 & mt8135
>   arm: mediatek: Add earlyprintk support for mt8127 & mt8135
> 
>  Documentation/devicetree/bindings/arm/mediatek.txt |  15 ++-
>  arch/arm/Kconfig.debug                             |  20 ++++
>  arch/arm/boot/dts/Makefile                         |   4 +-
>  arch/arm/boot/dts/mt8127-moose.dts                 |  24 +++++
>  arch/arm/boot/dts/mt8127.dtsi                      |  93 +++++++++++++++++
>  arch/arm/boot/dts/mt8135-evbp1.dts                 |  24 +++++
>  arch/arm/boot/dts/mt8135.dtsi                      | 115 +++++++++++++++++++++
>  arch/arm/mach-mediatek/mediatek.c                  |   2 +
>  8 files changed, 293 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm/boot/dts/mt8127-moose.dts
>  create mode 100644 arch/arm/boot/dts/mt8127.dtsi
>  create mode 100644 arch/arm/boot/dts/mt8135-evbp1.dts
>  create mode 100644 arch/arm/boot/dts/mt8135.dtsi
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
