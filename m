From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 2/4] mfd: lubbock_cplds: add lubbock IO board
Date: Wed, 18 Feb 2015 08:07:19 +0000
Message-ID: <20150218080719.GB5781@x1>
References: <20150216130549.GF14545@x1>
 <1170550770.470129293.1424093248596.JavaMail.root@zimbra1-e1.priv.proxad.net>
 <20150216162712.GR14545@x1>
 <87fva5a4i2.fsf@free.fr>
 <20150217074310.GT14545@x1>
 <alpine.LFD.2.11.1502171221300.22104@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.11.1502171221300.22104@knanqh.ubzr>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On Tue, 17 Feb 2015, Nicolas Pitre wrote:
> On Tue, 17 Feb 2015, Lee Jones wrote:
>=20
> > Arnd, Greg,
> >=20
> >   Perhaps you have some ideas WRT programmables (PLDs/CPLDs/FPGAs)?
>=20
> FWIW...
>=20
> The Lubbock is an ancient development board (circa 2003) using a CPLD=
 to=20
> multiplex a couple things on the board.  I really doubt anyone would=20
> reprogram this CPLD at this point. So I'd treat it just like another=20
> interrupt controller + random peripherals that will never change.  An=
d=20
> yes, maybe a more appropriate name is needed.

Understood.  However, I'm tempted to occupy some higher ground here
and say that there will always be (good?) excuses to shoehorn drivers
into subsystems which they don't truly belong.  Rather than make
exceptions I'd rather see an implementation which would also serve
subsequent attempts to upstream these types of devices.

> And I happen to have one such beast on my desk wasting significant=20
> realestate and picking up dust.  I don't think I booted it even once =
in=20
> the last 3 years.  I'm seriously considering a trip to the recycling=20
> facility to dispose of it unless someone wants it and is ready to pay=
=20
> for the shipping.

Shameless.  I think you were looking for Craig's List. ;)

> > On Mon, 16 Feb 2015, Robert Jarzmik wrote:
> > > Lee Jones wrote:
> > > > What's all this?  Please configure your mail client correctly.
> > > >
> > > > For advice, see:
> > > >
> > > >   Documentation/email-clients.txt
> > > While at day work, I have only access to web mail ...
> >=20
> > Probably best to hold off your reply until you get home then.  It's
> > not just a formatting issue, you also exposed many raw email addres=
ses
> > to the internet, which are easily harvested up by web crawlers.
> >=20
> > See this:
> >   https://lkml.org/lkml/2015/2/16/247
> >=20
> > > >>  2) after v2, we _both_ agreed that the accurate name is "cpld=
s"
> > > >>     which exactly what is in this patch
> > > >>     (see device registering with lubbock_cplds).
> > > >
> > > > There is no mention of this decision in the changelogs.  If it'=
s not
> > > > in the change logs, it didn't happen. ;)
> > > Ah right.
> > >=20
> > > > I'm still concerned with the fact that the driver file is named=
 using
> > > > and is populated by lots of instances of a "board" name.  I'm s=
ure you
> > > > would share my thoughts is someone submitted a driver called
> > > > beaglebone.c or raspberrypi.c to MFD.
> > > I understand your concern. Arnd, a thought about it ? The only vi=
able
> > > alternative would be to move it to arch/arm/plat-pxa AFAIS.
> >=20
> > I don't think this is correct either.  CPLD handling would probably=
 be
> > slightly less out of place in drivers/misc, but perhaps a new
> > subsystem for PLDs/CPLDs/FPGAs would be more appropriate
> > drivers/programmables or similar maybe.
> >=20
> > > >> > Besides, this is MFD, where we support single pieces of sili=
con which
> > > >> > happen to support multiple devices.  I definitely don't want=
 to support
> > > >> > boards here.
> > > >> > You might want to re-think the naming and your (sales) pitch=
=2E
> > > >> I might need help. As for the (sales), no comment.
> > > >
> > > > By pitch, I mean to convince me that this belongs in MFD.
> > > I've been trying.
> >=20
> > I'm pretty convinced that it doesn't belong in MFD now, but it does=
n't
> > mean I'm going to leave you on the curb.  I'd like to help you get =
it
> > into a better home.
> >=20
> > [...]
> >=20
> > > > Understanding was lost when I learned that the whole file was c=
entred
> > > > around the premise of board support.  I understand now that thi=
s is a
> > > > driver for a CPLD, which I'm not sure is even MFD.  Also, if it=
 is
> > > > really a CPLD driver, shouldn't be named after the manufacturer=
/model
> > > > number of the chip, rather than the PCB which it's connected to=
?
> > > >
> > > > I'm also concerned that this driver has no functional CPLD code
> > > > contained.  All you're doing is defining an IRQ domain.  Why th=
en
> > > > isn't this really an drivers/irqchip (Suggested-by: Josh Cartwr=
ight)
> > > > driver?
> > > Is not only a irqchip because, as explained at the bottom of the =
commit message,
> > > quoting myself :
> > >   This patch moves all that handling to a mfd driver. It's only p=
urpose
> > >   for the time being is the interrupt handling, but in the future=
 it
> > >   should encompass all the motherboard CPLDs handling :
> > >    - leds
> > >    - switches
> > >    - hexleds
> >=20
> > I had a conversation about this on IRC yesterday and some good
> > points/questions were posed.  This is a difficult area, because you
> > can program these things to do whatever you like.  Depending on the
> > 'intention' (and it is only an intention -- someone else can come
> > along and reprogram these devices on a whim), the CPLD code could l=
ive
> > anywhere.  If you wanted to put watchdog functionality in there, th=
en
> > there is an argument for it to live in drivers/watchdog, etc etc.  =
So
> > just because the plan is to support a few (i.e. more than one) simp=
le
> > devices, it doesn't necessarily mean that the handling should be do=
ne
> > in MFD.
> >=20
> > Yesterday I was asked "Are you wanting to restrict drivers in
> > drivers/mfd to those that make use of MFD_CORE functionality?".  My
> > answer to that was "No, however; I only want devices which
> > _intrinsically_ operate in multiple subsystems", which these
> > programmables no not do.
> >=20
> > FYI, you're not on your own here.  There is at least one of these
> > devices in the kernel already and upon a short inspection there
> > appears to be a number of Out-of-Tree (OoT) drivers out there which
> > will require a home in Mainline sooner or later.
> >=20


--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
