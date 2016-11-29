From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: Question regarding clocks in the DW-HDMI DT bindings
Date: Mon, 28 Nov 2016 22:27:01 -0800
Message-ID: <CAEG3pNCTH5YUjO8m-jd1rfRRKRus7c39W4rYK56c6NdfQsOcyA@mail.gmail.com>
References: <2778019.JJI4Lz6scm@avalon> <2404891.arL9itCrmb@avalon>
 <CAEG3pNDtMY+Pf1_w6vQEswaMVZ=jOC69R749jSFwB2NiU8r58Q@mail.gmail.com> <1938338.cMuGjElf2l@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1938338.cMuGjElf2l@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux-DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

[fixing Stephen's email address]

On Mon, Nov 28, 2016 at 10:04 PM, Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
> Hi Mike,
>
> On Monday 28 Nov 2016 13:56:11 Michael Turquette wrote:
>> On Fri, Nov 25, 2016 at 7:22 AM, Laurent Pinchart wrote:
>> > On Friday 25 Nov 2016 10:56:53 Andy Yan wrote:
>> >> On 2016=E5=B9=B411=E6=9C=8825=E6=97=A5 07:26, Laurent Pinchart wrote:
>> >>> On Friday 25 Nov 2016 00:16:00 Vladimir Zapolskiy wrote:
>> >>>> On 11/25/2016 12:07 AM, Fabio Estevam wrote:
>> >>>>> On Thu, Nov 24, 2016 at 7:16 PM, Laurent Pinchart wrote:
>> >>>>>> Hi Andy,
>> >>>>>>
>> >>>>>> As the author of the DW-HDMI DT bindings this question is address=
ed
>> >>>>>> to you, but information from anyone is more than welcome.
>> >>>>>>
>> >>>>>> The DT bindings specify two clocks named "iahb" and "isfr" but do=
n't
>> >>>>>> describe them. While I assume that the "isfr" clock corresponds t=
o
>> >>>>>> the "isfrclk" input signal of the DW HDMI, there is no "iahb" clo=
ck
>> >>>>>> described in the IP core datasheet.
>> >>>>>
>> >>>>> i.MX6Q has a DW-HDMI IP block.
>> >>>>>
>> >>>>> The names in the devicetree binding matches the ones listed at the
>> >>>>> i.MX6Q Reference Manual - Table 33-1. HDMI Clocks
>> >>>>
>> >>>> correct, for your convenience the table is copied below:
>> >>>>
>> >>>> Clock name |     Clock Root     | Description
>> >>>> -----------+--------------------+----------------------------------=
---
>> >>>>   iahbclk  | ahb_clk_root       | Bus clock
>> >>>>   icecclk  | ckil_sync_clk_root | CEC low-frequency clock (32kHZ)
>> >>>>   ihclk    | ahb_clk_root       | Module clock
>> >>>>   isfrclk  | video_27m_clk_root | Internal SFR clock (video clock
>> >>>>   27MHz)
>> >>>>
>> >>>> Here AHB stands for ARM Advanced High-performance Bus.
>> >>>
>> >>> That's what I suspected. I believe the "iahb" name is wrong, as the =
DW
>> >>> HDMI TX IP core clearly documents the bus clock as being called
>> >>> "iapbclk". We could rename that in the DT bindings (with compatibili=
ty
>> >>> code in the driver to keep supporting the old name) but it might not=
 be
>> >>> worth it. The bindings should however document that the "iahb" clock=
 is
>> >>> the IP core's "iapbclk" bus clock.
>> >>
>> >> I got the clock name from I.MX6Q TRM, I also checked the name again
>> >> with Rockchip IC design team now, hope to get some new information so=
on.
>> >
>> > Thank you. While at it, could you ask them which version of the DW HDM=
I IP
>> > used in the SoC ?
>> >
>> >>> Another question I have about the bus clock (CC'ing the devicetree
>> >>> mailing list as well as the clock maintainers) is whether it should =
be
>> >>> made optional. The clock is obviously mandatory from a hardware poin=
t
>> >>> of view (given that APB is a synchronous bus and thus requires a
>> >>> clock), but in some SoCs (specifically for the Renesas SoCs) that cl=
ock
>> >>> is always on and can't be controlled. We already omit bus clocks in =
DT
>> >>> for most IP cores when the clock can never be controlled (and we als=
o
>> >>> omit a bunch of other clocks that we don't even know exist), so it
>> >>> could make sense to make the clock optional. Otherwise there would b=
e
>> >>> runtime overhead trying to handle a clock that can't be controlled.
>> >>
>> >> If this is the case on Renesas SOCs, we can consider make the clock a=
s
>> >> optional. Or move all the clock operations to platform specific
>> >> code(dw_hdmi-rockchip.c/dw_hdmi-imx.c)?
>> >
>> > I'd prefer keeping the code generic, otherwise we'd end up with platfo=
rm-
>> > specific code that would perform the same operations on most platforms=
.
>> > I'll submit a patch soon to make the clock optional, we can discuss it
>> > then.
>>
>> Yes, let's keep the code generic. Absence of a "standard' clock is OK
>> and we should accept the small overhead incurred in providing a
>> solution that works for everyone. This prevents hardware-specific
>> hacks in the driver.
>>
>> Related: we really should model bus clocks whenever possible. I've
>> seen other attempts to merge functional/logic and bus clocks into a
>> single entity (e.g. a single struct clk_hw/clk_core that turns both
>> clocks on and off) and this defeats some fine-grained power management
>> scenarios that the hardware designers had in mind when creating
>> separate controls for the clocks.
>
> Sure, but that wasn't really the question :-) When the bus clock is separ=
ately
> controllable then I agree it should be modelled separately in DT. In my c=
ase
> the bus clock is always on, and I'm thus wondering whether it would be be=
tter
> to make it optional in DT to reduce the runtime overhead incurred by tryi=
ng to
> control something that can't be controlled.

I thought I answered this, but maybe not directly enough :-)

We should make the clock mandatory in DT if the physical line must be
there. This is regardless of whether a given chip/IP variant has
control over that clock; so long as the physical clock line always
exists then it is not really "optional".

In the case where there is an absence of the physical clock line, then
making it optional in DT makes sense.

As an aside, we did discuss the fact that the vast majority of clocks
are not modeled in DT, and I'm not saying that we transcribe the RTL
into DT. I'm just saying that if there is a debate over whether or not
to make a clock optional in DT, when it is always physically there,
then don't make it optional. Whether or not the control is exposed on
a particular chip is less important.

Anyways, this is more DT ridiculousness and I won't block either
method getting merged. I'm just picking my favorite color to paint the
bikeshed.

Regards,
Mike

>
>> >>>> By the way while we're discussing DW HDMI bindings specific to iMX,
>> >>>> I would recommend to remove utterly hackish and iMX only "gpr"
>> >>>> property from the example in bindings/display/bridge/dw_hdmi.txt
>
> --
> Regards,
>
> Laurent Pinchart
>



--=20
Michael Turquette
CEO
BayLibre - At the Heart of Embedded Linux
http://baylibre.com/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
