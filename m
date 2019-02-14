From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 0/2] add slow clock support for SAM9X60
Date: Thu, 14 Feb 2019 10:39:36 +0000
Message-ID: <1550140748-21714-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Hi,

This series add slow clock support for SAM9X60. Apart from previous IPs, th=
is
one uses different offsets in control register for different functionalitie=
s.
The series adapt current driver to work for all IPs using per IP
configurations initialized at probe.

Thank you,
Claudiu Beznea

Claudiu Beznea (2):
  clk: at91: sckc: adapt sckc driver to work for SAM9X60
  dt-bindings: clk: at91: add bindings for SAM9X60's slow clock
    controller

 .../devicetree/bindings/clock/at91-clock.txt       |   3 +-
 drivers/clk/at91/sckc.c                            | 142 ++++++++++++++++-=
----
 2 files changed, 109 insertions(+), 36 deletions(-)

--=20
2.7.4
