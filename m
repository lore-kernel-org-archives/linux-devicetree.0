From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 0/2] add Microchip PIT64B timer
Date: Thu, 14 Mar 2019 16:26:30 +0000
Message-ID: <1552580772-8499-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com, daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Hi,

This series adds driver for Microchip PIT64B timer.
Timer could be used in continuous or oneshot mode. It has 2x32 bit register=
s
to emulate a 64 bit timer. The timer's period could be configured via LSB_P=
R
and MSB_PR registers. The current timer's value could be checked via TLSB a=
nd
TMSB registers. When (TMSB << 32) | TLSB value reach the (MSB_PR << 32) | L=
SB_PR
interrupt is raised. If in contiuous mode the TLSB and TMSB resets and rest=
art
counting.

This drivers uses PIT64B capabilities for clocksource and clockevent.
The first requested PIT64B timer is used for clockevent. The second one is =
used
for clocksource. Individual PIT64B hardware resources were used for clockso=
urce
and clockevent to be able to support high resolution timers with this PIT64=
B
implementation.

Thank you,
Claudiu Beznea

Claudiu Beznea (2):
  dt-bindings: arm: atmel: add bindings for PIT64B
  clocksource/drivers/timer-microchip-pit64b: add Microchip PIT64B
    support

 .../devicetree/bindings/arm/atmel-sysregs.txt      |   7 +
 drivers/clocksource/Kconfig                        |   6 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-microchip-pit64b.c       | 469 +++++++++++++++++=
++++
 4 files changed, 483 insertions(+)
 create mode 100644 drivers/clocksource/timer-microchip-pit64b.c

--=20
2.7.4
