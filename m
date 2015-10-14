From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] arm: dts: lpc32xx: fix improper usage of ranges property
Date: Wed, 14 Oct 2015 23:15:09 +0200
Message-ID: <CAGhQ9Vw2-4QWsWoZrLFBfL49eQnc0VtWpfZoZjfoD=MDW2kD_g@mail.gmail.com>
References: <1444694045-22000-1-git-send-email-vz@mleia.com>
	<7163229.YtgKU9kxxJ@wuerfel>
	<CAGhQ9VzKrsAYy=xwEZPD80jaTxmqR5MJj7fXeFTK-A2JnJXPqA@mail.gmail.com>
	<19392174.3eZzHlAnnT@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19392174.3eZzHlAnnT@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 14 October 2015 at 22:07, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 14 October 2015 19:23:09 Joachim Eastwood wrote:
>> >
>> > /ahb5 {
>> >         ranges = <0 0x20000000 0x10000000>;
>> >
>> >         apb {
>> >                 ranges = <0 0x80000 0x20000>;
>> >         };
>> > };
>> > /ahb6 {
>> >         ranges = <0 0x30000000 0x10000000>,           /* AHB registers */
>> >                  <0x80000000 0x80000000 0x40000000>, /* EMC DYCS0/1 */
>> >                  <0xE0000000 0xE0000000 0x04000000>; /* EMC CS0-3 */
>> >
>> >         memory-controller@1080000 {
>> >                 reg = <0x1080000 0x10000>;
>> >         };
>> > };
>>
>> Sorry for hijacking the thread, but I have related question to this.
>>
>> What is the advantage of using a hierarchical bus structure in dt?
>> I thought the recommendation, at least for new device trees, was to
>> keep it flat under a "soc"-node.
>>
>> If doesn't offer any advantages why not remove instead of adding the
>> ranges property which seems to grow a bit complex now?
>> Of course removing it would create a lot of churn because of the
>> re-indentation but at least the end result would be simpler.
>
> The general recommendation is to have the DT structure resemble
> the hardware as closely as possible. If the chip has a clear
> hierarchy and you know it, then it's best to describe it that way.
>
> The reason for having a single 'soc' node in a lot of the modern
> dtsi files is that either it's not documented, or they use AXI
> 'buses' that are not really hierarchical but are point-to-point
> connections.

Thanks for explaining, Arnd!

In that case lpc18xx.dtsi should have had a hierarchical structure as
well. NXP LPC user manuals usually documents the bus structure.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
