From: Santosh Shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: DT dtc warnings
Date: Thu, 14 Dec 2017 12:50:03 -0800
Message-ID: <1dbad435-269f-48e1-c4b1-a6ac6d81eee1@oracle.com>
References: <CAL_JsqJKCzjx3zNigu_0T=Ku=_P2SQEjTx=uVbvr_QxJQR7kYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJKCzjx3zNigu_0T=Ku=_P2SQEjTx=uVbvr_QxJQR7kYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hui Rob,

12/14/2017 10:21 AM, Rob Herring wrote:
> Hi all,
> 
> Below is a current list of ARM boards with more than 40 dtc warnings
> when building with W=1. There's a treewide patch in flight to fix some
> unit-address warnings[1], so those aren't included here. The list is
> grouped by maintainer. AT91, Exynos, and Allwinner continue to be at
> the top of the list and have been for some time (though having
> multiple boards for an SoC can cause lots of duplicated warnings).
> 
> Please help fix these. More checks are being added[2].
> 

[...]

> 
> 52 - arch/arm/boot/dts/keystone-k2e-evm.dts
> 73 - arch/arm/boot/dts/keystone-k2l-evm.dts
> 97 - arch/arm/boot/dts/keystone-k2hk-evm.dts
> 
Nishant is going to help me to address keystone ones.

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
