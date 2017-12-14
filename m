From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: DT dtc warnings
Date: Thu, 14 Dec 2017 21:40:15 +0100
Message-ID: <CAJKOXPc7M3jeV_hNBBRJKGs3vtNzdrGbW_YETw2n0fXxhqjZ_g@mail.gmail.com>
References: <CAL_JsqJKCzjx3zNigu_0T=Ku=_P2SQEjTx=uVbvr_QxJQR7kYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJKCzjx3zNigu_0T=Ku=_P2SQEjTx=uVbvr_QxJQR7kYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 14, 2017 at 7:21 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
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
> Rob
>
> [1] https://patchwork.kernel.org/patch/10112725/
> [2] https://www.spinics.net/lists/devicetree-compiler/msg01620.html
>
>
> 77 - arch/arm/boot/dts/prima2-evb.dts
>
> 50 - arch/arm/boot/dts/exynos5250-arndale.dts
> 50 - arch/arm/boot/dts/exynos5250-smdk5250.dts
> 50 - arch/arm/boot/dts/exynos5250-snow.dts
> 50 - arch/arm/boot/dts/exynos5250-snow-rev5.dts
> 50 - arch/arm/boot/dts/exynos5250-spring.dts
> 71 - arch/arm/boot/dts/exynos5420-arndale-octa.dts
> 71 - arch/arm/boot/dts/exynos5420-peach-pit.dts
> 71 - arch/arm/boot/dts/exynos5420-smdk5420.dts
> 71 - arch/arm/boot/dts/exynos5422-odroidhc1.dts
> 71 - arch/arm/boot/dts/exynos5422-odroidxu3.dts
> 71 - arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts
> 71 - arch/arm/boot/dts/exynos5422-odroidxu4.dts
> 71 - arch/arm/boot/dts/exynos5800-peach-pi.dts
>

Sure, I can take care of this but in such case it would be better if
Mathieu's (+Cc) patch would be split per-subarch maintainer. I can
base my patch on top of his... but there might be conflicts when
applying to my tree.

Different topic - why not enabling these warnings by default?

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
