From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: Question regarding clocks in the DW-HDMI DT bindings
Date: Tue, 29 Nov 2016 11:18:03 +0200
Message-ID: <1670305.5iv2J65bic@avalon>
References: <2778019.JJI4Lz6scm@avalon> <1938338.cMuGjElf2l@avalon> <CAEG3pNCTH5YUjO8m-jd1rfRRKRus7c39W4rYK56c6NdfQsOcyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEG3pNCTH5YUjO8m-jd1rfRRKRus7c39W4rYK56c6NdfQsOcyA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux-DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mike,

On Monday 28 Nov 2016 22:27:01 Michael Turquette wrote:
> On Mon, Nov 28, 2016 at 10:04 PM, Laurent Pinchart wrote:
> > On Monday 28 Nov 2016 13:56:11 Michael Turquette wrote:
> >> On Fri, Nov 25, 2016 at 7:22 AM, Laurent Pinchart wrote:
> >>> On Friday 25 Nov 2016 10:56:53 Andy Yan wrote:
> >>>> On 2016=E5=B9=B411=E6=9C=8825=E6=97=A5 07:26, Laurent Pinchart w=
rote:
> >>>>> On Friday 25 Nov 2016 00:16:00 Vladimir Zapolskiy wrote:
> >>>>>> On 11/25/2016 12:07 AM, Fabio Estevam wrote:
> >>>>>>> On Thu, Nov 24, 2016 at 7:16 PM, Laurent Pinchart wrote:
> >>>>>>>> Hi Andy,
> >>>>>>>>=20
> >>>>>>>> As the author of the DW-HDMI DT bindings this question is
> >>>>>>>> addressed to you, but information from anyone is more than w=
elcome.
> >>>>>>>>=20
> >>>>>>>> The DT bindings specify two clocks named "iahb" and "isfr" b=
ut
> >>>>>>>> don't describe them. While I assume that the "isfr" clock
> >>>>>>>> corresponds to the "isfrclk" input signal of the DW HDMI, th=
ere is
> >>>>>>>> no "iahb" clock described in the IP core datasheet.
> >>>>>>>=20
> >>>>>>> i.MX6Q has a DW-HDMI IP block.
> >>>>>>>=20
> >>>>>>> The names in the devicetree binding matches the ones listed a=
t the
> >>>>>>> i.MX6Q Reference Manual - Table 33-1. HDMI Clocks
> >>>>>>=20
> >>>>>> correct, for your convenience the table is copied below:
> >>>>>>=20
> >>>>>> Clock name |     Clock Root     | Description
> >>>>>> -----------+--------------------+-----------------------------=
------
> >>>>>>   iahbclk  | ahb_clk_root       | Bus clock
> >>>>>>   icecclk  | ckil_sync_clk_root | CEC low-frequency clock (32k=
HZ)
> >>>>>>   ihclk    | ahb_clk_root       | Module clock
> >>>>>>   isfrclk  | video_27m_clk_root | Internal SFR clock (video cl=
ock
> >>>>>>   27MHz)
> >>>>>>=20
> >>>>>> Here AHB stands for ARM Advanced High-performance Bus.
> >>>>>=20
> >>>>> That's what I suspected. I believe the "iahb" name is wrong, as=
 the
> >>>>> DW HDMI TX IP core clearly documents the bus clock as being cal=
led
> >>>>> "iapbclk". We could rename that in the DT bindings (with
> >>>>> compatibility code in the driver to keep supporting the old nam=
e) but
> >>>>> it might not be worth it. The bindings should however document =
that
> >>>>> the "iahb" clock is the IP core's "iapbclk" bus clock.
> >>>>=20
> >>>> I got the clock name from I.MX6Q TRM, I also checked the name ag=
ain
> >>>> with Rockchip IC design team now, hope to get some new informati=
on
> >>>> soon.
> >>>=20
> >>> Thank you. While at it, could you ask them which version of the D=
W HDMI
> >>> IP used in the SoC ?
> >>>=20
> >>>>> Another question I have about the bus clock (CC'ing the devicet=
ree
> >>>>> mailing list as well as the clock maintainers) is whether it sh=
ould
> >>>>> be made optional. The clock is obviously mandatory from a hardw=
are
> >>>>> point of view (given that APB is a synchronous bus and thus req=
uires a
> >>>>> clock), but in some SoCs (specifically for the Renesas SoCs) th=
at
> >>>>> clock is always on and can't be controlled. We already omit bus=
 clocks
> >>>>> in DT for most IP cores when the clock can never be controlled =
(and we
> >>>>> also omit a bunch of other clocks that we don't even know exist=
), so
> >>>>> it could make sense to make the clock optional. Otherwise there=
 would
> >>>>> be runtime overhead trying to handle a clock that can't be cont=
rolled.
> >>>>=20
> >>>> If this is the case on Renesas SOCs, we can consider make the cl=
ock as
> >>>> optional. Or move all the clock operations to platform specific
> >>>> code(dw_hdmi-rockchip.c/dw_hdmi-imx.c)?
> >>>=20
> >>> I'd prefer keeping the code generic, otherwise we'd end up with
> >>> platform-specific code that would perform the same operations on =
most
> >>> platforms. I'll submit a patch soon to make the clock optional, w=
e can
> >>> discuss it then.
> >>=20
> >> Yes, let's keep the code generic. Absence of a "standard' clock is=
 OK
> >> and we should accept the small overhead incurred in providing a
> >> solution that works for everyone. This prevents hardware-specific
> >> hacks in the driver.
> >>=20
> >> Related: we really should model bus clocks whenever possible. I've=

> >> seen other attempts to merge functional/logic and bus clocks into =
a
> >> single entity (e.g. a single struct clk_hw/clk_core that turns bot=
h
> >> clocks on and off) and this defeats some fine-grained power manage=
ment
> >> scenarios that the hardware designers had in mind when creating
> >> separate controls for the clocks.
> >=20
> > Sure, but that wasn't really the question :-) When the bus clock is=

> > separately controllable then I agree it should be modelled separate=
ly in
> > DT. In my case the bus clock is always on, and I'm thus wondering w=
hether
> > it would be better to make it optional in DT to reduce the runtime
> > overhead incurred by trying to control something that can't be
> > controlled.
>=20
> I thought I answered this, but maybe not directly enough :-)
>=20
> We should make the clock mandatory in DT if the physical line must be=

> there. This is regardless of whether a given chip/IP variant has
> control over that clock; so long as the physical clock line always
> exists then it is not really "optional".
>=20
> In the case where there is an absence of the physical clock line, the=
n
> making it optional in DT makes sense.
>=20
> As an aside, we did discuss the fact that the vast majority of clocks=

> are not modeled in DT, and I'm not saying that we transcribe the RTL
> into DT. I'm just saying that if there is a debate over whether or no=
t
> to make a clock optional in DT, when it is always physically there,
> then don't make it optional. Whether or not the control is exposed on=

> a particular chip is less important.
>=20
> Anyways, this is more DT ridiculousness and I won't block either
> method getting merged. I'm just picking my favorite color to paint th=
e
> bikeshed.

Thanks for sharing your opinion. I'll keep the clock mandatory and spec=
ify it=20
in DT.

> >>>>>> By the way while we're discussing DW HDMI bindings specific to=
 iMX,
> >>>>>> I would recommend to remove utterly hackish and iMX only "gpr"=

> >>>>>> property from the example in bindings/display/bridge/dw_hdmi.t=
xt

--=20
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
