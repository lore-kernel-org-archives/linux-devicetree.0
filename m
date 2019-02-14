From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 0/8] add power management support for SAM9X60
Date: Thu, 14 Feb 2019 15:54:26 +0000
Message-ID: <1550159642-26878-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com, linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Hi,

This series add power management support for SAM9X60. The following
platform specific power management modes were enabled for it:
Idle, ULP0 and ULP1.

Thank you,
Claudiu Beznea

Claudiu Beznea (8):
  ARM: at91: pm: introduce at91_soc_pm structure
  dt-bindings: arm: atmel: add binding for SAM9X60 SoC
  ARM: at91: pm: initial PM support for SAM9X60
  ARM: at91: pm: keep at91_pm_backup_init() only for SAMA5D2 SoCs
  ARM: at91: pm: add support for per SoC wakeup source configuration
  ARM: at91: pm: add ULP1 support for SAM9X60
  ARM: at91: pm: disable RC oscillator in ULP0
  ARM: at91: pm: do not disable/enable PLLA for ULP modes

 .../devicetree/bindings/arm/atmel-at91.txt         |   1 +
 arch/arm/mach-at91/at91sam9.c                      |  18 ++
 arch/arm/mach-at91/generic.h                       |   2 +
 arch/arm/mach-at91/pm.c                            | 193 ++++++++++++++---=
----
 arch/arm/mach-at91/pm_suspend.S                    | 111 ++++++++----
 include/linux/clk/at91_pmc.h                       |   1 +
 6 files changed, 232 insertions(+), 94 deletions(-)

--=20
2.7.4
