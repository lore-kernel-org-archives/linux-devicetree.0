From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCHv3 1/2] ARM: dts: socfpga: Fix SD card detect
Date: Wed, 22 Oct 2014 10:47:10 -0500
Message-ID: <5447D17E.7040802@opensource.altera.com>
References: <1413908111-28165-1-git-send-email-dinguyen@opensource.altera.com>	<1413908111-28165-2-git-send-email-dinguyen@opensource.altera.com>	<20141021171033.GK10262@pengutronix.de>	<5446AA87.8070307@opensource.altera.com> <CAD=FV=VP=8XPwWjGnVhS1SibMhsuuqbZOBdRT_GE5JKAL_xbuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=VP=8XPwWjGnVhS1SibMhsuuqbZOBdRT_GE5JKAL_xbuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 10/22/14, 10:45 AM, Doug Anderson wrote:
> Dinh,
> 
> (without the HTML mail this time, sorry)
> 
> On Tue, Oct 21, 2014 at 11:48 AM, Dinh Nguyen
> <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
>> On 10/21/2014 12:10 PM, Steffen Trumtrar wrote:
>>> Hi!
>>>
>>> On Tue, Oct 21, 2014 at 11:15:10AM -0500, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
>>>> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>>>
>>>> Without this patch, the booting the SOCFPGA platform would hang at the
>>>> SDMMC driver loading. The issue, debugged by Doug Anderson, turned out
>>>> to be that the GPIO bank used by the SD card-detect was not set to
>>>> status="okay".
>>>>
>>>> Suggested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>> Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>>> ---
>>>> v3: Correctly degugged the issue to be a gpio node not having status="okay"
>>>> ---
>>>>  arch/arm/boot/dts/socfpga_cyclone5_socdk.dts | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
>>>> index d7296a5..03a3745 100644
>>>> --- a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
>>>> +++ b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
>>>> @@ -37,6 +37,12 @@
>>>>               */
>>>>              ethernet0 = &gmac1;
>>>>      };
>>>> +
>>>> +    soc {
>>>> +            gpio@ff709000 {
>>>> +                    status = "okay";
>>>> +            };
>>>> +    };
> 
> I haven't dug into the details you provided about the GPIO
> infrastructure of socfpga, but it does seem like it might be nice to
> some easier way to reference things in
> "arch/arm/boot/dts/socfpga.dtsi".
> 
> Looking at other examples they call the "gpio@ff708000" "gpio0" and
> the sub node something like "porta".  Given that this is the only
> reference to the GPIO, it seems like now would be the time to change
> it.

Yeah...I like your idea. Let met get a new patch for that...

Thanks,
Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
