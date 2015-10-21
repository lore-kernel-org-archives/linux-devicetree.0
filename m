From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] mfd: tps65086: Add driver for the TPS65086 PMIC
Date: Wed, 21 Oct 2015 20:24:49 +0100
Message-ID: <20151021192449.GA597@x1>
References: <1445014753-15450-1-git-send-email-afd@ti.com>
 <1445014753-15450-3-git-send-email-afd@ti.com>
 <20151019092336.GI31804@x1>
 <56251468.7030609@ti.com>
 <20151020100214.GM31804@x1>
 <562656AB.3060808@ti.com>
 <20151021084320.GA3270@x1>
 <5627BD11.1000704@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5627BD11.1000704-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 21 Oct 2015, Andrew F. Davis wrote:
> On 10/21/2015 03:43 AM, Lee Jones wrote:
> >On Tue, 20 Oct 2015, Andrew F. Davis wrote:
> >
> >>On 10/20/2015 05:02 AM, Lee Jones wrote:
> >>>On Mon, 19 Oct 2015, Andrew F. Davis wrote:
> >>>>On 10/19/2015 04:23 AM, Lee Jones wrote:
> >>>>>On Fri, 16 Oct 2015, Andrew F. Davis wrote:
> >>>>>
> >>>>>>Add support for the TPS65912 device. It provides communication
> >>>>>>through I2C and contains the following components:
> >>>>>>
> >>>>>>  - Regulators
> >>>>>>  - Load switches
> >>>>>>  - GPO controller
> >>>>>
> >>>>>What's a GPO controller?
> >>>>
> >>>>General Purpose Output, this controller only has output control, =
it's
> >>>>listed in the data-sheet this way, and other drivers have used th=
is term.
> >>>
> >>>Okay.
> >>>
> >>>>>>Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> >>>>>>---
> >>>>>>  drivers/mfd/Kconfig          |  13 ++++
> >>>>>>  drivers/mfd/Makefile         |   1 +
> >>>>>>  drivers/mfd/tps65086.c       | 145 ++++++++++++++++++++++++++=
+++++++++++++++++
> >>>>>>  include/linux/mfd/tps65086.h | 120 ++++++++++++++++++++++++++=
+++++++++
> >>>>>>  4 files changed, 279 insertions(+)
> >>>>>>  create mode 100644 drivers/mfd/tps65086.c
> >>>>>>  create mode 100644 include/linux/mfd/tps65086.h
> >>>>>>
> >>>>>>diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> >>>>>>index 99d6367..ab3b392 100644
> >>>>>>--- a/drivers/mfd/Kconfig
> >>>>>>+++ b/drivers/mfd/Kconfig
> >>>>>>@@ -1093,6 +1093,19 @@ config TPS6507X
> >>>>>>  	  This driver can also be built as a module.  If so, the mod=
ule
> >>>>>>  	  will be called tps6507x.
> >>>>>>
> >>>>>>+config MFD_TPS65086
> >>>>>>+	tristate "TI TPS65086x Power Management chips"
> >>>>>
> >>>>>Use the full name:
> >>>>>
> >>>>>   "TI TPS65086x Power Management Integrated Chips (PMICs)"
> >>>>>
> >>>>>>+	select REGMAP
> >>>>>>+	select REGMAP_IRQ
> >>>>>>+	select REGMAP_I2C
> >>>>>>+	depends on I2C
> >>>>>
> >>>>>REGMAP_I2C already depends on I2C.
> >>>>>
> >>>>
> >>>>So if I force REGMAP_I2C to =3Dy without depending on I2C then co=
uldn't
> >>>>REGMAP_I2C get selected without I2C enabled? Selecting doesn't fo=
rce
> >>>>the selected item's dependencies still right?
> >>>
> >>>Try it out. :)
> >>>
> >>
> >>OK, I just tried a little test and it did as I expected, I was able=
 to
> >>select a symbol and it did not enable its dependency, so this would
> >>break build. So, I'm still confused, why does REGMAP_I2C depending
> >>on I2C matter? What are you suggesting my Kconfig should look like?
> >
> >That's fine, if you've tested it and it's a problem the above will d=
o.
> >
> >I'm still little curious as to why it's necessary to depend on the
> >same symbols your dependencies depend on.
> >
>=20
> Because I don't 'depend' on REGMAP_I2C, I 'select' it. So none of its
> dependencies need be met, so I have to depend on them for REGMAP_I2C.
>=20
> 'Depending' on REGMAP_I2C would also be undesirable as my symbol woul=
d
> only be visible when REGMAP_I2C is =3Dy, this would obscure my symbol=
 as
> no one would know to turn on REGMAP_I2C to make my driver appear. I
> only need I2C and then I can go manually enable all my random helper
> symbols myself if I'm selected.

Right.  I understand the fundamentals of how Kconfig works, I guess I
just hoped it would be better in cases like this.

> >How far up the chain is it possible to go?
> >
> >config DEPA
> >
> >config DEPB
> >        select DEPA
> >
> >config DEPC
> >        select DEPB
> >        depends on DEPA
> >
> >config DEPD
> >        select DEPC
> >        depends on DEPA
> >        depends on DEPB
> >
> >config YOU
> >        select DEPD
> >        depends on DEPA
> >        depends on DEPB
> >        depends on DEPC
> >
> >Etc.
> >
>=20
> To me it seems like a fundamental issue with how the Kconfig system
> was originally designed (a quick check shows it existed in some form
> 20 years ago...) that leads to this kind of thing, if they knew how
> it would be used today they probably would have made it more
> directed-tree like, without the reverse dependencies and all.

Yes, perhaps.

