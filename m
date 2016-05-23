From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx6q: add support for the Utilite Pro
Date: Tue, 24 May 2016 01:08:00 +0200
Message-ID: <644530ff6bb04b5898dc33604dc7a93a@rwthex-s1-b.rwth-ad.de>
References: <1463957258-4893-1-git-send-email-christopher.spinrath@rwth-aachen.de>
 <c4ab0387041f42ada68296141befe332@rwthex-s1-b.rwth-ad.de>
 <20abc2f6769b4369ba87ec27274a090e@rwthex-s2-a.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20abc2f6769b4369ba87ec27274a090e-gtPewvpZjL+1MzRH+ruthl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Spinrath, Christopher" <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On 05/23/2016 07:49 PM, Fabio Estevam wrote:
> On Sun, May 22, 2016 at 7:47 PM,  <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:
> 
>> diff --git a/arch/arm/boot/dts/imx6q-utilite-pro.dts b/arch/arm/boot/dts/imx6q-utilite-pro.dts
>> new file mode 100644
>> index 0000000..bcd8e0d
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/imx6q-utilite-pro.dts
>> @@ -0,0 +1,128 @@
>> +/*
>> + * Copyright 2016 Christopher Spinrath
>> + * Copyright 2013 CompuLab Ltd.
>> + *
>> + * Based on the GPLv2 licensed devicetree distributed with the vendor
>> + * kernel for the Utilite Pro:
>> + *     Copyright 2013 CompuLab Ltd.
>> + *     Author: Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
>> + *
>> + * The code contained herein is licensed under the GNU General Public
>> + * License. You may obtain a copy of the GNU General Public License
>> + * Version 2 or later at the following locations:
> 
> Can you make this dual GPL/X11 license?
> 
> For reference take a look at:
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/imx6sl-warp.dts?id=refs/tags/v4.6
> 
I would like to but I'm not sure if I'm allowed to. As I stated in the
license header some nodes are copied (and cleaned up) from the vendor
kernel/devicetree. They are licensed GPL-v2 only. So I don't know, can I
add the X11 license?

> 
>> +       gpio-keys {
>> +               compatible = "gpio-keys";
>> +               power {
>> +                       label = "Power Button";
>> +                       gpios = <&gpio1 29 1>;
> 
> Better to use a label like:
> gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
> 
>> +&iomuxc {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_hog>;
>> +
>> +       hog {
>> +               pinctrl_hog: hoggrp {
>> +                       fsl,pins = <
>> +                               /* power button */
>> +                               MX6QDL_PAD_ENET_TXD1__GPIO1_IO29 0x80000000
> 
> Better to avoid 0x80000000. Replace it with the real iomux value
> instead so that you don't need to rely on the bootloader
> configuration.
hmm, I don't know how to determine this value. The device documentation
I have does not say anything about it and the vendor kernel uses
0x80000000...

> 
>> +
>> +       imx6q-utilite-pro {
>> +               pinctrl_i2c1: i2c1grp {
>> +                       fsl,pins = <
>> +                               MX6QDL_PAD_EIM_D21__I2C1_SCL 0x4001b8b1
>> +                               MX6QDL_PAD_EIM_D28__I2C1_SDA 0x4001b8b1
>> +                       >;
>> +               };
> 
> You should better remove one level of indentation. Check this commit
> for reference:
> https://git.kernel.org/cgit/linux/kernel/git/shawnguo/linux.git/commit/arch/arm/boot/dts/imx6q-tbs2910.dts?h=for-next&id=aa7871b53bc3c36b4adefe67f728143e2deeec93
> 
OK, done (I also had to change this in the imx6q-cm-fx6.dts to make it
work).

>> +&uart2 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_uart2>;
>> +       fsl,uart-has-rtscts;
>> +       dma-names = "rx", "tx";
>> +       dmas = <&sdma 27 4 0>, <&sdma 28 4 0>;
> 
> No need to add the dma nodes as they are already present in imx6qdl.dtsi.
> 
Indeed, I removed them.


Thanks for your review!

Cheers,
Christopher
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
