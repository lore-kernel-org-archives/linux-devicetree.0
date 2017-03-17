From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/5] rtc: Add rtc-sh
Date: Fri, 17 Mar 2017 14:55:48 +0100
Message-ID: <CAMuHMdWs3NtKLiBnKCmxGYNBW3zzWYydj=JGKr+mH7ao97L2_Q@mail.gmail.com>
References: <20170316175112.27913-1-chris.brandt@renesas.com>
 <20170316175112.27913-3-chris.brandt@renesas.com> <CAMuHMdVu0dQjptyW0F5YS+V6sixXTM3P6VWq2=8BQ5njUOXf-Q@mail.gmail.com>
 <SG2PR06MB1165A9931C930DF9BCD5C0A98A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdW0nHiZkE_RxVLX3G0MuwQLPHVFyNq5C1tx0yAqDQefaA@mail.gmail.com> <SG2PR06MB11653BB788CADBEE78FE4CF58A390@SG2PR06MB1165.apcprd06.prod.outlook.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCQJP74GSUDRBPGWV7DAKGQE7ZT3XQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: geert.uytterhoeven-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
In-Reply-To: <SG2PR06MB11653BB788CADBEE78FE4CF58A390-ESzmfEwOt/xoAsOJh7vwSm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, RTCLINUX <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Fri, Mar 17, 2017 at 2:41 PM, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> On Friday, March 17, 2017, Geert Uytterhoeven wrote:
>> > On Friday, March 17, 2017, Geert Uytterhoeven wrote:
>> >> On Thu, Mar 16, 2017 at 6:51 PM, Chris Brandt
>> >> <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>> >> wrote:
>> >> > +- clocks: the clock source for the RTC controller.
>> >>
>> >> The datasheet mentions 3 possible clock sources?
>> >
>> > There is the clock source that does the counting (RTC_X1, RTC_X3, XTAL),
>> and then a clock source that runs the register interface (run off of the
>> p0 clock). So I just need to turn on the p0 clock so I can get at the
>> registers. Note that if you do a hard reset with a RESET button, and all
>> the registers in the chip go back to their POR state, the counter still
>> counts off of the 32KHz XTAL even though the "peripheral clock" is stopped
>> (which just means you can't get to the registers).
>> >
>> > In reality, you have to assume the RTC counting source has already been
>> set up by u-boot, or from a past reboot, so I don't do any of that select
>> configuration at all.
>>
>> it would still be good to have phandles to the external clock sources as
>> well, as that describes the hardware topology.
>
> I'm confused, you mean make new clocks node for RTC_X1 (fixed at 32.768kHZ) and
> RTC_X3 (fixed at 4MHz), but then not really do anything with then? (the driver

You still do something with them, as they'll be linked from the rtc device node.

> doesn't need them)

The driver may use them in the future.
E.g. to select among X1, X3, or EXTAL, depending on availability.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
