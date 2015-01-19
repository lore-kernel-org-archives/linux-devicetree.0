From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v5 00/11] memory: add Atmel EBI (External Bus Interface)
 driver
Date: Mon, 19 Jan 2015 01:40:15 +0100
Message-ID: <20150119004015.GC5014@piout.net>
References: <1417639455-17410-1-git-send-email-boris.brezillon@free-electrons.com>
 <20150113085027.GA3843@piout.net>
 <20150118125117.GV3574@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150118125117.GV3574@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Andrew Victor <linux@maxim.org.za>, Samuel Ortiz <sameo@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 18/01/2015 at 12:51:17 +0000, Lee Jones wrote :
> Sorry for the delay, I have been on vacation.
>=20
> I'm not sure why why those patches are preventing the application of
> the remainder of the set.  They are only documentation entries and I
> have Acked them already?
>=20

We had some series depending on the new syscon headers introduced by
those patches.

Indeed, at the time I wrote that email, I forgot you acked them. As
=46elipe Balbi wanted to ensure that the dependency would be handled
correctly, we asked Nicolas to take those patches (as I explained in on=
e
of my mails).

> > On 03/12/2014 at 21:44:04 +0100, Boris Brezillon wrote :
> > > The EBI (External Bus Interface) is used to access external perip=
herals
> > > (NOR, SRAM, NAND, and other specific devices like ethernet contro=
llers).
> > > Each device is assigned a CS line and an address range and can ha=
ve its
> > > own configuration (timings, access mode, bus width, ...).
> > > This driver provides a generic DT binding to configure a device a=
ccording
> > > to its requirements.
> > > For specific device controllers (like the NAND one) the SMC timin=
gs
> > > should be configured by the controller driver through the matrix =
and
> > > smc syscon regmaps.
> > >=20
> > > The first 4 patches introduce 2 syscon devices needed to configur=
e the
> > > EBI bus, patch 5 and 6 adds support for the EBI bus, and the rema=
ining
> > > patches declares the EBI related nodes in sama5d3 dts[i] files.
> > >=20
> > > Changes since v4:
> > > - fix inconsistencies in SMC and MATRIX registers definition
> > > - add missing compatible strings for at91sam9rl SoC
> > > - fix DT bindings documentation
> > > - replace "atmel,generic-dev" property by "atmel,specialized-logi=
c"
> > >=20
> > > Changes since v3:
> > > - added AT91_MATRIX_USBPUCR_PUON definition
> > > - removed useless macros (those directly returning SoC specific r=
egister
> > >   offsets)
> > > - use syscon_regmap_lookup_by_phandle instead of of_parse_phandle=
 +
> > >   syscon_node_to_regmap
> > > - drop AT91_EBICSA_REGFIELD and AT91_MULTI_EBICSA_REGFIELD macros
> > >=20
> > > Changes since v2:
> > > - minor fixes int DT bindings doc
> > > - fix SMC macros
> > > - make use of SMC macros defined in include/linux/mfd/syscon/atme=
l-smc.h
> > >=20
> > > Changes since v1:
> > > - almost everything :-)
> > >=20
> > > Boris Brezillon (11):
> > >   mfd: syscon: Add atmel-matrix registers definition
> > >   mfd: syscon: Add Atmel Matrix bus DT binding documentation
> > >   mfd: syscon: Add atmel-smc registers definition
> > >   mfd: syscon: Add Atmel SMC binding doc
> > >   memory: add Atmel EBI (External Bus Interface) driver
> > >   memory: atmel-ebi: add DT bindings documentation
> > >   ARM: at91: select ATMEL_EBI when compiling a kernel for at91sam=
9 or
> > >     sama5d3
> > >   ARM: at91/dt: add HSMC (Static Memory Controller) node in sama5=
d3 dtsi
> > >   ARM: at91/dt: add matrix node in sama5d3 dtsi
> > >   ARM: at91/dt: add EBI (External Bus Interface) node in sama5d3 =
dtsi
> > >   ARM: at91/dt: add NOR definition in sama5d3xcm dtsi
> > >=20
> > >  .../bindings/memory-controllers/atmel-ebi.txt      | 155 ++++++
> > >  .../devicetree/bindings/mfd/atmel-matrix.txt       |  24 +
> > >  .../devicetree/bindings/mfd/atmel-smc.txt          |  19 +
> > >  arch/arm/boot/dts/sama5d3.dtsi                     |  93 ++++
> > >  arch/arm/boot/dts/sama5d3xcm.dtsi                  |  33 ++
> > >  arch/arm/mach-at91/Kconfig                         |   2 +
> > >  drivers/memory/Kconfig                             |  11 +
> > >  drivers/memory/Makefile                            |   1 +
> > >  drivers/memory/atmel-ebi.c                         | 579 +++++++=
++++++++++++++
> > >  include/linux/mfd/syscon/atmel-matrix.h            | 117 +++++
> > >  include/linux/mfd/syscon/atmel-smc.h               | 173 ++++++
> > >  11 files changed, 1207 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/memory-cont=
rollers/atmel-ebi.txt
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-m=
atrix.txt
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-s=
mc.txt
> > >  create mode 100644 drivers/memory/atmel-ebi.c
> > >  create mode 100644 include/linux/mfd/syscon/atmel-matrix.h
> > >  create mode 100644 include/linux/mfd/syscon/atmel-smc.h
> > >=20
> >=20
>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
