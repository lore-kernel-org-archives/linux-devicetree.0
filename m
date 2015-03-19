From: Walter Lozano <walter-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: socfpga: dts: Add adxl34x
Date: Thu, 19 Mar 2015 18:27:21 -0300
Message-ID: <CABxpGwAFdLET+fg3WvMWqXdzsPQHv3hKx9cFwk9RQE9w6+rEbg@mail.gmail.com>
References: <1419462712-14151-1-git-send-email-walter@vanguardiasur.com.ar>
	<20150105092153.GJ13070@pengutronix.de>
	<CABxpGwCbFF+pJ0H_sMjqk6c9awdRuxi6j0CL_d3mH5z4Qht+ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABxpGwCbFF+pJ0H_sMjqk6c9awdRuxi6j0CL_d3mH5z4Qht+ng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Dinh,

On Mon, Mar 16, 2015 at 10:10 AM, Walter Lozano
<walter-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
> On Mon, Jan 5, 2015 at 6:21 AM, Steffen Trumtrar
> <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> Hi!
>>
>> On Wed, Dec 24, 2014 at 08:11:52PM -0300, Walter Lozano wrote:
>>> This patch adds the DTS bindings for the adxl34x digital
>>> accelerometer.
>>>
>>> Signed-off-by: Walter Lozano <walter-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/socfpga_cyclone5_sockit.dts |   16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>>> index 16ea6f5..d343e03 100644
>>> --- a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>>> +++ b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
>>> @@ -60,6 +60,22 @@
>>>       rxc-skew-ps = <2000>;
>>>  };
>>>
>>> +&gpio2 {
>>> +     status = "okay";
>>> +};
>>> +
>>> +&i2c1 {
>>> +     status = "okay";
>>> +
>>> +     accel1: accelerometer@53 {
>>> +             compatible = "adxl34x";
>>> +             reg = <0x53>;
>>> +
>>> +             interrupt-parent = <&portc>;
>>> +             interrupts = <3 2>;
>>> +     };
>>> +};
>>> +
>>>  &mmc0 {
>>>       vmmc-supply = <&regulator_3_3v>;
>>>       vqmmc-supply = <&regulator_3_3v>;
>>
>> I just gave it a short spin. I get some interrupts and the position property
>> changes, so it seems to work:
>>
>>         Acked-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>
>
> Ping?
> How should this continue?

Any news about this patch? It has been acked by Pavel Machek and
Steffen Trumtrar a while ago.

Regards,

-- 
Walter Lozano, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
