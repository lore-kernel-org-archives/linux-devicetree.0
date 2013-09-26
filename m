From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/5] Add Core Divider clock support for Armada 370/XP
Date: Thu, 26 Sep 2013 12:26:52 -0300
Message-ID: <20130926152651.GC4583@localhost>
References: <1380144502-24109-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130925213730.GA19371@localhost>
 <5243E46B.2000406@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5243E46B.2000406-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Emilio Lopez <elopez93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 26, 2013 at 09:38:19AM +0200, Gregory CLEMENT wrote:
> Hi Ezequiel,
>=20
> On 25/09/2013 23:37, Ezequiel Garcia wrote:
> > (Ccing forgotten mvebu maintainers)
> >=20
> > On Wed, Sep 25, 2013 at 06:28:17PM -0300, Ezequiel Garcia wrote:
> >> This patchset adds support for a set of clocks available in Armada=
 370/XP
> >> known as "Core Divider" clocks.
> >>
> >> These are a set of gatable clocks, derived from a fixed PLL at
> >> a configurable ratio. Although this patchset adds support for the =
more
> >> general case, we only support one of the clocks, namely the NAND E=
CC clock.
> >>
> >> With this infrastructure in place, the addition of the rest of the=
 clocks
> >> would be fairly easy.
> >>
> >> In addition, the NAND clock is added as a fixed-ratio from the NAN=
D ECC clock,
> >> to model accurately the SoC clock tree.
> >>
> >> A pictorical representation of the clock tree would be:
> >>
> >>     PLL
> >>     |
> >>     |
> >>     ---------------------
> >>     |			|
> >>     |			|
> >>     NAND ECC clock	...
> >>     |
> >>     |
> >>     NAND clock
> >>
> >> This patchset is based on v3.12-rc2. Any opinions are highly appre=
ciated.
> >>
>=20
> For the whole series you can add my
> Reviewed-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20

Great! However, I found some issues on this patchset :-(, see below.

> I just wonder if you were enable to test the enable and disable for t=
he clock,
> because the datasheet is a little fuzzy about it.
>=20

Enabling and disabling the clock seems to work OK. I must admit I did
just a simple test:

* If NAND DT node does not consume the correct clock, the controller st=
ops
working just as soon as the core clock framework disables the unused cl=
ocks.
* If you make the NAND DT node consumer of the "ndclk", the controller
  works fine.

On the other side, I found this approach is incorrect! (silly me!).

Declaring the NAND clock as a fixed-ratio from the NAND ECC clock,
and making the NAND DT consume the NAND clock removes the possibility
of setting the clock rate from the NAND driver.

This happens because the controller's clock is declared as fixed,
whereas the clock that can be adjusted is the NAND ECC (the parent of N=
AND
clock).

I've been thinking on how to work this out in a clean way, but I'm not
sure which way is cleaner/better. These are my options so far, feel fre=
e
to propose any other:

1. The NAND DT node consumes the two clocks: NAND ECC and NAND clock.
It uses the former to set the rate, and the latter to read the rate to
calculate the timings.

This means we have to modify the NAND driver (but not too much).

2. We register the NAND clock in the clk-corediv driver, as a child of
NAND ECC, and implement some set_rate operation to act on NAND ECC.
The NAND DT node can then consume this clock.

This has the advantage that it's transparent to the NAND driver
(which currently consumes one clock).

3. We hack the NAND driver to consume the NAND ECC, but use the rate
as the half of it, and forget about the halved-rate NAND clock.
This seems certainly hacky.

Thoughts?
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
