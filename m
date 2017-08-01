From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/3] PINCTRL: Mediatek pinctrl driver for mt2712
Date: Tue, 1 Aug 2017 16:44:29 +0800
Message-ID: <1501577069.32089.0.camel@mtksdaap41>
References: <1501489333-23145-1-git-send-email-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501489333-23145-1-git-send-email-zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, liguo.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2017-07-31 at 16:22 +0800, Zhiyong Tao wrote:
> This series includes three patches:
> 1.Add mt2712 compatible node in binding document.
> 2.Add mt2712 pinctrl device node.
> 3.Add mt2712 pinctrl driver.
> 
> Zhiyong Tao (3):
>   dt-bindings: pinctrl: mt2712: add binding document
>   arm64: dts: mt2712: add pintcrl device node.
>   pinctrl: add mt2712 pinctrl driver
> 
>  .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    1 +
>  arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h      | 1014 +++++++++++
>  arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |   18 +

mt2712e.dtsi doesn't exists in v4.13-rc1.
What's the base for this series?

Joe.C


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
