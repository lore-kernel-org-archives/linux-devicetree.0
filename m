From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH v2 1/3] ARM: dts: sun8i: Add basic dtsi
 file for Allwinner R40
Date: Fri, 29 Sep 2017 18:31:53 +0800
Message-ID: <CAGb2v647i7uecshOO=1Pr8U97duSwL_V92GhS3S4J4+0GEkjYw@mail.gmail.com>
References: <20170928092543.45648-1-icenowy@aosc.io> <20170928092543.45648-2-icenowy@aosc.io>
 <20170928151103.ov3o5pn5h7inzzan@flea> <7F10060D-6A37-4417-9E24-1BB007580126@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7F10060D-6A37-4417-9E24-1BB007580126-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 29, 2017 at 6:25 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>
>
> 于 2017年9月28日 GMT+08:00 下午11:11:03, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> 写到:
>>Hi,
>>
>>On Thu, Sep 28, 2017 at 09:25:41AM +0000, Icenowy Zheng wrote:
>>> +            /*
>>> +             * The max-frequency properties in all MMC controller nodes
>>> +             * are conservative values proven to work on Banana Pi M2
>>> +             * Ultra (the first community available R40 board).
>>> +             * As the board doesn't wire MMC3 out, the property is not
>>> +             * set in MMC3.
>>> +             * TODO: measure the accurate max frequency of the controllers.
>>> +             */
>>> +            mmc0: mmc@1c0f000 {
>>> +                    compatible = "allwinner,sun8i-r40-mmc",
>>> +                                 "allwinner,sun50i-a64-mmc";
>>> +                    reg = <0x01c0f000 0x1000>;
>>> +                    clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
>>> +                    clock-names = "ahb", "mmc";
>>> +                    resets = <&ccu RST_BUS_MMC0>;
>>> +                    reset-names = "ahb";
>>> +                    pinctrl-0 = <&mmc0_pins>;
>>> +                    pinctrl-names = "default";
>>> +                    interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>>> +                    max-frequency = <25000000>;
>>> +                    status = "disabled";
>>> +                    #address-cells = <1>;
>>> +                    #size-cells = <0>;
>>> +            };
>>
>>Sorry if it wasn't really clear, but my point was more than you should
>>just drop the max-frequency property
>
> Then set it in the boards' DTS?

Why do you need to set them in the first place? The higher speeds need
voltage control, and the lack of said control means the system won't
use them anyway.

max-frequency would apply better in situations where the board layout
can't guarantee proper signal propagation or timing beyond a certain
frequency. Or if that particular controller instance is flawed or
restricted in some way.


ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