> >>>>>>+	depends on OF || COMPILE_TEST
> >>>>>>+	help
> >>>>>>+	  If you say yes here you get support for the TPS65086 series=
 of
> >>>>>>+	  Power Management chips.
> >>>>>
> >>>>>I'd remove the line break.
> >>>>>
> >>>>>>+	  These include voltage regulators, GPO and other features
> >>>>>
> >>>>>GPIO?
> >>>>>
> >>>>>>+	  that are often used in portable devices.
> >>>>>
> >>>>>This is meant to be a 'help', so instead of staying "and some ot=
her
> >>>>>stuff", please list them.
> >>>>>
> >>>>
> >>>>This seems to be what other devices do, I'll change it to somethi=
ng
> >>>>else then.
> >>>
> >>>If you know what the "other features" are, it's best to name them.
> >>
> >>I was giving a generic description of a PMIC, I didn't really want =
to
> >>list all the features and start marketing the part in the Kconfig, =
unless
> >>you want, I'm sure TI won't mind the advertisement. :)
> >>
> >>I'm not sure why we write so much about these driver parts at all i=
n the
> >>help, people who need them know what they are, it's not like some c=
ore
> >>kernel config option that people might be undecided on and need exp=
lained
> >>its function.
> >
> >I'm sure when you've been trying to find answers to questions you've
> >found the help helpful (or maybe it was poorly underwritten and you
> >didn't find it useful at all).  Without the help, all these drivers
> >are just a selection of random letters, numbers and code/project
> >names.  It's the help which brings them to life, so to speak.
> >
>=20
> Well sure, they have been a lot of help for core config where I might
> not know what CONFIG_PERF_EVENTS means and a long explanation is nice=
,
> but I know what a TPS65086 is, if I didn't I wouldn't be trying to
> enable the driver for it.

That's a very single minded view.  The help isn't just for people
looking to enable drivers.  Think about the maintenance aspect and
people who are either just curious or wish to learn more.  The help
should be useful (helpful), rather than each of them saying "enable
this to add support for <enter crappy non-descriptive model number
here> and all of it's other features".

> >Please describe the device and what it provides.  No sales pitch
> >required.
> >
>=20
> I'll see what I can think up. "These include voltage regulators, GPIO
> and other features that are often used in portable devices." Really
> does give the gist of it for uninformed users who might want to know
> why this is enabled for their computer/board.

If there really are "other features" and you know what they are, then
list them.  If there aren't or *might be*, but you don't know what
they are just omit the phrase.  Saying "and some other stuff" is a
cop-out.

> Honestly I don't think the part actually does anything else, but sayi=
ng
> that when other similar parts add the "other features" line is kinda
> odd and might single out this part as looking less useful.

Ah ha!  Exactly my point.  So if it's fluff just remove it.

> >>>>>>  config TPS65911_COMPARATOR
> >>>>>>  	tristate
> >>>>>>
> >>>>>>diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> >>>>>>index a59e3fc..7adb902 100644
> >>>>>>--- a/drivers/mfd/Makefile
> >>>>>>+++ b/drivers/mfd/Makefile
> >>>>>>@@ -66,6 +66,7 @@ obj-$(CONFIG_MFD_WM8994)	+=3D wm8994-core.o w=
m8994-irq.o wm8994-regmap.o
> >>>>>>  obj-$(CONFIG_TPS6105X)		+=3D tps6105x.o
> >>>>>>  obj-$(CONFIG_TPS65010)		+=3D tps65010.o
> >>>>>>  obj-$(CONFIG_TPS6507X)		+=3D tps6507x.o
> >>>>>>+obj-$(CONFIG_MFD_TPS65086)	+=3D tps65086.o
> >>>>>>  obj-$(CONFIG_MFD_TPS65217)	+=3D tps65217.o
> >>>>>>  obj-$(CONFIG_MFD_TPS65218)	+=3D tps65218.o
> >>>>>>  obj-$(CONFIG_MFD_TPS65910)	+=3D tps65910.o
> >>>>>>diff --git a/drivers/mfd/tps65086.c b/drivers/mfd/tps65086.c
> >>>>>>new file mode 100644
> >>>>>>index 0000000..be6d678
> >>>>>>--- /dev/null
> >>>>>>+++ b/drivers/mfd/tps65086.c
> >>>>>>@@ -0,0 +1,145 @@
> >>>>>>+/*
> >>>>>>+ * Driver for TI TPS65086x PMICs
> >>>>>
> >>>>>I'd suggest removing the driver part.  We know it's a driver.
> >>>>
> >>>>Again this is what almost every other driver does,
> >>>
> >>>Almost every other driver.  That's some statement.
> >>>
> >>>I count 42%. ;)
> >>>
> >>
> >>I'm finding in drivers/mfd ~89% of drivers mention at some point th=
at
> >>they are a driver. But I do admit my original statement was based o=
n a
> >>quick monte carlo selection of a couple files. :)
> >
> >I'm sure many drivers, mention the word driver at one point.  Howeve=
r,
> >this is specifically regarding the file title/header.
> >
>=20
> Got it, just felt like hairsplitting :)
>=20
> >>>>I'm not sure how
> >>>>else to describe this file without using the word driver.
> >>>
> >>>Perhaps I'm getting picky in my old age, but I think I'd prefer to=
 see:
> >>>
> >>>   TI TPS65086x PMIC support
> >>>
> >>
> >>Still not sure this describes the file, maybe we could just drop th=
at
> >>line completely from files with an obvious purpose? Doesn't really =
bother
> >>me ether way.
> >
> >Sure.
> >
>=20
> ACK
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
