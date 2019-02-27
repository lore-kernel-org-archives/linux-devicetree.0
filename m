From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v7 0/9] EDAC drivers for Armada XP L2 and DDR
Date: Wed, 27 Feb 2019 20:05:45 +0000
Message-ID: <ddd4d4738bf2484e8d13e6bc59cec6d8@svr-chch-ex1.atlnz.lc>
References: <20181122001142.19187-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "bp@alien8.de" <bp@alien8.de>, "arnd@arndb.de" <arnd@arndb.de>, "jlu@pengutronix.de" <jlu@pengutronix.de>, "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Borislav, Russell,=0A=
=0A=
This seems to have fallen off the radar. Is there anything stopping this =
=0A=
series from being merged?=0A=
=0A=
On 22/11/18 1:12 PM, Chris Packham wrote:=0A=
> The current plan is for these to go in via the ARM tree once appropriate=
=0A=
> Reviews/Acks have been given=0A=
> =0A=
> http://lists.infradead.org/pipermail/linux-arm-kernel/2017-August/525561.=
html=0A=
> =0A=
> This series adds drivers for the L2 cache and DDR RAM ECC functionality a=
s=0A=
> found on the MV78230/MV78x60 SoCs. Jan has tested these changes with the=
=0A=
> MV78460 (on a custom board with a DDR3 ECC DIMM), Chris has tested these=
=0A=
> changes with 88F6820 and 98dx3236 (both a custom boards with fixed DDR3 +=
 ECC).=0A=
> =0A=
> Also contained in this series is an additional debugfs wrapper.=0A=
> =0A=
> Compared to the previous v6 series I've dropped the marvell,ecc-disable=
=0A=
> property.=0A=
> =0A=
> Compared to the previous v5 series I've split the dt-binding documentatio=
n into=0A=
> its own patch and updated armada_xp_edac.c to use a SPDX license.=0A=
> =0A=
> Compared to the previous v4 series I've added my s-o-b to some of Jan's=
=0A=
> patches and rebased against v4.19.0.=0A=
> =0A=
> Compared to the previous v3 series, the following changes have been made:=
=0A=
> - Use shorter names for the AURORA ECC and parity registers=0A=
> - Numerous formatting changes to edac/armada_xp.c (as requested by Boris)=
=0A=
> - Added support for Armada-38x and 98dx3236 SoCs=0A=
> =0A=
> Compared to the previous v2 series, the following changes have been made:=
=0A=
> - Allocate EDAC structures later during probing and drop devres support=
=0A=
>    patches (requested by Boris)=0A=
> - Make drvdata->width usage consistent according to the comment (suggeste=
d by=0A=
>    Chris)=0A=
> =0A=
> Compared to the previous v1 series, the following changes have been made:=
=0A=
> - Add the aurora-l2 register defines earlier in the series (suggested by=
=0A=
>    Russell King and Gregory CLEMENT )=0A=
> - Changed the DT vendor prefix from "arm" to "marvell" for the ecc-enable=
/disable=0A=
>    properties on the aurora-l2 (suggested by Russell King)=0A=
> - Fix some warnings reported by checkpatch=0A=
> =0A=
> Compared to the original RFC series, the following changes have been made=
:=0A=
> - Integrated Chris' patches for parity and ECC configuration via DT=0A=
> - Merged the DDR RAM and L2 cache drivers (as requested by Boris, analogo=
us=0A=
>    to fsl_ddr_edac.c and mpc85xx_edac.c)=0A=
> - Added myself to MAINTAINERS (requested by Boris)=0A=
> - L2 cache: Track the msg size and use snprintf (review comment by Chris)=
=0A=
> - L2 cache: Split error injection from the check function (review comment=
 by=0A=
>    Chris)=0A=
> - DDR RAM: Allow 16 bit width in addition to 32 and 64 bit (review commen=
t by=0A=
>    Chris)=0A=
> - Use of_match_ptr() (review comments by Chris)=0A=
> - Minor checkpatch cleanups=0A=
> =0A=
> Chris Packham (4):=0A=
>    ARM: l2x0: support parity-enable/disable on aurora=0A=
>    dt-bindings: ARM: document marvell,ecc-enable binding=0A=
>    ARM: l2x0: add marvell,ecc-enable property for aurora=0A=
>    EDAC: armada_xp: Add support for more SoCs=0A=
> =0A=
> Jan Luebbe (5):=0A=
>    ARM: l2c: move cache-aurora-l2.h to asm/hardware=0A=
>    ARM: aurora-l2: add prefix to MAX_RANGE_SIZE=0A=
>    ARM: aurora-l2: add defines for parity and ECC registers=0A=
>    EDAC: Add missing debugfs_create_x32 wrapper=0A=
>    EDAC: Add driver for the Marvell Armada XP SDRAM and L2 cache ECC=0A=
> =0A=
>   .../devicetree/bindings/arm/l2c2x0.txt        |   1 +=0A=
>   MAINTAINERS                                   |   6 +=0A=
>   .../asm/hardware}/cache-aurora-l2.h           |  50 +-=0A=
>   arch/arm/mm/cache-l2x0.c                      |  18 +-=0A=
>   drivers/edac/Kconfig                          |   7 +=0A=
>   drivers/edac/Makefile                         |   1 +=0A=
>   drivers/edac/armada_xp_edac.c                 | 635 ++++++++++++++++++=
=0A=
>   drivers/edac/debugfs.c                        |  11 +=0A=
>   drivers/edac/edac_module.h                    |   5 +=0A=
>   9 files changed, 730 insertions(+), 4 deletions(-)=0A=
>   rename arch/arm/{mm =3D> include/asm/hardware}/cache-aurora-l2.h (50%)=
=0A=
>   create mode 100644 drivers/edac/armada_xp_edac.c=0A=
> =0A=
=0A=
