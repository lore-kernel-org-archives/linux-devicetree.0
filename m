From: Yung-Ching LIN <yungching0725-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [v2] ARM: dts: imx: Add support for Advantech DMS-BA16
Date: Mon, 5 Feb 2018 18:25:36 -0800
Message-ID: <CACGtqyy1gtkZ+RD2aBzNZFGSXZTJAut5j+2yai8mWNHN1pkj+A@mail.gmail.com>
References: <20180206000501.14641-1-yungching0725@gmail.com> <CAOMZO5CzDXxyzG9yC+26X4Ubek0bWMa_gxfBc4iQpBGxhbQ5DA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5CzDXxyzG9yC+26X4Ubek0bWMa_gxfBc4iQpBGxhbQ5DA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

Thank you for your comments.
Will provide the v3 for the fixes

On Mon, Feb 5, 2018 at 4:13 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Ken,
>
> On Mon, Feb 5, 2018 at 10:05 PM, Ken Lin <yungching0725-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index ade7a38543dc..585c3da4a47a 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -435,6 +435,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>>         imx6q-dfi-fs700-m60.dtb \
>>         imx6q-display5-tianma-tm070-1280x768.dtb \
>>         imx6q-dmo-edmqmx6.dtb \
>> +       imx6q-dms-ba16.dtb \
>>         imx6q-evi.dtb \
>>         imx6q-gk802.dtb \
>>         imx6q-gw51xx.dtb \
>> diff --git a/arch/arm/boot/dts/imx6q-dms-ba16.dts b/arch/arm/boot/dts/imx6q-dms-ba16.dts
>> new file mode 100644
>> index 000000000000..055b88a6096d
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/imx6q-dms-ba16.dts
>> @@ -0,0 +1,146 @@
>> +/*
>> + * Copyright 2018 Advantech Corporation
>> + *
>> + * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>
> You should put the SPDX line as the first line and it should start with //:
>
> // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>
>> + */
>> +
>> +
>
> No need for two blank lines. One is enough.
>
>> +/dts-v1/;
>> +
> ...
>
>> +&ecspi5 {
>> +       num-cs = <1>;
>
> You can remove this property.
>
>
>> +       cs-gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_ecspi5>;
>> +       status = "okay";
>> +
>> +       m25_eeprom: m25p80@0 {
>> +               compatible = "atmel,at25";
>
> According to Documentation/devicetree/bindings/eeprom/at25.txt this
> should have the following format:
>
> compatible : Should be "<vendor>,<type>", and generic value "atmel,at25".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
