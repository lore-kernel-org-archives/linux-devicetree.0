From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [RFC v2 4/9] of: add clock providers
Date: Thu, 12 Jan 2012 10:07:02 +0000
Message-ID: <20120112100702.GM3226@page>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-4-git-send-email-grant.likely@secretlab.ca>
 <20120110213338.GD3226@page>
 <CACxGe6vqb8AZcZb5WMvfmLsUZH7=SEtBrJCSfsFmDYpKX42MzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6vqb8AZcZb5WMvfmLsUZH7=SEtBrJCSfsFmDYpKX42MzA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Jamie Iles <jamie@jamieiles.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Sascha Hauer <kernel@pengutronix.de>, Mike Turquette <mturquette@ti.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 11, 2012 at 09:46:58PM -0700, Grant Likely wrote:
> On Tue, Jan 10, 2012 at 2:33 PM, Jamie Iles <jamie@jamieiles.com> wro=
te:
> > On Mon, Dec 12, 2011 at 03:02:04PM -0700, Grant Likely wrote:
> >> +- clock-output-names : From common clock binding
> >> +
> >> +Example:
> >> + =A0 =A0 clock {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clock";
> >> + =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D <0>;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <1000000000>;
> >> + =A0 =A0 };
> >
> > I wonder if this should have an optional clock consumer with a stan=
dard
> > name for parenting? =A0For example, on picoxcell there is a fixed 2=
00MHz
> > APB clock that is really a PLL from a 20MHz reference input and I'd=
 like
> > to represent that in the clock tree.
>=20
> If it depends on a parent clock, then it really isn't a fixed clock,
> is it (from the perspective of the OS).  The point of this binding is
> a trivial way to describe clocks that don't change.  If that
> assumption doesn't hold true, then this binding isn't suitable for
> that clock.  As you point out, even the gpio enable feature is pushin=
g
> things a bit.
>=20
> That said, I'm open to extending this binding if something can be
> defined that will have a lot of use cases.

Well for picoxcell where the 200MHz APB clock is just a PLL generated=20
from a 20MHz clock then it kind of is a fixed clock as far as Linux is=20
concerned isn't it?  The rate can't be changed and and the clock can't=20
be disabled so it's just a dumb clock with a parent.

I guess I could just omit the parent as far as Linux is concerned, but=20
it would be nice to represent the real clock tree if possible.

> > I'm about to start trying to get this and Mike's common struct clk
> > patches working on picoxcell, and the one thing I'm not understandi=
ng at
> > the moment is how to handle the tree itself. =A0Currently I was pla=
nning
> > on iterating over all clocks and finding a named input clock "ref" =
or
> > "input" perhaps. =A0This would be fine for picoxcell, but I guess m=
ore
> > complicated chips may need something else.
>=20
> It might be useful to have something like of_irq_init() for setting u=
p
> initial clocks, but the solution feels inelegant to me.  I suspect
> that there will be end up being intertwined init order dependencies
> between clocks and irqs and other early setup stuff that could be
> handled better.  Again, I need to think about this some more.  There
> might need to be something like an of_early_probe() call that accepts
> a match table of compatible values and setup functions with some logi=
c
> or data to resolve dependencies.  The trick will be to not end up wit=
h
> something complex.  I'll need to think about this more...

Yes, probably not an easy problem to solve, especially for the platform=
s=20
where the parent can change at runtime.

I wonder if an of_clk_init() could take a platform callback, so that=20
of_clk_init() goes of and creates a struct clk for each clk in the DT,=20
then for each registered clock calls a platform specific callback which=
=20
returns the parent (if any).  It feels like a fairly platform specific=20
problem to me.

Jamie
