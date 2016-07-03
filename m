From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/2] Add mt6755 basic chip support
Date: Sun, 3 Jul 2016 07:59:46 +0200
Message-ID: <6516278a-4a21-3d67-bda2-ad861d56dd89@gmail.com>
References: <1467166173-9029-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467166173-9029-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Choui <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 06/29/2016 04:09 AM, Mars Cheng wrote:
> This patch adds basic support for Mediatek's new 8-core chip, mt6755.
> Based on 4.7-rc1
>
> Changes in v3:
> 1. use evb as project suffix
> 2. add "disable" property for uart dts nodes
> 3. only alias uart0 as serial0, since we don't enable uart1
> 4. confirm all acks are added
>
> Mars Cheng (2):
>   Document: DT: Add bindings for mediatek MT6755 SoC Platform
>   arm64: dts: mediatek: add mt6755 support
>

Applied, thanks.

Matthias

> Mars Cheng (2):
>   Document: DT: Add bindings for mediatek MT6755 SoC Platform
>   arm64: dts: mediatek: add mt6755 support
>
>  Documentation/devicetree/bindings/arm/mediatek.txt |    4 +
>  .../interrupt-controller/mediatek,sysirq.txt       |    1 +
>  .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
>  arch/arm64/boot/dts/mediatek/Makefile              |    1 +
>  arch/arm64/boot/dts/mediatek/mt6755-evb.dts        |   38 +++++
>  arch/arm64/boot/dts/mediatek/mt6755.dtsi           |  145 ++++++++++++++++++++
>  6 files changed, 190 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6755-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6755.dtsi
>
> --
> 1.7.9.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
