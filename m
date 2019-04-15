From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 0/3] Add basic support for RTC on Allwinner
 H6 SoC
Date: Mon, 15 Apr 2019 22:35:47 +0800
Message-ID: <CAGb2v67XBGhoJWho16A3+2axBuTsY+SkYkg1hwQJ0XyPvPeoOw@mail.gmail.com>
References: <20190412120730.473-1-megous@megous.com> <CAGb2v66cbpsoHJoiFJkBwhZ5SbO+uO+Kf6gtnA3kPFQZq0329Q@mail.gmail.com>
 <20190415142222.cytlvz7z3mjf7slm@core.my.home>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBVFN2LSQKGQESEIOFEA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190415142222.cytlvz7z3mjf7slm-9v8tmBix7cb9zxVx7UNMDg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 15, 2019 at 10:22 PM 'Ond=C5=99ej Jirman' via linux-sunxi
<linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org> wrote:
>
> Hi ChenYu,
>
> On Mon, Apr 15, 2019 at 04:18:12PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Apr 12, 2019 at 8:07 PM megous via linux-sunxi
> > <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org> wrote:
> > >
> > > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > >
> > > I went through the datasheets for H6 and H5, and compared the differe=
nces.
> > > RTCs are largely similar, but not entirely compatible. Incompatibilit=
ies
> > > are in details not yet implemented by the rtc driver though.
> > >
> > > I also corrected the clock tree in H6 DTSI.
> >
> > Please also add DCXO clock input/output and XO clock input to the bindi=
ngs
> > and DT, and also fix up the clock tree. You can skip them in the driver=
 for
> > now, but please add a TODO. As long as you don't change the clock-outpu=
t-name
> > of osc24M, everything should work as before.
>
> That's a bit confusing. There's no clock-output-name for osc24M, nor for =
input
> clock used in the dt-bindings or the driver. Perhaps you meant osc32k? Ma=
ybe
> I'm misunderstanding something?

I meant the clock-output-names in the device node of the external 24M cryst=
al.

> If you look at the datasheet page 349, it looks like RTC provides "hosc"
> clock (to plls and the system) either from XO or DCXO oscillators.
> The default selection depends on the voltage level on external PAD.
>
> So based on what you wrote, I suggest these actual changes/names:
>
> 1) Add DT docs for HOSC clock provided at index 3:
>
>   - 3: HOSC, 24MHz clock that clocks the PLLs and most of the SoC (H6 onl=
y)

Correct.

> 2) Add bindings description for "osc24M-dc", "osc24M-m" input clocks in
>    addition to existing support for "osc32k". Name "osc24M-m" is based on
>    X24MIN/MOUT pins and datasheet's "clk_24mxo" name.
>
> 3) The RTC driver would now just registers a fixed HOSC clock with a name
>    gathered from the clock-output-names index 3 (if enabled by the new
>    export_hosc flag - only enabled on H6).

You don't need to do this part yet. Since the CCU drivers are hard-wired
(suprise) to use the global clock name "osc24M" as hosc source. The DT
references are only for show ATM, so it doesn't matter if you implement
the clocks in the RTC driver.

However we want the DT to be correct, so that when we do get around to
doing it, we won't have to update the DT again.

It's up to you though. If you want to implement basic support, that's
fine by me. However you won't be able to test it without hacking the
CCU driver.

After describing this, it seems that when we get to doing the clk parent
rework, we'll be in a bad situation if we don't get rtc changes in before
the CCU changes.

>    The driver would ignore the "osc24M-dc", "osc24M-m" input clocks. Or p=
erhaps
>    it could just support a case where only one of these are used and make=
 it the
>    only parent of the HOSC clock?

They should just be DCXO and XO, based on the diagram. The names are local
to the RTC, so they don't need to be globally unique. Whatever matches the
datasheet is best.

>    HOSC default source selection is done based on external PAD setup, and
>    there's no need for runtime access/selection of HOSC source at the mom=
ent.

