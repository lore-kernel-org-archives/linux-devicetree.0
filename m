From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v7 0/9] EDAC drivers for Armada XP L2 and DDR
Date: Thu, 22 Nov 2018 13:11:33 +1300
Message-ID: <20181122001142.19187-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, bp@alien8.de, arnd@arndb.de, jlu@pengutronix.de, gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

The current plan is for these to go in via the ARM tree once appropriate
Reviews/Acks have been given

http://lists.infradead.org/pipermail/linux-arm-kernel/2017-August/525561.=
html

This series adds drivers for the L2 cache and DDR RAM ECC functionality a=
s
found on the MV78230/MV78x60 SoCs. Jan has tested these changes with the
MV78460 (on a custom board with a DDR3 ECC DIMM), Chris has tested these
changes with 88F6820 and 98dx3236 (both a custom boards with fixed DDR3 +=
=20ECC).

Also contained in this series is an additional debugfs wrapper.

Compared to the previous v6 series I've dropped the marvell,ecc-disable
property.

Compared to the previous v5 series I've split the dt-binding documentatio=
n into
its own patch and updated armada_xp_edac.c to use a SPDX license.

Compared to the previous v4 series I've added my s-o-b to some of Jan's
patches and rebased against v4.19.0.

Compared to the previous v3 series, the following changes have been made:=

- Use shorter names for the AURORA ECC and parity registers
- Numerous formatting changes to edac/armada_xp.c (as requested by Boris)=

- Added support for Armada-38x and 98dx3236 SoCs

Compared to the previous v2 series, the following changes have been made:=

- Allocate EDAC structures later during probing and drop devres support
=20 patches (requested by Boris)
- Make drvdata->width usage consistent according to the comment (suggeste=
d by
=20 Chris)

Compared to the previous v1 series, the following changes have been made:=

- Add the aurora-l2 register defines earlier in the series (suggested by
=20 Russell King and Gregory CLEMENT )
- Changed the DT vendor prefix from "arm" to "marvell" for the ecc-enable=
/disable
=20 properties on the aurora-l2 (suggested by Russell King)
- Fix some warnings reported by checkpatch

Compared to the original RFC series, the following changes have been made=
:
- Integrated Chris' patches for parity and ECC configuration via DT
- Merged the DDR RAM and L2 cache drivers (as requested by Boris, analogo=
us
=20 to fsl_ddr_edac.c and mpc85xx_edac.c)
- Added myself to MAINTAINERS (requested by Boris)
- L2 cache: Track the msg size and use snprintf (review comment by Chris)=

- L2 cache: Split error injection from the check function (review comment=
=20by
=20 Chris)
- DDR RAM: Allow 16 bit width in addition to 32 and 64 bit (review commen=
t by
=20 Chris)
- Use of_match_ptr() (review comments by Chris)
- Minor checkpatch cleanups

Chris Packham (4):
=20 ARM: l2x0: support parity-enable/disable on aurora
=20 dt-bindings: ARM: document marvell,ecc-enable binding
=20 ARM: l2x0: add marvell,ecc-enable property for aurora
=20 EDAC: armada_xp: Add support for more SoCs

Jan Luebbe (5):
=20 ARM: l2c: move cache-aurora-l2.h to asm/hardware
=20 ARM: aurora-l2: add prefix to MAX_RANGE_SIZE
=20 ARM: aurora-l2: add defines for parity and ECC registers
=20 EDAC: Add missing debugfs_create_x32 wrapper
=20 EDAC: Add driver for the Marvell Armada XP SDRAM and L2 cache ECC

=20.../devicetree/bindings/arm/l2c2x0.txt        |   1 +
=20MAINTAINERS                                   |   6 +
=20.../asm/hardware}/cache-aurora-l2.h           |  50 +-
=20arch/arm/mm/cache-l2x0.c                      |  18 +-
=20drivers/edac/Kconfig                          |   7 +
=20drivers/edac/Makefile                         |   1 +
=20drivers/edac/armada_xp_edac.c                 | 635 ++++++++++++++++++=

=20drivers/edac/debugfs.c                        |  11 +
=20drivers/edac/edac_module.h                    |   5 +
=209 files changed, 730 insertions(+), 4 deletions(-)
=20rename arch/arm/{mm =3D> include/asm/hardware}/cache-aurora-l2.h (50%)=

=20create mode 100644 drivers/edac/armada_xp_edac.c

--=20
2.19.1
