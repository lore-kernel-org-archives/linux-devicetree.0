From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: Question regarding clocks in the DW-HDMI DT bindings
Date: Tue, 29 Nov 2016 08:04:51 +0200
Message-ID: <1938338.cMuGjElf2l@avalon>
References: <2778019.JJI4Lz6scm@avalon> <2404891.arL9itCrmb@avalon> <CAEG3pNDtMY+Pf1_w6vQEswaMVZ=jOC69R749jSFwB2NiU8r58Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEG3pNDtMY+Pf1_w6vQEswaMVZ=jOC69R749jSFwB2NiU8r58Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux-DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Boyd <sboyd-cGfAhawkTDLHbOjZJNBcug@public.gmane.org>, nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mike,

On Monday 28 Nov 2016 13:56:11 Michael Turquette wrote:
> On Fri, Nov 25, 2016 at 7:22 AM, Laurent Pinchart wrote:
> > On Friday 25 Nov 2016 10:56:53 Andy Yan wrote:
> >> On 2016=E5=B9=B411=E6=9C=8825=E6=97=A5 07:26, Laurent Pinchart wro=
te:
> >>> On Friday 25 Nov 2016 00:16:00 Vladimir Zapolskiy wrote:
> >>>> On 11/25/2016 12:07 AM, Fabio Estevam wrote:
> >>>>> On Thu, Nov 24, 2016 at 7:16 PM, Laurent Pinchart wrote:
> >>>>>> Hi Andy,
> >>>>>>=20
> >>>>>> As the author of the DW-HDMI DT bindings this question is addr=
essed
> >>>>>> to you, but information from anyone is more than welcome.
> >>>>>>=20
> >>>>>> The DT bindings specify two clocks named "iahb" and "isfr" but=
 don't
> >>>>>> describe them. While I assume that the "isfr" clock correspond=
s to
> >>>>>> the "isfrclk" input signal of the DW HDMI, there is no "iahb" =
clock
> >>>>>> described in the IP core datasheet.
> >>>>>=20
> >>>>> i.MX6Q has a DW-HDMI IP block.
> >>>>>=20
> >>>>> The names in the devicetree binding matches the ones listed at =
the
> >>>>> i.MX6Q Reference Manual - Table 33-1. HDMI Clocks
> >>>>=20
> >>>> correct, for your convenience the table is copied below:
> >>>>=20
> >>>> Clock name |     Clock Root     | Description
> >>>> -----------+--------------------+-------------------------------=
------
> >>>>   iahbclk  | ahb_clk_root       | Bus clock
> >>>>   icecclk  | ckil_sync_clk_root | CEC low-frequency clock (32kHZ=
)
> >>>>   ihclk    | ahb_clk_root       | Module clock
> >>>>   isfrclk  | video_27m_clk_root | Internal SFR clock (video cloc=
k
> >>>>   27MHz)
> >>>>=20
> >>>> Here AHB stands for ARM Advanced High-performance Bus.
> >>>=20
> >>> That's what I suspected. I believe the "iahb" name is wrong, as t=
he DW
> >>> HDMI TX IP core clearly documents the bus clock as being called
> >>> "iapbclk". We could rename that in the DT bindings (with compatib=
ility
> >>> code in the driver to keep supporting the old name) but it might =
not be
> >>> worth it. The bindings should however document that the "iahb" cl=
ock is
> >>> the IP core's "iapbclk" bus clock.
> >>=20
> >> I got the clock name from I.MX6Q TRM, I also checked the name agai=
n
> >> with Rockchip IC design team now, hope to get some new information=
 soon.
> >=20
> > Thank you. While at it, could you ask them which version of the DW =
HDMI IP
> > used in the SoC ?
> >=20
> >>> Another question I have about the bus clock (CC'ing the devicetre=
e
> >>> mailing list as well as the clock maintainers) is whether it shou=
ld be
> >>> made optional. The clock is obviously mandatory from a hardware p=
oint
> >>> of view (given that APB is a synchronous bus and thus requires a
> >>> clock), but in some SoCs (specifically for the Renesas SoCs) that=
 clock
> >>> is always on and can't be controlled. We already omit bus clocks =
in DT
> >>> for most IP cores when the clock can never be controlled (and we =
also
> >>> omit a bunch of other clocks that we don't even know exist), so i=
t
> >>> could make sense to make the clock optional. Otherwise there woul=
d be
> >>> runtime overhead trying to handle a clock that can't be controlle=
d.
> >>=20
> >> If this is the case on Renesas SOCs, we can consider make the cloc=
k as
> >> optional. Or move all the clock operations to platform specific
> >> code(dw_hdmi-rockchip.c/dw_hdmi-imx.c)?
> >=20
> > I'd prefer keeping the code generic, otherwise we'd end up with pla=
tform-
> > specific code that would perform the same operations on most platfo=
rms.
> > I'll submit a patch soon to make the clock optional, we can discuss=
 it
> > then.
>
> Yes, let's keep the code generic. Absence of a "standard' clock is OK=

> and we should accept the small overhead incurred in providing a
> solution that works for everyone. This prevents hardware-specific
> hacks in the driver.
>=20
> Related: we really should model bus clocks whenever possible. I've
> seen other attempts to merge functional/logic and bus clocks into a
> single entity (e.g. a single struct clk_hw/clk_core that turns both
> clocks on and off) and this defeats some fine-grained power managemen=
t
> scenarios that the hardware designers had in mind when creating
> separate controls for the clocks.

Sure, but that wasn't really the question :-) When the bus clock is sep=
arately=20
controllable then I agree it should be modelled separately in DT. In my=
 case=20
the bus clock is always on, and I'm thus wondering whether it would be =
better=20
to make it optional in DT to reduce the runtime overhead incurred by tr=
ying to=20
control something that can't be controlled.

> >>>> By the way while we're discussing DW HDMI bindings specific to i=
MX,
> >>>> I would recommend to remove utterly hackish and iMX only "gpr"
> >>>> property from the example in bindings/display/bridge/dw_hdmi.txt=


--=20
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
