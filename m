From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: dts: hummingboard: gpio-ir on gpio 3,5
Date: Sat, 23 Aug 2014 10:56:37 -0300
Message-ID: <CAOMZO5DrtrEJxmCZSO6RVZom8kzZhu2dikntRwYZeq5j_QZ9sw@mail.gmail.com>
References: <20140823091058.GO30401@n2100.arm.linux.org.uk>
	<E1XL7MR-0002yX-6N@rmk-PC.arm.linux.org.uk>
	<CAOMZO5C=xyYLLBX1PDsJQ9NwzXZxCWTvPMTUWzYcoohOOvA_qA@mail.gmail.com>
	<20140823133649.GP30401@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140823133649.GP30401-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 23, 2014 at 10:36 AM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Sat, Aug 23, 2014 at 10:32:23AM -0300, Fabio Estevam wrote:
>> On Sat, Aug 23, 2014 at 6:11 AM, Russell King
>> <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
>>
>> > -                               MX6QDL_PAD_GPIO_2__GPIO1_IO02 0x80000000
>> > +                               MX6QDL_PAD_EIM_DA5__GPIO3_IO05 0x80000000
>>
>> It would be better to replace the '0x80000000' with the real iomux
>> value (like 0x1b0b0 for example), so that we do not need to rely on
>> the bootloader doing the correct configuration for us.
>
> I'd just end up choosing something which appears to work - I've no idea
> at present what an appropriate value should be here.

In the working system, you could read the register:

IOMUXC_SW_PAD_CTL_PAD_EIM_AD05 (address: 0x20E043C)

Most likely it will return the default value of 0xb0b1 if the
bootloader has not re-configured it.

,and then put this read value into the device tree. This way we
guarantee that the kernel will have this pin correctly configured,
without depending on the bootloader.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
