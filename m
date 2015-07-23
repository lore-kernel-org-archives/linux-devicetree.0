From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Add mt6795 basic chip support
Date: Thu, 23 Jul 2015 20:00:49 +0200
Message-ID: <13192995.x2vh6tuCOD@ubix>
References: <1436857093-18637-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436857093-18637-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Choui <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, July 14, 2015 02:58:11 PM Mars Cheng wrote:
> This patch adds basic chip support for Mediatek 8-core chip, mt6795.
> It is also named as Helio X10. It is based on:
> 1. 4.2-rc1
> 2. [PATCH v4 0/2] Add mt6580 basic chip support
> 
> The second one has added some device tree binding documentation for
> mt6580. mt6795 has some device tree binding modifications too.
> To cleanly apply this patch, please apply mt6580 patch set first.
> 
> Changes in v2
> 1. Remove clocks node & bootargs
> 2. Refine stdout-path setting
> 3. Use correct mask value in device tree for arm local timer
> 
> Mars Cheng (2):
>   Document: DT: Add bindings for mediatek MT6795 SoC Platform
>   arm64: dts: mediatek: add mt6795 support
> 
>  Documentation/devicetree/bindings/arm/mediatek.txt |   9 +-
>  .../bindings/arm/mediatek/mediatek,sysirq.txt      |   3 +-
>  .../devicetree/bindings/serial/mtk-uart.txt        |   5 +-
>  arch/arm64/boot/dts/mediatek/Makefile              |   1 +
>  arch/arm64/boot/dts/mediatek/mt6795-evb.dts        |  37 +++++
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi           | 162
> +++++++++++++++++++++ 6 files changed, 212 insertions(+), 5 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6795-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6795.dtsi

Your series is not based on v4.2-rc1, anyway I fixed it and applied to v4.2-
next/arm64

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
