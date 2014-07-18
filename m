From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 6/7] ARM: dts: rockchip: add core rk3288 dtsi
Date: Fri, 18 Jul 2014 10:35:52 +0100
Message-ID: <20140718093551.GE25180@leverpostej>
References: <4868343.UFgjaXesOn@diego>
 <14646641.DlFrJR068n@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <14646641.DlFrJR068n@diego>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu@500 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a12";
> +                       reg = <0x500>;
> +               };
> +               cpu@501 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a12";
> +                       reg = <0x501>;
> +               };
> +               cpu@502 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a12";
> +                       reg = <0x502>;
> +               };
> +               cpu@503 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a12";
> +                       reg = <0x503>;

I take it that we can only use one of these for the moment? I didn't see
the addition of any SMP code.

Or did I miss that?

[...]

> +       timer {
> +               compatible = "arm,armv7-timer";
> +               interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                            <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                            <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                            <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +               clock-frequency = <24000000>;
> +       };

Please say you don't need this clock-frequency property.

It's a work-around at best, and you won't be able to use Hyp properly.
I'd really like to discourage use of this property, especially as people
seem to set it regardless of whether the hardware's correct...

What's the state of CNTFREQ and CNTVOFF, and is there any chance that
these are sane?

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
