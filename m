From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
Date: Fri, 10 Jun 2016 17:35:24 +0200
Message-ID: <alpine.DEB.2.02.1606101641050.30757@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com> <20160603162207.0688c9e6@bbrezillon> <alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com> <20160608175018.16c88207@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160608175018.16c88207@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, Linux mtd <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Wed, 8 Jun 2016, Boris Brezillon wrote:

> > > > +Optional properties:
> > > > +- nand-on-flash-bbt: See nand.txt.
> > > > +- #address-cells, #size-cells: See partition.txt.
> > > > +- evatronix,use-bank-select : Use controller bank select funct=
ion to access
> > > > +			      multiple chips, rather than chip enable. =20
> > >=20
> > > You mean, using a dedicated logic to control the CS lines rather =
than a
> > > GPIO (controlled by the SW using gpio_set_value())? =20
> >=20
> > No. In the SoC on which this has been developed, the nand flash con=
troller=20
> > has dedicated I/O pins for all its functions.
> >=20
> > The controller has the concept of 'banks' vs. 'devices'. Essentiall=
y, a=20
> > 'bank' is a group of multiple chips of the same geometry etc, and t=
he=20
> > controller can send commands in parallel to all devices in the same=
 bank.=20
> > In contrast, different 'banks' can have completely different device=
s, but=20
> > all devices must be idle before the controller can switch 'banks'.
> >=20
> > The usecase for the former would be to increase performance and the=
 latter=20
> > case would be if there were for instance one small NAND flash for p=
rogram=20
> > storage and a large one for data.
> >=20
> > The IP that the driver was tested on has two available chip selects=
, and=20
> > the DT property controls whether they refer to two devices in the s=
ame=20
> > bank vs. two separate banks.
>=20
> Still don't see how it can be used in real world (or maybe I don't
> understand how it works).
>=20
> Say the CS are both selected at the same time, this means you'll send
> the same set of data to the 2 chips, right. I see two use cases for
> this:
> 1/ You have 2 chips connected to the same data bus, CS, RB and CLE/AL=
E
>    lines and you want to mirror data written on chip0 on chip1
> 2/ You have 2 chips connected to the same CS, RB, CLE/ALE lines, but
>    chip0 is using the lower 8bits of the bus, and chip1 is using the
>    remaining 8bits. This way you fake an 16bits bus
>=20
> Both cases are unsafe, because of NAND unreliability. Say you're
> writing on a block in chip0 this block in chip1 is bad. One of your
> write will succeed, the other one will fail.
>=20
> Could you give a real use case where this 'bank-select' method is
> really usefull (and safe)?
> If you can't, then drop this mode for now, and always operate in
> 'chip-enable' mode.

The use cases as I see are as follows:

a) Two identical chips sharing all but the CS lines, in order to implem=
ent=20
a seemingly-larger address space. (e.g. two 256 Mbit chips implementing=
 a=20
4 GB area). In this case, for certain operations, the controller does n=
ot=20
have to wait for one device to complete before issuing a command to=20
another. I'm not sure how the controller keeps track of the two devices=
=20
though.

b) Two different chips with the same connection, which provide disjunct=
=20
functions, e.g. one (small) flash for program storage and one (large) f=
or=20
data.

But your questions have convinced me to leave this part of the driver f=
or=20
now, and as you say it can be added in when the need arises.

> > > BTW, you seem to support controlling several CS using the same
> > > controller, which means you'll have to specify which CS the NAND =
chip
> > > is connected to (see [1]). =20
> >=20
> > That is true. The driver as it stands currently only supports a sin=
gle CS,=20
> > however, the IP as configured in the SoC in question can handle two=
 CS=20
> > lines. My plan is to initially provide support for only the single-=
CS=20
> > case (there are places in the code where I felt it practical to pre=
pare=20
> > for the multiple-CS case though).
> >=20
> > As such, I realize that the previously mentioned property=20
> > (evatronix,use-bank-select) won't really have any meaning in the si=
ngle-CS=20
> > case, so perhaps it should be omitted at this point completely, and=
 added=20
> > in the future when it is really needed?
>=20
> Yes, but I'd still like to see a proper NAND controller/NAND chip=20
> separation in you binding.

Yes, I understand that.

