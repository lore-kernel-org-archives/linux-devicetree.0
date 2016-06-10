From: Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix
 NANDFLASH-CTRL
Date: Fri, 10 Jun 2016 16:22:38 +0200
Message-ID: <alpine.DEB.2.02.1606101433170.30757@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com> <20160603165909.09f27ee0@bbrezillon> <alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com> <CA+uuBqb4fG4nK7atrF7XOQ=ip2SfKrxU+KXqD3W+PA_ZA7cS3g@mail.gmail.com>
 <20160609200128.5b7a6e29@bbrezillon> <CA+uuBqaRv2f8K-Q2ZLQY8tq6idq8XCDMV21SYM5XCWc4FVV90g@mail.gmail.com> <20160609222307.5db4e67f@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160609222307.5db4e67f@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mychaela Falconia <mychaela.falconia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>, Linux mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Thu, 9 Jun 2016, Boris Brezillon wrote:

> > >
> > > By supporting only a subset of what NAND chips actually support, =
and
> > > preventing any raw access, you just limit the compatibility of th=
e NAND
> > > controller with rather old NAND chips. For example, your controll=
er
> > > cannot deal with MLC/TLC NANDs because it just can't send the pri=
vate
> > > commands required to have reliable support for these NANDs. =20
> >=20
> > I am not the one who designed the controller IP, so please don't sh=
oot
> > the messenger.
>=20
> Yes, sorry, I was just over-reacting because I'm tired earing that th=
e
> only solution to get a high performances is to hide everything in the
> controller which is likely to be incompatible with NANDs we'll see in=
 a
> few month from there.

I don't know what the situation is with other NAND drivers and controll=
er=20
IP's, but in my case, the set of NAND flashes which the SoC in which th=
e=20
Evatronix IP is included is intended to operate with is fairly limited,=
=20
partly because our products don't require a great veriety, and partly f=
or=20
SoC verification reasons (the fewer flash types tested, the less time a=
nd=20
money, essentially). So the mindset from the outset was 'we need to=20
support these flashes, can we do it', rather than 'we want a general=20
driver', which in the end is reflected in the somewhat limited set of=20
flash types initially supported by the driver.

I fully understand that the opposite is true of the Linux kernel, which=
 is=20
intended to be as general as possible, I'm just trying to offer an=20
explanation for the somewhat limited scope of driver developers,=20
especially those working on company time, the understanding of which=20
eventually might lead to use finding ways to solve this dilemma.

=46WIW, in the Evatronix case, it wasn't any performance issue that dro=
ve=20
the driver development, it just seemed like the Right Thing to Do.

> > > I've been told many times that NAND controllers were not supporti=
ng raw
> > > accesses (disabling the ECC engine when accessing the NAND), and =
most
> > > of the time it was false, but the developers just didn't care abo=
ut
> > > supporting this feature, and things like that make the whole subs=
ystem
> > > unmaintainable. =20

Yeah, I've come across a driver (not in mainline though) with precisely=
=20
this problem. The hardware supported hardware BCH ECC, but without=20
returning the number of corrected bits, which made almost useless, as=20
there was no way of detecting when the number of bits in an ECC block w=
as=20
nearing the limit for a read failure. The solution was to implement=20
software ECC, but the driver didn't really support this mode to start w=
ith=20
and it had to be added.

(FWIW, the Evatronix driver does support both hardware and software ECC=
,=20
the latter mostly intended for verification and debugging purposes).

> Now back to the Evatronix IP. I had a closer look at Ricard's code, a=
nd
> it seems the controller is actually supporting a low-level mode
> (command seq 18 and 19 + MAKE_GEN_CMD()).

Yes, that's true, it is labelled as a 'generic command sequence' in the=
=20
document. Well, it's not really a low level mode, as you can see you st=
ill=20
need to do the whole operation in one go, but in the end that is what i=
t=20
accomplishes.

> So my suggestion is to implement ->cmd_ctrl() and use these generic
> commands. And of course optimized/packed accesses (using specific
> commands) can be used in ecc->read/write_page().

Actually, the use of ECC or not is governed outside the IP command set.=
 I=20
