From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 4/4] clk: dt: Introduce binding for always-on clock
 support
Date: Wed, 8 Apr 2015 11:38:32 +0100
Message-ID: <20150408103832.GG5162@x1>
References: <1428432239-4114-1-git-send-email-lee.jones@linaro.org>
 <1428432239-4114-5-git-send-email-lee.jones@linaro.org>
 <20150407191746.GA26727@lukather>
 <20150408081450.GB5162@x1>
 <20150408094349.GC26727@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150408094349.GC26727@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, mturquette@linaro.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

On Wed, 08 Apr 2015, Maxime Ripard wrote:

> On Wed, Apr 08, 2015 at 09:14:50AM +0100, Lee Jones wrote:
> > > > +
> > > > +		    This property is not to be abused.  It is only to be use=
d to
> > > > +		    protect platforms from being crippled by gated clocks, n=
ot
> > > > +		    as a convenience function to avoid using the framework
> > > > +		    correctly inside device drivers.
> > >=20
> > > Disregarding what's stated here, I'm pretty sure that this will
> > > actually happen. Where do you place the cursor?
> >=20
> > That's up to Mike.
>=20
> Except that Mike won't review any of the DT changes, so he won't be
> able to refrain users from using it. Let alone out-of-tree DTs using =
a
> mainline kernel.

Ideally Mike should be Cc'ed on patches using clock bindings, but if
he isn't the DT guys are smart enough to either make the right
decisions themselves (Rob has Acked these bindings already, so will be
on the lookout for misuse, I'm sure), or ask for Mike's help.

> > > Should we create a new driver for our RAM controller, or do we wa=
nt to
> > > use clock-always-on?
> >=20
> > I would say that if all the driver did was to enable clocks, then y=
ou
> > should use this instead.  This binding was designed specifically fo=
r
> > that purpose.
> >=20
> > However, if the aforementioned driver clock can be safely gated, th=
en
> > it should not be an always-on clock.
>=20
> Yeah, of course, I understand the original intent of it, but that
> argument, which might very well be true at one point in time, might
> not be true anymore two or three releases later.

Why?  The H/W isn't going to change in two or three releases.  The
clocks designated as 'always-on' will have to be on forever, or
synonymously, 'always'.

> And that driver might actually rely on the fact that the clock is shu=
t
> down, which won't be the case.

I think you are missing the point of this binding.  The driver can
never rely on that in this use-case.  If the clock is off, there is no
device driver, period.=20

> Introducing a DT interface solely by refering to the current state of
> a driver is a bit odd.

I'm not sure I get your point.  This binding has nothing to do with
drivers.

> > > Do we really want to enforce this if we ever gain a driver that w=
ould
> > > actually be able to manage its clock (like do we want the CPU clo=
ck to
> > > never *ever* be gated just because we don't have a cpuidle/hotplu=
g
> > > driver yet?)
> >=20
> > As I've just mentioned, if a clock 'can' be turned off, this bindin=
g
> > should never be used. Situations where using always-on as a stop-ga=
p
> > due to a lack of current functionality is what the paragraph above =
is
> > trying to mitigate.
>=20
> But it's not really what this property is about. What this property
> describes is that these clocks should never be gated. Any point in
> time during the life of the system AND with in any kernel version.

You got it, that's correct -- these clocks should never be gated.

So why would that ever change?  If that is likely (or even possible)
to change in the future then this binding should not be used.

To reiterate; this binding should be used on ungatable clocks only.
Non-negotiable, non-changeable either by the introduction of new
functionality/support or kernel version.

> > > Have you seen the numerous NAK on such approach Mike did?
> >=20
> > I haven't, but the folks reviewing previous versions have.  Do you
> > have something specific in mind that you'd like to bring to my
> > attention?
>=20
> Unfortunately, I haven't been able to dig out such mails. But it's wh=
y
> we ended up with clock protection code in various clock drivers
> including:
>=20
> AT91: http://lxr.free-electrons.com/source/drivers/clk/at91/clk-slow.=
c#L484
> iMX28: http://lxr.free-electrons.com/source/drivers/clk/mxs/clk-imx28=
=2Ec#L154
> Rockchip: http://lxr.free-electrons.com/source/drivers/clk/rockchip/c=
lk.c#L320
> sunXi: http://lxr.free-electrons.com/source/drivers/clk/sunxi/clk-sun=
xi.c#L1183
> Zynq: http://lxr.free-electrons.com/source/drivers/clk/zynq/clkc.c#L5=
04
>=20
> Which is much more flexible, since you won't have to modify the DT to
> change which clocks are to be left enabled, as well as way easier to
> debug if you ever have to remove that property from the DT.

You're right, you don't have the change the DT in these cases.  You
have to write new C code, which is _less_ flexible.

So all these platforms are adding their own hand-rolled version of
this binding, adding more duplication and cruft to the kernel.
Instead they can use this 'always-on' and we can consolidate and strip
it all out.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
