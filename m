From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/8] ARM: dts: imx7d-sdb: Add GPIO expander node
Date: Fri, 14 Apr 2017 08:32:06 -0700
Message-ID: <CAHQ1cqEJJRB-wYwj_947vPsVJWBKaVWYH-emga8R5_QdbJV1gg@mail.gmail.com>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
 <20170413133242.5068-7-andrew.smirnov@gmail.com> <20170414034659.GH14915@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170414034659.GH14915@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrey Yurovsky <yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 8:47 PM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Apr 13, 2017 at 06:32:40AM -0700, Andrey Smirnov wrote:
>> Add node for U38, a 74LV595PW serial-in shift register that acts as a
>> GPIO expander on the board.
>>
>> Cc: yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/imx7d-sdb.dts | 32 ++++++++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
>> index 5be01a1..e0ff276 100644
>> --- a/arch/arm/boot/dts/imx7d-sdb.dts
>> +++ b/arch/arm/boot/dts/imx7d-sdb.dts
>> @@ -52,6 +52,30 @@
>>               reg = <0x80000000 0x80000000>;
>>       };
>>
>> +     spi4 {
>> +             compatible = "spi-gpio";
>> +             pinctrl-names = "default";
>> +             pinctrl-0 = <&pinctrl_spi1>;
>> +             status = "okay";
>
> The 'status' is not needed in this case.
>

Missed that, will fix in v2.

>> +             gpio-sck = <&gpio1 13 0>;
>> +             gpio-mosi = <&gpio1 9 0>;
>> +             cs-gpios = <&gpio1 12 0>;
>> +             num-chipselects = <1>;
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +
>> +             gpio_spi: gpio_spi@0 {
>
> gpio-expander might be a better node name?
>

Yeah, I agree. I'll change it to extended_io: gpio-expander@0
("Extended IO" is how this part is called out on the schematic)

>> +                     compatible = "fairchild,74hc595";
>> +                     gpio-controller;
>> +                     #gpio-cells = <2>;
>> +                     reg = <0>;
>> +                     registers-number = <1>;
>> +                      /* Enable PERI_3V3, SENSOR_RST_B and HDMI_RST*/
>> +                     registers-default = /bits/ 8 <0x74>;
>
> I do not see this property is documented or supported by kernel.

My bad, some downstream properties leakage. Will remove in v2.

Thanks,
Andrey Smirnov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
