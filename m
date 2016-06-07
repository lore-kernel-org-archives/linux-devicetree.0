From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
Date: Tue, 7 Jun 2016 17:01:41 +0200
Message-ID: <alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com> <20160603162207.0688c9e6@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160603162207.0688c9e6@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, Linux mtd <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Hi Boris,

=46irst of all, thanks for reviewing this.

On Fri, 3 Jun 2016, Boris Brezillon wrote:

> > +
> > +Optional properties:
> > +- nand-on-flash-bbt: See nand.txt.
> > +- #address-cells, #size-cells: See partition.txt.
> > +- evatronix,use-bank-select : Use controller bank select function =
to access
> > +			      multiple chips, rather than chip enable.
>=20
> You mean, using a dedicated logic to control the CS lines rather than=
 a
> GPIO (controlled by the SW using gpio_set_value())?

No. In the SoC on which this has been developed, the nand flash control=
ler=20
has dedicated I/O pins for all its functions.

The controller has the concept of 'banks' vs. 'devices'. Essentially, a=
=20
'bank' is a group of multiple chips of the same geometry etc, and the=20
controller can send commands in parallel to all devices in the same ban=
k.=20
In contrast, different 'banks' can have completely different devices, b=
ut=20
all devices must be idle before the controller can switch 'banks'.

The usecase for the former would be to increase performance and the lat=
ter=20
case would be if there were for instance one small NAND flash for progr=
am=20
storage and a large one for data.

The IP that the driver was tested on has two available chip selects, an=
d=20
the DT property controls whether they refer to two devices in the same=20
bank vs. two separate banks.

> BTW, you seem to support controlling several CS using the same
> controller, which means you'll have to specify which CS the NAND chip
> is connected to (see [1]).

That is true. The driver as it stands currently only supports a single =
CS,=20
however, the IP as configured in the SoC in question can handle two CS=20
lines. My plan is to initially provide support for only the single-CS=20
case (there are places in the code where I felt it practical to prepare=
=20
for the multiple-CS case though).

As such, I realize that the previously mentioned property=20
(evatronix,use-bank-select) won't really have any meaning in the single=
-CS=20
case, so perhaps it should be omitted at this point completely, and add=
ed=20
in the future when it is really needed?

> > +- evatronix,rb-wired-and: Assume ready/busy signal from all flash =
chips are
> > +			  connected using a wired-AND topology rather than
> > +			  individually.
>=20
> Hm, is that really required? If the R/B line is shared among several
> NAND chips, it should be transparent, you just have to specific which
> chip is connected to which GPIO (or dedicated R/B pin).

=46or the SoC in question, the wired-and vs individual R/B lines was a=20
choice made during the chip design, which is why I exported this choice=
 as=20
a DT property, as it reflects a hardware choice done outside the IP but=
=20
inside the SoC.

I didn't really want to have the added flexibility (and complexity) of=20
being able to use any R/B line for any connected flash chip. It seems a=
n=20
unnecessary complication for the driver without much gain.

But it would certainly be doable, as the R/B stuff is handled completel=
y=20
in software. One would still need a new property that the child nand no=
des=20
can use to select the R/B line (e.g. evatronix,rb-line). (In the=20
configuration we have, as with the CS lines, the R/B line has its own=20
dedicated pin, so it's not a GPIO). So it would still require a DT=20
property to manage it.

Again, this property doesn't really have any meaning in the single-CS=20
case, so should I omit it completely?

> > +- evatronix,timings: Seven 32-bit values for initializing the TIME=
_SEQ_0,
> > +		     TIME_SEQ_1, TIMINGS_ASYN, TIME_GEN_SEQ_0, TIME_GEN_SEQ_1,
> > +		     TIME_GEN_SEQ_2 and TIME_GEN_SEQ_3 registers, respectively.
>=20
>=20
> Can this be extracted from the timing mode exposed by the NAND chip.
> IMO it shouldn't be defined in the DT.

I agree, Ideally one would like to read timing parameters from the NAND=
=20
chip (ONFi or JEDEC parameter pages) and determine all the controller I=
P=20
timings from that. There are a couple of reasons I haven't gone that=20
route.

Mainly, the reason is that the part of the timing settings are influenc=
ed=20
by delays within the SoC which are not part of the controller itself, t=
hus=20
they cannot be part of the driver code and must come from somewhere els=
e.

The other reason is that the resulting calculations would be rather=20
complex to express, given the general case of different controller=20
operating frequencies, different types of parameter pages (ONFi vs.=20
JEDEC), and a number of settable timing modes (ONFi mode 0, 1, 2, ...).=
 It=20
would be a nightmare to test and probably even worse to make future=20
changes. At some point, the resulting register values will have to be=20
analyzed manually anyway to verify them, checking them against the timi=
ngs=20
for the nand flash chips in question, so one might as well put those=20
values into the configuration to start with.

One route to go would be to have a number of 'timings' parameters in th=
e=20
=2Edtsi file for the SoC in question, where the register values are def=
ined=20
for different timing modes. The board (.dts) file could then either sel=
ect=20
one of the .dtsi-defined timing modes, or it could be selected=20
automatically for those cases where it would be possible (i.e. ONFi tim=
ing=20
modes).

> > +	/* ONFi mode 0 timing, assuming 100 MHz clock. */
> > +	/* Order is TIME_SEQ_0, TIME_SEQ_1, TIMINGS_ASYN,
> > +	 * TIME_GEN_SEQ_0, _1, _2, _3 */
> > +	evatronix,timings =3D <0x0d151533 0x000b0515 0x00000046
> > +			     0x00150000 0x00000000 0x00000005 0x00000015>;
> > +	nand-ecc-mode =3D "hw";
> > +	nand-ecc-algo =3D "bch";
> > +	nand-on-flash-bbt;
> > +	nand-ecc-strength =3D <8>;
> > +	nand-ecc-step-size =3D <512>;
> > +	evatronix,use-bank-select;
> > +	evatronix,rb-wired-and;
> > +};
>=20
> We recently added more constraints on the 'NAND controller/NAND chip'
> representation in the DT [1].
> You should rework your binding (and your code) to match these
> constraints, even if you controller is only able to interface with a
> single NAND chip.

Just so I'm clear on this: what you're referring to here is that the=20
generic mtd properties (nand-*) are now per chip rather than per=20
controller? I will have to rework this.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