> > > > +- evatronix,rb-wired-and: Assume ready/busy signal from all fl=
ash chips are
> > > > +			  connected using a wired-AND topology rather than
> > > > +			  individually. =20
> > >=20
> > > Hm, is that really required? If the R/B line is shared among seve=
ral
> > > NAND chips, it should be transparent, you just have to specific w=
hich
> > > chip is connected to which GPIO (or dedicated R/B pin). =20
> >=20
> > For the SoC in question, the wired-and vs individual R/B lines was =
a=20
> > choice made during the chip design, which is why I exported this ch=
oice as=20
> > a DT property, as it reflects a hardware choice done outside the IP=
 but=20
> > inside the SoC.
>=20
> Okay, maybe it's worth keeping this property if the AND logic is
> integrated in the SoC.

Ok.

> > I didn't really want to have the added flexibility (and complexity)=
 of=20
> > being able to use any R/B line for any connected flash chip. It see=
ms an=20
> > unnecessary complication for the driver without much gain.
>=20
> Not really, at least if you properly separate the chip and controller
> objects it's quite easy to deal with, and I'll ask you to do this cle=
an
> separation anyway (even if you say you only have a single chip per
> controller) :P.

Yes, the separation of chip and controller is needed, but the R/B line=20
flexibility requires an additional mapping functionality within the=20
driver. Not rocket science of course, but I can't see much point in it=20
(other than to cover up a potential routing mistake done by a PCB=20
designer).

> >=20
> > Again, this property doesn't really have any meaning in the single-=
CS=20
> > case, so should I omit it completely?
>=20
> Keep in mind that you're defining a DT binding, and this binding is
> submitting to the 'stable ABI' rule, so you shouldn't think in term o=
f
> what your driver supports now, but what you're IP is capable of, and
> it's definitely capable of handling several R/B pins.

Yes, I understand about the stable API rule, but at the same time that =
R/B=20
mapping could be added without violating that rule at a later date if=20
someone really needed it, couldn't it?

I mean, an IP may be capable of a lot of things, and we don't necessari=
ly=20
want to implement them all in the driver to start with and have DT=20
propertes for them all do we?

> > > > +- evatronix,timings: Seven 32-bit values for initializing the =
TIME_SEQ_0,
> > > > +		     TIME_SEQ_1, TIMINGS_ASYN, TIME_GEN_SEQ_0, TIME_GEN_SEQ_=
1,
> > > > +		     TIME_GEN_SEQ_2 and TIME_GEN_SEQ_3 registers, respective=
ly. =20
> > >=20
> > >=20
> > > Can this be extracted from the timing mode exposed by the NAND ch=
ip.
> > > IMO it shouldn't be defined in the DT. =20
> >=20
> > I agree, Ideally one would like to read timing parameters from the =
NAND=20
> > chip (ONFi or JEDEC parameter pages) and determine all the controll=
er IP=20
> > timings from that. There are a couple of reasons I haven't gone tha=
t=20
> > route.
> >=20

I think what I'm worried about is that say we add the functionality to=20
take the appropriate parameters and create a set of timing values. We c=
an=20
verify those values only under a very limited set of circumstances (a=20
certain clock frequency, certain pad delays on a given SoC, limited ran=
ge=20
of flash chips etc). At a later date, the IP is used in a different SoC=
=20
and the original calculation turns out to be wrong in that case. Updati=
ng=20
the timing calcuation function to work with the original SoC and the ne=
w=20
one would be a bit of a nightmare I. Since at some point a set of speci=
fic=20
timing values need to be calculated for a given SoC anyway, we might as=
=20
well use those values as they are.

> And my answer is no :).=20

:-)

> Just because it's complicated to extract these information at the dri=
ver=20
> level level doesn't mean you should put it in the DT. That's exactly =
the=20
> opposite: the DT is supposed to encode the hardware representation, n=
ot=20
> how you want to configure it.

I would say that the complexity and error-proneness of automatic timing=
=20
calculation outweighs the benefit, but I see I'm fighting a loosing bat=
tle=20
here...

> How about using a default/safe timing mode for now (ONFI timing mode =
0
> should work for all NANDs).
> The only thing you'll have to do is retrieve the source clk rate and
> calculate timing register values accordingly. Or you can even assume
> you always have a 100MHz source clk and hardcode it in your driver.

Yes, that is certainly possible of course, and the driver already has a=
=20
hard-coded default setup for this case.

In that case though the driver could have pre-set setups for other ONFi=
=20
modes, and we could have an _optional_ DT property to select them, the=20
reason for that being in order to handle non-ONFi flashes whose timing=20
cannot be gleaned from the device itself.

I.e. something like

evatronix,onfi-timing-mode =3D <2>;

Would that be acceptable?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
