From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 0/2] add PM functionality for act8945
Date: Fri, 26 Oct 2018 16:19:45 +0000
Message-ID: <1540570753-16370-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

This series implements PM functionality for act8945 and use that support
on sama5d2_xplained board.

Boris Brezillon (2):
  regulator: act8945: Implement PM functionalities
  ARM: dts: at91: sama5d2_xplained: Add proper regulator states for
    suspend-to-mem

 arch/arm/boot/dts/at91-sama5d2_xplained.dts |  33 +++++
 drivers/regulator/act8945a-regulator.c      | 195 ++++++++++++++++++++++++=
+++-
 2 files changed, 226 insertions(+), 2 deletions(-)

--=20
2.7.4
