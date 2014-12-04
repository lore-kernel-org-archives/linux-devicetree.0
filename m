From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 00/11] memory: add Atmel EBI (External Bus Interface)
 driver
Date: Thu, 4 Dec 2014 11:35:58 +0100
Message-ID: <5480390E.5050408@atmel.com>
References: <1417639455-17410-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417639455-17410-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 03/12/2014 21:44, Boris Brezillon a =E9crit :
> The EBI (External Bus Interface) is used to access external periphera=
ls
> (NOR, SRAM, NAND, and other specific devices like ethernet controller=
s).
> Each device is assigned a CS line and an address range and can have i=
ts
> own configuration (timings, access mode, bus width, ...).
> This driver provides a generic DT binding to configure a device accor=
ding
> to its requirements.
> For specific device controllers (like the NAND one) the SMC timings
> should be configured by the controller driver through the matrix and
> smc syscon regmaps.
>=20
> The first 4 patches introduce 2 syscon devices needed to configure th=
e
> EBI bus, patch 5 and 6 adds support for the EBI bus, and the remainin=
g
> patches declares the EBI related nodes in sama5d3 dts[i] files.
>=20
> Changes since v4:
> - fix inconsistencies in SMC and MATRIX registers definition
> - add missing compatible strings for at91sam9rl SoC
> - fix DT bindings documentation
> - replace "atmel,generic-dev" property by "atmel,specialized-logic"
>=20
> Changes since v3:
> - added AT91_MATRIX_USBPUCR_PUON definition
> - removed useless macros (those directly returning SoC specific regis=
ter
>   offsets)
> - use syscon_regmap_lookup_by_phandle instead of of_parse_phandle +
>   syscon_node_to_regmap
> - drop AT91_EBICSA_REGFIELD and AT91_MULTI_EBICSA_REGFIELD macros
>=20
> Changes since v2:
> - minor fixes int DT bindings doc
> - fix SMC macros
> - make use of SMC macros defined in include/linux/mfd/syscon/atmel-sm=
c.h
>=20
> Changes since v1:
> - almost everything :-)
>=20
> Boris Brezillon (11):
>   mfd: syscon: Add atmel-matrix registers definition
>   mfd: syscon: Add Atmel Matrix bus DT binding documentation
>   mfd: syscon: Add atmel-smc registers definition
>   mfd: syscon: Add Atmel SMC binding doc
>   memory: add Atmel EBI (External Bus Interface) driver
>   memory: atmel-ebi: add DT bindings documentation
>   ARM: at91: select ATMEL_EBI when compiling a kernel for at91sam9 or
>     sama5d3
>   ARM: at91/dt: add HSMC (Static Memory Controller) node in sama5d3 d=
tsi
>   ARM: at91/dt: add matrix node in sama5d3 dtsi
>   ARM: at91/dt: add EBI (External Bus Interface) node in sama5d3 dtsi
>   ARM: at91/dt: add NOR definition in sama5d3xcm dtsi

The whole series seems okay.

If you reorder the content of the patches as noted, you can add my:
Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Thanks bye.

>  .../bindings/memory-controllers/atmel-ebi.txt      | 155 ++++++
>  .../devicetree/bindings/mfd/atmel-matrix.txt       |  24 +
>  .../devicetree/bindings/mfd/atmel-smc.txt          |  19 +
>  arch/arm/boot/dts/sama5d3.dtsi                     |  93 ++++
>  arch/arm/boot/dts/sama5d3xcm.dtsi                  |  33 ++
>  arch/arm/mach-at91/Kconfig                         |   2 +
>  drivers/memory/Kconfig                             |  11 +
>  drivers/memory/Makefile                            |   1 +
>  drivers/memory/atmel-ebi.c                         | 579 +++++++++++=
++++++++++
>  include/linux/mfd/syscon/atmel-matrix.h            | 117 +++++
>  include/linux/mfd/syscon/atmel-smc.h               | 173 ++++++
>  11 files changed, 1207 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controll=
ers/atmel-ebi.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-matri=
x.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-smc.t=
xt
>  create mode 100644 drivers/memory/atmel-ebi.c
>  create mode 100644 include/linux/mfd/syscon/atmel-matrix.h
>  create mode 100644 include/linux/mfd/syscon/atmel-smc.h
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
