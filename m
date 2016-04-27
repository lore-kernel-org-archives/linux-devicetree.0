From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V10 2/6] mfd: max77620: add core driver for
 MAX77620/MAX20024
Date: Wed, 27 Apr 2016 16:29:37 +0100
Message-ID: <20160427152937.GE4892@dell>
References: <1459348188-11726-1-git-send-email-ldewangan@nvidia.com>
 <1459348188-11726-3-git-send-email-ldewangan@nvidia.com>
 <20160427150559.GD4176@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160427150559.GD4176@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Apr 2016, Thierry Reding wrote:

> On Wed, Mar 30, 2016 at 07:59:44PM +0530, Laxman Dewangan wrote:
> > MAX77620/MAX20024 are Power Management IC from the MAXIM.
> > It supports RTC, multiple GPIOs, multiple DCDC and LDOs,
> > watchdog, clock etc.
> >=20
> > Add MFD drier to provides common support for accessing the
> > device; additional drivers is developed on respected subsystem
> > in order to use the functionality of the device.
> >=20
> > Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> > Signed-off-by: Mallikarjun Kasoju <mkasoju@nvidia.com>
> > Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >=20
> > ---
> > Changes from V1:
> > - Code cleanups per review from V1.
> > - Move register acccess APIs from header to c file.
> > - Remove some of non required variable, remove duplication in error=
 message
> >  and simplify some of function implementation.
> > - Register RTC driver such that it can get the regmap handle form p=
arent device
> >=20
> > Changes from V2:
> > - Run coccicheck and checkpatch in strict mode for the alignment.
> > - Drop RTC driver and its i2c client registration.
> >=20
> > Changes from V3:
> > - Change all sys initcall to module driver.
> > - change the max77620_read argument to unisgned int from u8.
> >=20
> > Changes from V4:
> > - Take care of fps nodes.
> > - Drop the battery charger and low battery binding and related code=
 as
> >   it need to go on power driver.
> >=20
> > Changes from V5:
> > -None
> >=20
> > Changes from V6:
> > - Taken care of Lee's comment like used defines for irqs, remove ma=
x77620
> >   register accesss abstractions, remove DTof module and use ID tabl=
e only,
> >   reduce the copyright lines.
> > - Drop configuration for hard power off time chnage as it will be i=
n
> >   power driver.
> > - Use direct regmap from all drivers instead of using abstractions.
> > - This depends on patch
> >=20
> > Change from V7:
> > - Use MFD defines for making mfd cells.
> > - Use new property name.
> >=20
> > Changes from V8:
> > - Remove the usage of MFD defines. Remove mutex_config as not neede=
d.
> >=20
> > Changes from V9:
> > - Use the devm_regmap_add_irq_chip() for irq registration.
> >=20
> >  drivers/mfd/Kconfig          |  15 ++
> >  drivers/mfd/Makefile         |   1 +
> >  drivers/mfd/max77620.c       | 544 +++++++++++++++++++++++++++++++=
++++++++++++
> >  include/linux/mfd/max77620.h | 337 +++++++++++++++++++++++++++
> >  4 files changed, 897 insertions(+)
> >  create mode 100644 drivers/mfd/max77620.c
> >  create mode 100644 include/linux/mfd/max77620.h
>=20
> Lee,
>=20
> Were you going to pick this up along with the corresponding DT bindin=
gs?

I will, once I'm happy with the driver.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