already use the generic command sequence (SEQ18/19) for ECC reads and=20
writes towards flashes with 4 byte addresses. So it should be doable to=
=20
use the generic command sequencer for any number of address bytes, both=
=20
with and without ECC.

> This would require a flag to ask the core to not send the READ/WRITE=20
> commands before calling ecc->read/write_page(), but that's doable.

Ok, so a change required in the core to get this to work then. I've ten=
ded=20
to avoid writing driver code so that it requires changes to the framwor=
k=20
unless absolutely necessary, as the changes tend to be rather specific =
and=20
clutter up the general code (which, honestly, is bad enough as it is, n=
ot=20
trying to blame anyone here, just an observation), and can usually be=20
resolved in the driver with a bit of ingenuity.

> All other commands would use the generic mode, since they don't requi=
re
> high performances or any specific handling.
>=20
> This way you don't have to implement your own ->cmdfunc() function, y=
ou
> can get rid of all the specific ID/ONFI detection logic (the generic
> commands should allow you to retrieve those information)

=46WIW, there isn't much ID detection logic, although looking at it som=
e of=20
the comments imply that there is (and that should be changed of course)=
,=20
because the ID type byte is actually identical to what the controller u=
ses=20
to select the relevant type.

> and rely on the default implementation.
>=20
> Ricard, would that work?

The main reason the I've been using the ->cmdfunc() interface is that t=
he=20
API is on a fairly high level ("here's a sequence of address bytes", "r=
ead=20
a page", etc) which is on similar level to the API to the actual IP (i.=
e. =20
"read a page from this address").

In contrast, using the ->cmd_ctrl() interface means that I've got to=20
interpret a sequence of bytes coming in as multiple function calls. It=20
just seemed like a bad idea compared to interpreting a set of high leve=
l=20
commands, given that the controller also has a high level API. It seeme=
d a=20
bit like a roundabout way letting someone (i.e. nand_command) encode a=20
high level command into several low level operations, which must then b=
e=20
deciphered by the flash driver one by one in order to assemble another=20
high level command. It seemed much more direct to process the high leve=
l=20
commands directly - and easier to read, as the required operations are=20
directly visible as macros. The ->cmd_ctrl() interface is fine for=20
byte-banging an 8-bit I/O port as that was what it was designed for, bu=
t=20
quite simply seemed to be the wrong level for anything more advanced th=
an=20
that. Sortof akin to reading a file with getc() rather than read(), whi=
ch=20
is why I never really considered it.

But I can definitely see your point, especially as maintainer with the=20
goal of supporting as many devices as possible, and also considering yo=
ur=20
plans (as you mentioned in another reply) to rework the API, which woul=
d=20
mean that the ->cmdfunc() API would be changing, with the associated=20
changes in drivers that use that API.

Looking at the documentation, it does look doable, but to a certain ext=
ent=20
it's in the category "can't really tell until I've tried it". In the wo=
rst=20
case, some operations would still need to use specific IP commands but=20
they should be few.

It's a fairly extensive rewrite though, as a lot of the internal logic =
of=20
the driver is based on the external API being a high level, even if the=
=20
code in the end will be simpler.

The company I work for has an explicit goal of getting as much of the=20
Linux port for our SoC upstream, so hopefully I can find time to rewrit=
e=20
this in the near future, although I'm off on a fairly long summer vacat=
ion=20
shortly. I'll try to get it underway as soon as I'm back.

Something that I am mildly miffed about is that I've posted this driver=
=20
twice before on the mtd list (although, admittedly, not directly addres=
sed=20
to any maintainer), first as an RFC and later as a complete patch, with=
out=20
a single response. (Apparently Boris you did respond with comments on=20
Oleksij's driver though which I must have missed). Although an RFC migh=
t=20
not have initiated a detailed review, it would have been a large advant=
age=20
(and wasted less time for all) if the point of using 'wrong' driver=20
interface had been brought up and consequently discussed earlier. Yes I=
=20
know, everyone is busy, it's easy to miss things, each and every driver=
=20
can't be reviewed in detail, etc.

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
