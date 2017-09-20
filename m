From: =?UTF-8?Q?=c5=81ukasz_Majewski?= <lukma-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 1/2] dts: display5: Device tree description of LWN's
 DISPLAY5 board
Date: Wed, 20 Sep 2017 11:22:21 +0200
Message-ID: <f203efc5-b85c-aa3d-0dc6-929ea348e5f6@denx.de>
References: <1505746765-965-1-git-send-email-lukma@denx.de>
 <CAOMZO5Du4gH1jwcP4ssRPD17GsEAVERpkNBD7W2z5f+4TAd=nA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5Du4gH1jwcP4ssRPD17GsEAVERpkNBD7W2z5f+4TAd=nA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/18/2017 06:06 PM, Fabio Estevam wrote:
> Hi Lukasz,
> 
> On Mon, Sep 18, 2017 at 11:59 AM, Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org> wrote:
> 
>> diff --git a/arch/arm/boot/dts/imx6q-display5-mitsubishi-aa070-800x480.dts b/arch/arm/boot/dts/imx6q-display5-mitsubishi-aa070-800x480.dts
>> new file mode 100644
>> index 0000000..0160ecf
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/imx6q-display5-mitsubishi-aa070-800x480.dts
>> @@ -0,0 +1,24 @@
>> +/*
>> + * Copyright 2017
>> + * Lukasz Majewski, DENX Software Engineering, lukma-ynQEQJNshbs@public.gmane.org
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
> 
> Have you considered using a dual GPL/X11 license? Same apply to the
> other new dts/dtsi files.

Ok. I will provide dual license in v2.

> 
>> +/dts-v1/;
>> +
>> +#include "imx6q-display5.dtsi"
>> +
>> +&panel {
>> +       compatible = "mitsubishi,aa070mc01-ca1";
> 
> I don't see this binding accepted in mainline, so it would be better
> to resend it after it reaches mainline.

I did not yet received any reply for this patch.

> 
>> +&ssi2 {
>> +       fsl,mode = "i2s-master";
> 
> Please remove this property. simple-audio-card already specifies who is master.

Ok.

> 
>> +       pinctrl_ecspi2_cs: ecspi2csgrp {
>> +               fsl,pins = <
>> +                       MX6QDL_PAD_CSI0_DAT11__GPIO5_IO29 0x80000000
> 
> Please do not use 0x80000000. Use the real IOMUX value instead.

Could you be more specific here?

The 0x80000000 corresponds to IMX_NO_PAD_CTL in pinctrl-imx.c, which 
prevents from manual GPIO control.

The 0x80000000 value is the IOMUXC_SW_PAD_CTL_PAD_CSI0_DATA11 
(0x020E_0654) config data (16 bits only -> 0x0).

Writing 0x0 to this register is perfectly fine for my application.


I'm a bit in doubt to what I shall do more?

> 
>> +               >;
>> +       };
>> +
>> +       pinctrl_ecspi2_flwp: ecspi2flwpgrp {
>> +               fsl,pins = <
>> +                       MX6QDL_PAD_SD3_DAT5__GPIO7_IO00 0x80000000
> 
> Ditto.
> 
>> +               >;
>> +       };
>> +
>> +       pinctrl_ecspi3: ecspi3grp {
>> +               fsl,pins = <
>> +                       MX6QDL_PAD_DISP0_DAT2__ECSPI3_MISO      0x100b1
>> +                       MX6QDL_PAD_DISP0_DAT1__ECSPI3_MOSI      0x100b1
>> +                       MX6QDL_PAD_DISP0_DAT0__ECSPI3_SCLK      0x100b1
>> +               >;
>> +       };
>> +
>> +       pinctrl_ecspi3_cs: ecspi3csgrp {
>> +               fsl,pins = <
>> +                       MX6QDL_PAD_DISP0_DAT3__GPIO4_IO24 0x80000000
> 
> Ditto.
> 
>> +               >;
>> +       };
>> +
>> +       pinctrl_ecspi3_flwp: ecspi3flwpgrp {
>> +               fsl,pins = <
>> +                       MX6QDL_PAD_DISP0_DAT6__GPIO4_IO27 0x80000000
> 
> Ditto.
> 


-- 
Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
