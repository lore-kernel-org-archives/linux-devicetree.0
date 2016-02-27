From: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH V5 0/3] add gpio/pinctrl/spi DTS for hi6220 and hikey
Date: Sat, 27 Feb 2016 17:53:31 +0800
Message-ID: <56D1721B.1080506@hisilicon.com>
References: <1455883107-8411-1-git-send-email-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455883107-8411-1-git-send-email-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Guodong,

On 19/02/2016 19:58, Guodong Xu wrote:
> As of V4, this patchset has been ack'ed by Rob Herring.
> 
> V5, added pmx0 pmx1 pmx2 nodes description into hi6220.dtsi.
> 
> Zhong Kaihua (3):
>   arm64: dts: Add Hi6220 gpio configuration nodes
>   arm64: dts: add Hi6220 pinctrl configuration nodes
>   arm64: dts: add Hi6220 spi configuration nodes
> 
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts   |   3 +
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi        | 351 +++++++++++
>  arch/arm64/boot/dts/hisilicon/hikey-gpio.dtsi    | 607 +++++++++++++++++++
>  arch/arm64/boot/dts/hisilicon/hikey-pinctrl.dtsi | 705 +++++++++++++++++++++++
>  include/dt-bindings/pinctrl/hisi.h               |  59 ++
>  5 files changed, 1725 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/hisilicon/hikey-gpio.dtsi
>  create mode 100644 arch/arm64/boot/dts/hisilicon/hikey-pinctrl.dtsi
>  create mode 100644 include/dt-bindings/pinctrl/hisi.h
> 

Applied all the patches into the hisilicon soc tree.
Thanks!

Best Regards,
Wei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
