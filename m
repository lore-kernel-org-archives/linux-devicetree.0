From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
Date: Fri, 10 Jun 2016 19:14:38 +0200
Message-ID: <alpine.DEB.2.02.1606101906110.30757@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com> <20160603162207.0688c9e6@bbrezillon> <alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com> <20160608175018.16c88207@bbrezillon> <alpine.DEB.2.02.1606101641050.30757@lnxricardw1.se.axis.com>
 <20160610175454.327f51a2@bbrezillon> <alpine.DEB.2.02.1606101803120.30757@lnxricardw1.se.axis.com> <20160610190357.5f10c00f@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160610190357.5f10c00f@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, Linux mtd <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Fri, 10 Jun 2016, Boris Brezillon wrote:

> > Basically, in the general case, the controller can handle a matrix =
of=20
> > nand flash chips. There can be a number of banks, each of which can=
=20
> > have a number of individual CS lines. For the (in this case academi=
c)=20
> > case of 3 banks and 4 chip selects per bank, there would be a total=
 of=20
> > 3 x 4 =3D 12 CS lines.
> >=20
> > For the IP configuration the driver was written for, there are only=
 2=20
> > CS lines, and we can configure if they are to be viewed by the=20
> > controller as 2 CS lines within the same single bank, or 2 separate=
=20
> > banks with one CS each. This is what the DT property is intended to=
=20
> > express. It basically translates directly into a register write in =
the=20
> > IP.
>=20
> Okay, got it. I guess we should just expose the chip select in a line=
ar
> way (3 banks of 4 CS means the controller should support up to 12
> chips), unless you really have a way to change the CS pins routing
> internally.

When I go through the driver I will also revisit this and give it some=20
more thought if there's a set of bindings which would make sense both f=
or=20
the case we have now and for a general configuration of the IP.

> > Yes, that makes sense of course, but what if someone would want to=20
> > override the automatic settings, for whatever reason, using an=20
> > optional DT property? I can think of several reasons either way,=20
> > that's why I'm asking.
>
> You mean reducing the timings because the board design prevents using
> the highest supported mode for example? That would actually be a vali=
d
> use case, and I guess we could make a generic property for that
> (without the vendor prefix).

Yes, either that, or if the automatic selection fails for some reason, =
say=20
in a given case we know that the chips we are using support mode 2 timi=
ng,=20
but one of them gets misidentified as mode 0. Sure, that is a bug and=20
should be fixed of course, but I can imagine commercial situations wher=
e=20
it may not be feasable to update the kernel, but where a new DT would b=
e=20
ok.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