Is it even possible to change it?

> 4) In the future the RTC driver would be extended to support more refined
>    setup/muxing/runtime selection of osc24M-dc/osc24M-m. PRCM driver woul=
d
>    provide the osc24M-m clock, to be able for kernel to know how to gate =
it.
>
> The board's DTSI would have to link either "osc24M-dc", "osc24M-m" to nod=
es
> describing an external crystal (or to PRCM clock in the future). It's a b=
oards
> choice  on what crystals are actually used. 3 configs are possible - with=
 one or
> two crystals, connected to either one of XIN/XOUT X24MIN/X24MOUT pins or =
both.

AFAIK, osc24M-dc would link directly to the external crystal, while osc24M-=
m
would link to the external crystal first, then PRCM if it gets implemented.

> Would that work?
>
> DT would still probably need a re-work in the future, if the PRCM clock
> modeling the gate would be needed.

Yeah. We'll deal with that when we get to it.


To summarize, the goal is to get the DT right the first time.

Regards
ChenYu


> regards,
>   o.
>
> > We just want the DT to describe what is actually there. For the XO inpu=
t,
> > you could just directly reference the external crystal node. The gate f=
or
> > it is likely somewhere in the PRCM block, which we don't have docs for.
> >
> > > There's a small detail here, that's not described absolutely correctl=
y in
> > > DTSI, but the difference is not really that material. ext_osc32k is
> > > originally modelled as a fixed clock that feeds into RTC module, but =
in
> > > reality it's the RTC module that implements via its registers enablin=
g and
> > > disabling of this oscillator/clock.
> > >
> > > Though:
> > > - there's no other possible user of ext_osc32k than RTC module
> > > - there's no other possible external configuration for the crystal
> > >   circuit that would need to be handled in the dts per board
> > >
> > > So I guess, while the description is not perfect, this patch series s=
till
> > > improves the current situation. Or maybe I'm misunderstanding somethi=
ng,
> > > and &ext_osc32k node just describes a fact that there's a crystal on
> > > the board. Then, everything is perhaps fine. :)
> >
> > Correct. The external clock nodes are modeling the crystal, not the int=
ernal
> > clock gate / distributor.
> >
> > Were the vendor to not include the crystal (for whatever reasons), the =
DT
> > should be able to describe it via the absence of the clock input, and t=
he
> > driver should correctly use the internal (inaccurate) oscillator. I rea=
lize
> > the clocks property is required, and the driver doesn't handle this cas=
e
> > either, so we might have to fix that if it were to appear in the wild.
> >
> > > For now, the enable bit for this oscillator is toggled by the re-pare=
nting
> > > code automatically, as needed.
> >
> > That's fine. No need to increase the clock tree depth.
> >
> > ChenYu
> >
> > > This patchset is necessary for implementing the WiFi/Bluetooth suppor=
t
> > > on boards using H6 SoC.
> > >
> > > Please take a look.
> > >
> > > Thank you and regards,
> > >   Ondrej Jirman
> > >
> > > Ondrej Jirman (3):
> > >   dt-bindings: Add compatible for H6 RTC
> > >   rtc: sun6i: Add support for H6 RTC
> > >   arm64: dts: sun50i-h6: Add support for RTC and fix the clock tree
> > >
> > >  .../devicetree/bindings/rtc/sun6i-rtc.txt     |  1 +
> > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 30 +++++++-------
> > >  drivers/rtc/rtc-sun6i.c                       | 40 +++++++++++++++++=
+-
> > >  3 files changed, 55 insertions(+), 16 deletions(-)
> > >
> > > --
> > > 2.21.0
> > >
> > > --
> > > You received this message because you are subscribed to the Google Gr=
oups "linux-sunxi" group.
> > > To unsubscribe from this group and stop receiving emails from it, sen=
d an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> > > For more options, visit https://groups.google.com/d/optout.
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
