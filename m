From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2] ARM: zynq: Add #io-channel-cells to (x)adc node for
 iio-hwmon
Date: Thu, 16 Mar 2017 17:51:30 +0100
Message-ID: <37f29986-6491-67ab-144c-eb485cc1fdcc@metafoo.de>
References: <1489003884-2489-1-git-send-email-mdf@kernel.org>
 <e6da3f38-7039-66e5-5b9d-a44ff42aa9c9@xilinx.com>
 <CAJYdmeNc48=OOvRiUjqPBJhz9RCbzeaRGu1Tfm=hrvzkJrSsag@mail.gmail.com>
 <7e4fbe16-8686-5399-748d-af222c630338@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7e4fbe16-8686-5399-748d-af222c630338-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Moritz Fischer <moritz.fischer.private-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Julia Cartwright <julia-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/16/2017 05:45 PM, Michal Simek wrote:
> On 16.3.2017 17:39, Moritz Fischer wrote:
>> On Thu, Mar 16, 2017 at 9:16 AM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>>> Hi,
>>>
>>> On 8.3.2017 21:11, Moritz Fischer wrote:
>>>> Fix
>>>>
>>>> OF: /iio_hwmon: could not get #io-channel-cells for
>>>> /amba/adc@f8007100
>>>> OF: /iio_hwmon: could not get #io-channel-cells for
>>>> /amba/adc@f8007100
>>>> OF: /iio_hwmon: could not get #io-channel-cells for
>>>> /amba/adc@f8007100
>>>>
>>>> by adding the #io-channel-cells property.
>>>>
>>>> Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>> Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>> Cc: Sören Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>> Cc: Julia Cartwright <julia-acOepvfBmUk@public.gmane.org>
>>>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>> ---
>>>>
>>>> Changes from v1:
>>>> - fix messed up commit message
>>>> ---
>>>>  arch/arm/boot/dts/zynq-7000.dtsi | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
>>>> index f3ac9bf..98233a8 100644
>>>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
>>>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
>>>> @@ -72,6 +72,7 @@
>>>>                       interrupts = <0 7 4>;
>>>>                       interrupt-parent = <&intc>;
>>>>                       clocks = <&clkc 12>;
>>>> +                     #io-channel-cells = <1>;
>>>>               };
>>>>
>>>>               can0: can@e0008000 {
>>>>
>>>
>>> I think it will be good to the next step too.
>>> It means also add iio-hwmon node too.
>>>
>>> What do you think?
>>
>> I hadn't put it in there since dts is supposed to describe hw,
>> but obviously putting the actual hwmon in there makes it more useful.
> 
> I had one discussion about this with Grant in past and it is common
> mistake. It is simplification of purpose of dts.
> 

If the iio-hwmon binding had gone through review it would have been rejected.

>>
>> I can resubmit with the hwmon node in there.
> 
> If you grep kernel tree you will see that others are using it too.
> Also there is accepted binding for that that's why I can't see big
> problem with it.

Since this is an application specific binding I wouldn't put it in the
generic DT include file. It's a bit like adding a gpio-key binding for each
of the GPIOs just in case somebody wants to use it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
