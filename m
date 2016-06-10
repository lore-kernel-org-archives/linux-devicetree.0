From: Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
Date: Fri, 10 Jun 2016 18:46:24 +0200
Message-ID: <alpine.DEB.2.02.1606101803120.30757@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com> <20160603162207.0688c9e6@bbrezillon> <alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com> <20160608175018.16c88207@bbrezillon> <alpine.DEB.2.02.1606101641050.30757@lnxricardw1.se.axis.com>
 <20160610175454.327f51a2@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160610175454.327f51a2@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Fri, 10 Jun 2016, Boris Brezillon wrote:

> > The use cases as I see are as follows:
> >=20
> > a) Two identical chips sharing all but the CS lines, in order to im=
plement=20
> > a seemingly-larger address space. (e.g. two 256 Mbit chips implemen=
ting a=20
> > 4 GB area). In this case, for certain operations, the controller do=
es not=20
> > have to wait for one device to complete before issuing a command to=
=20
> > another. I'm not sure how the controller keeps track of the two dev=
ices=20
> > though.
>=20
> I think it's the chip-enable use case, isn't it?
>=20
> >=20
> > b) Two different chips with the same connection, which provide disj=
unct=20
> > functions, e.g. one (small) flash for program storage and one (larg=
e) for=20
> > data.
>=20
> Then they can't share the CS line (or be actived at the same time), a=
t
> least it doesn't make any sense to me.

Sorry if I haven't been clear enough, but in neither case are the CS li=
nes=20
shared between the devices. There is still a separate CS for each flash=
=20
chip. The question is how the controller handles the CS lines.

Basically, in the general case, the controller can handle a matrix of n=
and=20
flash chips. There can be a number of banks, each of which can have a=20
number of individual CS lines. For the (in this case academic) case of =
3=20
banks and 4 chip selects per bank, there would be a total of 3 x 4 =3D =
12 CS=20
lines.

=46or the IP configuration the driver was written for, there are only 2=
 CS=20
lines, and we can configure if they are to be viewed by the controller =
as=20
2 CS lines within the same single bank, or 2 separate banks with one CS=
=20
each. This is what the DT property is intended to express. It basically=
=20
translates directly into a register write in the IP.

But, as you are driving at below, the bindings should really cover the=20
more general case, for which a simple use-bank-select property doesn't=20
really cut it. Since the driver only supports a single CS at the time=20
being, I'm really proposing to drop it completely, alternatively we cou=
ld=20
have two: 'banks' and 'devices-per-bank', which reflect what the genera=
l=20
IP case would be able to handle. For the version of the IP in use these=
=20
would have the permitted values of 1 and 2, with some combinations bein=
g=20
illegal. Unfortunately, the IP configuration cannot be read out (neithe=
r=20
the version of it), so it's not possible for the driver to verify the=20
DT settings against the actual IP configuration. I don't really know ho=
w=20
to solve that.

> > > > I didn't really want to have the added flexibility (and complex=
ity) of=20
> > > > being able to use any R/B line for any connected flash chip. It=
 seems an=20
> > > > unnecessary complication for the driver without much gain. =20
> > >=20
> > > Not really, at least if you properly separate the chip and contro=
ller
> > > objects it's quite easy to deal with, and I'll ask you to do this=
 clean
> > > separation anyway (even if you say you only have a single chip pe=
r
> > > controller) :P. =20
> >=20
> > Yes, the separation of chip and controller is needed, but the R/B l=
ine=20
> > flexibility requires an additional mapping functionality within the=
=20
> > driver. Not rocket science of course, but I can't see much point in=
 it=20
> > (other than to cover up a potential routing mistake done by a PCB=20
> > designer).
>=20
> You seem to argue on all the minor things I'm asking. Honestly, it
> should be hard or error-prone to do it. And let's say you don't suppo=
rt
> it in your driver, you should still think about that when designing
> your bindings.

Sorry, it's just that over the years I've seen too much code that=20
introduces various flexibilities just because someone thought it might =
be=20
'nice to have at some point' or 'because the hardware supports it', but=
=20
which in reality is never used and still must be maintained. Sure, one=20
small mapping function is certainly not going to break the bank, far fr=
om=20
it, but over time the matrix of things that can be configured can grow =
to=20
awkward proportions, and often something thought of as a minor issue ca=
n=20
turn out to be complex to support in the end. And given a stable API ru=
le,=20
it's too late to simplify things once they have been implemented.

Of course, the code should not be written in a way to limit future=20
expansion either.

> > I mean, an IP may be capable of a lot of things, and we don't neces=
sarily=20
> > want to implement them all in the driver to start with and have DT=20
> > propertes for them all do we?
>=20
> Hm, you should at least take the capabilities you know about into
> account when defining a new binding, and you already know that some
> SoCs might decide to expose 2 or more R/B pins, so it should already =
be
> designed this way.

Ok. I'll give it some more thought then.

> I'm opposed to the idea of putting information that can be
> automatically deduced in the DT. For this specific case, the main
> reason is that a board vendor can decide to use different NAND chips
> on the same design, and they might not all share the same
> capabilities (and you don't want to have a dts for each NAND).

Yes, that makes sense of course, but what if someone would want to=20
override the automatic settings, for whatever reason, using an optional=
 DT=20
property? I can think of several reasons either way, that's why I'm=20
asking.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
