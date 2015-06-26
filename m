From: Walter Lozano <walter-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: socfpga: dts: Fix adxl34x formating
Date: Fri, 26 Jun 2015 07:36:42 -0300
Message-ID: <CABxpGwASLHuXtTp--q8iu3FDCsOXT-03VRCsgL51JfnTaZ80sQ@mail.gmail.com>
References: <1435285559-11053-1-git-send-email-walter@vanguardiasur.com.ar>
	<20150626071656.GC26041@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150626071656.GC26041-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Steffen

On Fri, Jun 26, 2015 at 4:16 AM, Steffen Trumtrar
<s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Hi Walter!
>
> On Thu, Jun 25, 2015 at 11:25:57PM -0300, Walter Lozano wrote:
>> This patch fixes the formating of DTS bindings for the adxl34x digital
>> accelerometer.
>>
>> Signed-off-by: Walter Lozano <walter-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/socfpga_cyclone5_sockit.dts |    6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>> index 71468a7..5b60692 100644
>> --- a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>> +++ b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>> @@ -73,14 +73,14 @@
>>       status = "okay";
>>  };
>>
>> -&i2c1{
>> +&i2c1 {
>>       status = "okay";
>>
>> -     accel1: accel1@53{
>> +     accel1: accelerometer@53 {
>>               compatible = "adxl34x";
>>               reg = <0x53>;
>>
>> -             interrupt-parent = < &portc >;
>> +             interrupt-parent = <&portc>;
>>               interrupts = <3 2>;
>>       };
>>  };
>
> I would personally squash 3/3 into this one, but otherwise:
>
> Whole series
>
>         Acked-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>

Thanks for your comments. I have no problem at all. Dinh?

Regards

-- 
Walter Lozano, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
