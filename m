From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/4] clk: dt: Introduce always-on clock domain
 documentation
Date: Thu, 19 Feb 2015 10:05:47 +0000
Message-ID: <20150219100547.GC12212@x1>
References: <1424276101-30137-1-git-send-email-lee.jones@linaro.org>
 <1424276101-30137-5-git-send-email-lee.jones@linaro.org>
 <CAL_Jsq+r1BKt5B9FNPG+Y0Oi1-3RGNmRUDbpX_uDJwr45bxMXA@mail.gmail.com>
 <20150218171230.GA30676@x1>
 <CAL_JsqJ0sfQ-OQvYjL3X3ebH4p9HkN4iy35iT7i9S2d+yz9zYg@mail.gmail.com>
 <20150218215435.GA32415@x1>
 <CAL_JsqKVGhopYsv_bxaiBo3f=K7GbGK2j8_dPxqA5uvUcpcnqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKVGhopYsv_bxaiBo3f=K7GbGK2j8_dPxqA5uvUcpcnqQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, kernel@stlinux.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 18 Feb 2015, Rob Herring wrote:
> On Wed, Feb 18, 2015 at 3:54 PM, Lee Jones <lee.jones@linaro.org> wro=
te:
> > On Wed, 18 Feb 2015, Rob Herring wrote:
> >
> >> On Wed, Feb 18, 2015 at 11:12 AM, Lee Jones <lee.jones@linaro.org>=
 wrote:
> >> > On Wed, 18 Feb 2015, Rob Herring wrote:
> >> >
> >> >> On Wed, Feb 18, 2015 at 10:15 AM, Lee Jones <lee.jones@linaro.o=
rg> wrote:
> >> >> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >> >> > ---
> >> >> >  .../devicetree/bindings/clock/clk-domain.txt       | 35 ++++=
++++++++++++++++++
> >> >> >  1 file changed, 35 insertions(+)
> >> >> >  create mode 100644 Documentation/devicetree/bindings/clock/c=
lk-domain.txt
> >> >> >
> >> >> > diff --git a/Documentation/devicetree/bindings/clock/clk-doma=
in.txt b/Documentation/devicetree/bindings/clock/clk-domain.txt
> >> >> > new file mode 100644
> >> >> > index 0000000..b86772f5
> >> >> > --- /dev/null
> >> >> > +++ b/Documentation/devicetree/bindings/clock/clk-domain.txt
> >> >> > @@ -0,0 +1,35 @@
> >> >> > +Always-on Clock Domain
> >> >> > +
> >> >> > +Some hardware is contains bunches of clocks which must never=
 be
> >> >> > +turned off.  If drivers a) fail to obtain a reference to any=
 of
> >> >> > +these or b) give up a previously obtained reference during s=
uspend,
> >> >> > +the common clk framework will attempt to disable them and th=
e
> >> >> > +hardware can fail irrecoverably.  Usually, the only way to r=
ecover
> >> >> > +from these failures is to restart.
> >> >>
> >> >> How is (b) not a bug?
> >> >
> >> > Clocks are normally disabled during suspend.  When clocks are di=
sabled
> >> > they give up their reference.  If references reach 0, the clock =
is
> >> > gated.  If one of these clocks is gated, the system will never c=
ome
> >> > out of suspend.
> >> >
> >> > How is it a bug?
> >>
> >> It a clock needs to be enabled during suspend, then the driver usi=
ng
> >> it should not disable it. Anyway, suspend is a bit orthogonal to t=
his
> >> issue.
> >
> > IMO, it's not the driver's responsibility to know which clock they =
are
> > using and whether it's a critical clock or not.
>=20
> Certainly drivers should not know about clocks outside of their h/w
> block, but they absolutely should know if a clock is needed for
> wake-up.
>=20
> >> >> While I think we need something here, I worry that this will be=
 abused
> >> >> to be a list of clocks you have not gotten around to managing. =
We
> >> >
> >> > You can say that about any framework.  It's our responsibility t=
o ask
> >> > the right questions and to disallow it from being abused.  The c=
locks
> >> > I use in the (real-world) example in this set are _really_ alway=
s-on.
> >> > If any of them are turned off the system will cease to perform i=
n any
> >> > meaningful way.
> >>
> >> You cannot tell here up front whether clocks are really always-on.=
 A
> >> reviewer is not going to know, and the submitter may not even have=
 all
> >> the documentation and know the answer. Getting it wrong here means=
 you
> >> have to change the dtb to fix it. Granted, it doesn't really break
> >> things in this case.
> >
> > We should make it clear in the documentation that this framework
> > should only be used if the clock is a critical "if it's turned off =
it
> > will cripple the system" one.
> >
> >> >> cannot be changing the DT every time the kernel starts managing=
 a
