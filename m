From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v1 00/11] MIPS: ath79: move towards proper OF support
Date: Wed, 23 Jan 2019 01:33:53 +0000
Message-ID: <CY4PR2201MB1272251B8C9F4235284FFB4AC1990@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20190111142240.10908-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111142240.10908-1-o.rempel@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Paul Burton <pburton@wavecomp.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

Oleksij Rempel wrote:
> This patches are take from OpenWRT, rebased and tested with kernel
> v5.0-rt1 on DPTechnics DPT-Module (Atheros AR9331) by me.
>=20
> Since one dt-bindings header is touched, I added DT maintainers to the
> TO/CC.
>=20
> Felix Fietkau (6):
> MIPS: ath79: add helpers for setting clocks and expose the ref clock
> MIPS: ath79: move legacy "wdt" and "uart" clock aliases out of soc
> init
> MIPS: ath79: pass PLL base to clock init functions
> MIPS: ath79: make specifying the reference clock in DT optional
> MIPS: ath79: support setting up clock via DT on all SoC types
> MIPS: ath79: export switch MDIO reference clock
>=20
> John Crispin (5):
> MIPS: ath79: drop legacy IRQ code
> MIPS: ath79: drop machfiles
> MIPS: ath79: drop legacy pci code
> MIPS: ath79: drop platform device registration code
> MIPS: ath79: drop !OF clock code
>=20
> arch/mips/Kconfig                        |   1 -
> arch/mips/ath79/Kconfig                  |  73 -----
> arch/mips/ath79/Makefile                 |  23 +-
> arch/mips/ath79/clock.c                  | 342 ++++++++++-------------
> arch/mips/ath79/common.h                 |   5 -
> arch/mips/ath79/dev-common.c             | 159 -----------
> arch/mips/ath79/dev-common.h             |  18 --
> arch/mips/ath79/dev-gpio-buttons.c       |  56 ----
> arch/mips/ath79/dev-gpio-buttons.h       |  23 --
> arch/mips/ath79/dev-leds-gpio.c          |  54 ----
> arch/mips/ath79/dev-leds-gpio.h          |  21 --
> arch/mips/ath79/dev-spi.c                |  38 ---
> arch/mips/ath79/dev-spi.h                |  22 --
> arch/mips/ath79/dev-usb.c                | 242 ----------------
> arch/mips/ath79/dev-usb.h                |  17 --
> arch/mips/ath79/dev-wmac.c               | 155 ----------
> arch/mips/ath79/dev-wmac.h               |  17 --
> arch/mips/ath79/irq.c                    | 169 -----------
> arch/mips/ath79/mach-ap121.c             |  92 ------
> arch/mips/ath79/mach-ap136.c             | 156 -----------
> arch/mips/ath79/mach-ap81.c              | 100 -------
> arch/mips/ath79/mach-db120.c             | 136 ---------
> arch/mips/ath79/mach-pb44.c              | 128 ---------
> arch/mips/ath79/mach-ubnt-xm.c           | 126 ---------
> arch/mips/ath79/machtypes.h              |  28 --
> arch/mips/ath79/pci.c                    | 273 ------------------
> arch/mips/ath79/pci.h                    |  35 ---
> arch/mips/ath79/setup.c                  |  78 +-----
> arch/mips/include/asm/mach-ath79/ath79.h |   4 -
> arch/mips/pci/Makefile                   |   1 +
> arch/mips/pci/fixup-ath79.c              |  21 ++
> include/dt-bindings/clock/ath79-clk.h    |   4 +-
> 32 files changed, 185 insertions(+), 2432 deletions(-)
> delete mode 100644 arch/mips/ath79/dev-common.c
> delete mode 100644 arch/mips/ath79/dev-common.h
> delete mode 100644 arch/mips/ath79/dev-gpio-buttons.c
> delete mode 100644 arch/mips/ath79/dev-gpio-buttons.h
> delete mode 100644 arch/mips/ath79/dev-leds-gpio.c
> delete mode 100644 arch/mips/ath79/dev-leds-gpio.h
> delete mode 100644 arch/mips/ath79/dev-spi.c
> delete mode 100644 arch/mips/ath79/dev-spi.h
> delete mode 100644 arch/mips/ath79/dev-usb.c
> delete mode 100644 arch/mips/ath79/dev-usb.h
> delete mode 100644 arch/mips/ath79/dev-wmac.c
> delete mode 100644 arch/mips/ath79/dev-wmac.h
> delete mode 100644 arch/mips/ath79/irq.c
> delete mode 100644 arch/mips/ath79/mach-ap121.c
> delete mode 100644 arch/mips/ath79/mach-ap136.c
> delete mode 100644 arch/mips/ath79/mach-ap81.c
> delete mode 100644 arch/mips/ath79/mach-db120.c
> delete mode 100644 arch/mips/ath79/mach-pb44.c
> delete mode 100644 arch/mips/ath79/mach-ubnt-xm.c
> delete mode 100644 arch/mips/ath79/machtypes.h
> delete mode 100644 arch/mips/ath79/pci.c
> delete mode 100644 arch/mips/ath79/pci.h
> create mode 100644 arch/mips/pci/fixup-ath79.c

Series applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
