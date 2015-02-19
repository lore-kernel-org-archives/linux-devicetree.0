From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/4] clk: dt: Introduce always-on clock domain
 documentation
Date: Thu, 19 Feb 2015 09:42:00 +0000
Message-ID: <20150219094200.GB12212@x1>
References: <1424276101-30137-1-git-send-email-lee.jones@linaro.org>
 <1424276101-30137-5-git-send-email-lee.jones@linaro.org>
 <CAL_Jsq+r1BKt5B9FNPG+Y0Oi1-3RGNmRUDbpX_uDJwr45bxMXA@mail.gmail.com>
 <20150218171230.GA30676@x1>
 <CAL_JsqJ0sfQ-OQvYjL3X3ebH4p9HkN4iy35iT7i9S2d+yz9zYg@mail.gmail.com>
 <20150218215435.GA32415@x1>
 <CAMuHMdU6DpZoi-q3pUFUX8xjnXGfTqfEYyzajZZm=-qZTk1qHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdU6DpZoi-q3pUFUX8xjnXGfTqfEYyzajZZm=-qZTk1qHQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robherring2@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, kernel@stlinux.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 19 Feb 2015, Geert Uytterhoeven wrote:
> On Wed, Feb 18, 2015 at 10:54 PM, Lee Jones <lee.jones@linaro.org> wr=
ote:
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
> So it's (partly) a platform/bus issue.
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
>=20
> [...]
>=20
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
>=20
> What kind of clocks are these? What do they control?
> Memory controllers? Bus controllers?
>=20
> They must control some device(s), so there should be one or more devi=
ce
> nodes in DT that reference these clocks.
> As soon as that information is in DT, support can be added to Linux t=
o
> make sure the "critical" clocks stay enabled, either through a real d=
river,
> or through platform code.

Some do, some don't.  For instance, we have one clock which controls
SPI and I2C that must not be turned off.  We discovered this then when
a suspend was attempted and the board refused to resume.  This clock
also runs one of the critical interconnects that runs from the a9.  It
would be wrong to remove the clk_disable() attempt from the SPI/I2C
drivers because the same IP on another board might be controlled by a
different clock which is able to be gated.

There are also clocks which control other interconnects that are not
connected to any device drivers.  If we fail to take references for
them before clk_disable_unused() is called, again the board hangs.  We
even lose JTAG support.

> >> Does simple-pm-bus help you?
> >
> > I have no idea what this is, and I'm struggling to grep for it too?
>=20
> Rob already provided a pointer.
> If you have more questions, feel free to ask!

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