> >> >> clock. I think this should operate more as always on until clai=
med.
> >> >
> >> > The point of this is that even when these clocks are claimed, th=
ere is
> >> > an issue that when unclaimed (i.e. during suspend) the clk frame=
work
> >> > will attempt to gate them, and when they do *boom*.
> >> >
> >> >> But then you get into drivers having to be aware that the clock
> >> >> started enabled.
> >> >
> >> > This has nothing to do with the initial state of the clock.  It'=
s
> >> > whether the clock is integral (i.e. is part of a vital interconn=
ect)
> >> > that's important.  For instance, ST's bootloader turns on lots o=
f
> >> > clocks which can be safely gated if unused.  The clocks we're
> >> > registering with this always-on framework cannot.
> >>
> >> It does because you have to assume either the initial state is wro=
ng
> >> and you need to disable it, or that the initial state is correct a=
nd
> >> you need to leave the clock enabled.
> >
> > I think the kernel's policy is a good one i.e. wait until all devic=
es
> > are probed and have had the opportunity to take the clocks they nee=
d,
> > at which point we can usually safely gate the remainder.  These typ=
es
> > of clocks are the exception however; hence the need for this driver=
=2E
> > There are other vendors which have similar issues with their h/w.
> > These are currently using bespoke versions of this implementation, =
but
> > IMO a generic solution would be better.
> >
> >> There are also other usecases such as simplefb where you want to l=
eave
> >> clocks on until the real fb driver takes over. Consoles have a sim=
ilar
> >> issue.
> >
> > Why wouldn't these devices have taken references by the time
> > clk_disable_unused() is called?
>=20
> Not if the drivers are modules.

Can you rightfully compile the drivers for your monitor and serial
console as modules and expect them to work until you load them?

> >> Perhaps you need to model your buses more completely?
> >
> > Would you mind explaining this a little more please?
> >
> >> Does simple-pm-bus help you?
> >
> > I have no idea what this is, and I'm struggling to grep for it too?
>=20
> http://lwn.net/Articles/632058/
>=20
> I'm not saying this works as-is for you, but people are starting to
> add bus properties to buses.

I'm struggling to see how this might help.  Which node would you probe
as simple-pm-bus?  It sounds like a very bloated and convoluted way
of saying "don't gate these clocks".  Besides, isn't this the opposite
what what we're trying to achieve?  We don't want to enable any PM on
these clocks, let along runtime PM.  FYI, I also looked into genpd,
but came to the same set of conclusions.

> >> >> Also, I feel like we are using DT to work around kernel policy =
(of
> >> >> turning off clocks). If the policy was to leave on clocks, then=
 we
> >> >> would be trying to put a list of clocks to disable in DT.
> >> >
> >> > I'm not sure I understand your point.  The current policy is cor=
rect
> >> > if it's power that you care about, which is invariably the point=
 of
> >> > disabling clocks in the first place, right?  Also, this has noth=
ing to
> >> > do with DT per say.  It's just another framework driver.
> >>
> >> It does have something to do with DT because you are designing a
> >> binding around what the kernel does. Should the kernel assume it c=
an
> >> disable clocks safely?
> >
> > I guess it depends on what you're trying to achieve.  Personally I
> > think the kernel's policy is a good one, especually with regards to
> > power saving.  What are you suggesting?  A new policy?
>=20
> No. The binding just has to work no matter what the OS policy.
>=20
> >> Another OS may do the opposite and assume it
> >> cannot turn-off unused clocks. Then you would have a list of clock=
s
> >> safe to disable in DT.
> >
> > Sounds bananas.  What's good about that kind of policy?  It wouldn'=
t
> > matter anyway, both of these implementations can live harmoniously =
in
> > the same tree.
>=20
> Your systems won't go *boom*.
>=20
> >> This is also completely solvable within the framework driver by
> >> claiming those clocks in the clock controller driver.
> >
> > This conversation has now gone full circle.  This was an earlier
> > suggestion, but it was considered hacky, and I'm inclined to agree.
>=20
> The clock maintainer doesn't want hacks in the clock framework and th=
e
> DT maintainer doesn't want them in DT... We should put them in MFD. ;=
)
>=20
> > An always-on power domain was deemed to be a much more elegant
> > solution.
>=20
> Now you are mixing in power domains?
>=20
> I'm not saying we can't put something in DT. I'm okay with that, but
> it needs to handle the case of the clocks do get claimed either after
> boot (e.g. by a module) or in later kernels without a dtb change.
>=20
> Rob

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
