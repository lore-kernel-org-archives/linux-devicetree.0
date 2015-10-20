From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/4] mfd: tps65086: Add driver for the TPS65086 PMIC
Date: Tue, 20 Oct 2015 11:02:14 +0100
Message-ID: <20151020100214.GM31804@x1>
References: <1445014753-15450-1-git-send-email-afd@ti.com>
 <1445014753-15450-3-git-send-email-afd@ti.com>
 <20151019092336.GI31804@x1>
 <56251468.7030609@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56251468.7030609@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Brown <broonie@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 19 Oct 2015, Andrew F. Davis wrote:
> On 10/19/2015 04:23 AM, Lee Jones wrote:
> >On Fri, 16 Oct 2015, Andrew F. Davis wrote:
> >
> >>Add support for the TPS65912 device. It provides communication
> >>through I2C and contains the following components:
> >>
> >>  - Regulators
> >>  - Load switches
> >>  - GPO controller
> >
> >What's a GPO controller?
>=20
> General Purpose Output, this controller only has output control, it's
> listed in the data-sheet this way, and other drivers have used this t=
erm.

Okay.

> >>Signed-off-by: Andrew F. Davis <afd@ti.com>
> >>---
> >>  drivers/mfd/Kconfig          |  13 ++++
> >>  drivers/mfd/Makefile         |   1 +
> >>  drivers/mfd/tps65086.c       | 145 ++++++++++++++++++++++++++++++=
+++++++++++++
> >>  include/linux/mfd/tps65086.h | 120 ++++++++++++++++++++++++++++++=
+++++
> >>  4 files changed, 279 insertions(+)
> >>  create mode 100644 drivers/mfd/tps65086.c
> >>  create mode 100644 include/linux/mfd/tps65086.h
> >>
> >>diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> >>index 99d6367..ab3b392 100644
> >>--- a/drivers/mfd/Kconfig
> >>+++ b/drivers/mfd/Kconfig
> >>@@ -1093,6 +1093,19 @@ config TPS6507X
> >>  	  This driver can also be built as a module.  If so, the module
> >>  	  will be called tps6507x.
> >>
> >>+config MFD_TPS65086
> >>+	tristate "TI TPS65086x Power Management chips"
> >
> >Use the full name:
> >
> >   "TI TPS65086x Power Management Integrated Chips (PMICs)"
> >
> >>+	select REGMAP
> >>+	select REGMAP_IRQ
> >>+	select REGMAP_I2C
> >>+	depends on I2C
> >
> >REGMAP_I2C already depends on I2C.
> >
>=20
> So if I force REGMAP_I2C to =3Dy without depending on I2C then couldn=
't
> REGMAP_I2C get selected without I2C enabled? Selecting doesn't force
> the selected item's dependencies still right?

Try it out. :)

> >>+	depends on OF || COMPILE_TEST
> >>+	help
> >>+	  If you say yes here you get support for the TPS65086 series of
> >>+	  Power Management chips.
> >
> >I'd remove the line break.
> >
> >>+	  These include voltage regulators, GPO and other features
> >
> >GPIO?
> >
> >>+	  that are often used in portable devices.
> >
> >This is meant to be a 'help', so instead of staying "and some other
> >stuff", please list them.
> >
>=20
> This seems to be what other devices do, I'll change it to something
> else then.

If you know what the "other features" are, it's best to name them.

> >>  config TPS65911_COMPARATOR
> >>  	tristate
> >>
> >>diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> >>index a59e3fc..7adb902 100644
> >>--- a/drivers/mfd/Makefile
> >>+++ b/drivers/mfd/Makefile
> >>@@ -66,6 +66,7 @@ obj-$(CONFIG_MFD_WM8994)	+=3D wm8994-core.o wm899=
4-irq.o wm8994-regmap.o
> >>  obj-$(CONFIG_TPS6105X)		+=3D tps6105x.o
> >>  obj-$(CONFIG_TPS65010)		+=3D tps65010.o
> >>  obj-$(CONFIG_TPS6507X)		+=3D tps6507x.o
> >>+obj-$(CONFIG_MFD_TPS65086)	+=3D tps65086.o
> >>  obj-$(CONFIG_MFD_TPS65217)	+=3D tps65217.o
> >>  obj-$(CONFIG_MFD_TPS65218)	+=3D tps65218.o
> >>  obj-$(CONFIG_MFD_TPS65910)	+=3D tps65910.o
> >>diff --git a/drivers/mfd/tps65086.c b/drivers/mfd/tps65086.c
> >>new file mode 100644
> >>index 0000000..be6d678
> >>--- /dev/null
> >>+++ b/drivers/mfd/tps65086.c
> >>@@ -0,0 +1,145 @@
> >>+/*
> >>+ * Driver for TI TPS65086x PMICs
> >
> >I'd suggest removing the driver part.  We know it's a driver.
>=20
> Again this is what almost every other driver does,

Almost every other driver.  That's some statement.

I count 42%. ;)

> I'm not sure how
> else to describe this file without using the word driver.

Perhaps I'm getting picky in my old age, but I think I'd prefer to see:

  TI TPS65086x PMIC support

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
