From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sunxi: A10s Olinuxino add missing SPI and simplefb.
Date: Sun, 26 Apr 2015 11:21:34 +0200
Message-ID: <CAOMqctTKoDeLqii7YEEv80B+Ru4tsVwiGYB0-u7XLPqNoEiCTQ@mail.gmail.com>
References: <cover.1430034797.git.hramrach@gmail.com> <f6e34cb3f0b72fcb0ae18ccf96962fb8a1c477f7.1430034797.git.hramrach@gmail.com>
 <20150426083958.GD5627@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150426083958.GD5627@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On 26 April 2015 at 10:39, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Mon, Mar 23, 2015 at 03:00:31PM +0100, Michal Suchanek wrote:
>> Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

>>  &ohci0 {
>>       status = "okay";
>>  };
>> diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
>> index a78c95d..438eba1 100644
>> --- a/arch/arm/boot/dts/sun5i-a10s.dtsi
>> +++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
>> @@ -154,6 +154,20 @@
>>                       clocks = <&apb1_gates 18>;
>>                       status = "disabled";
>>               };
>> +
>> +             spi2: spi@01c17000 {
>> +                     compatible = "allwinner,sun4i-a10-spi";
>> +                     reg = <0x01c17000 0x1000>;
>> +                     interrupts = <12>;
>> +                     clocks = <&ahb_gates 22>, <&spi2_clk>;
>> +                     clock-names = "ahb", "mod";
>> +                     dmas = <&dma SUN4I_DMA_DEDICATED 29>,
>> +                            <&dma SUN4I_DMA_DEDICATED 28>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +             };
>>       };
>>  };
>
> This should be in sun5i.dtsi (and in a separate patch).
>
>> @@ -198,4 +212,18 @@
>>               allwinner,drive = <SUN4I_PINCTRL_30_MA>;
>>               allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>>       };
>> +
>> +     spi2_pins_a: spi2@0 {
>> +             allwinner,pins = "PB11", "PB12", "PB13", "PB14";
>> +             allwinner,function = "spi2";
>> +             allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>> +             allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>> +     };
>> +
>> +     spi2_pins_b: spi2@1 {
>> +             allwinner,pins = "PE00", "PE01", "PE02", "PE03";
>> +             allwinner,function = "spi2";
>> +             allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>> +             allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>> +     };
>>  };
>
> Ditto.
>

A13 does not have these pins so maybe not?

Thanks

Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
