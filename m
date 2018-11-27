From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH v2 0/5] add PM functionality for act8945a PMIC
Date: Tue, 27 Nov 2018 11:57:06 +0000
Message-ID: <1543319801-19100-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

This series implements PM functionality for act8945a PMIC and use that supp=
ort
on SAMA5D2 Xplained board.

Changes in v2:
- split patch 1/1 from previous series in 3 patches: one adding regmap,
  one adding pm functionality, one adding shutdown functionality
- use dev_pm_ops suspend function to set register specific to PWRHLD line: =
this
  is specific to PMIC itself and not to regulators
- add mode support for LDOs
- add constants for mode in dt-bindings/regulator/active-semi,8945a-regulat=
or.h
- document modes and regulator suspend states
- remove rdevs from struct act8945a_pmic since were not used anywhere
- add op_mode field in struct act8945a_pmic, update it when setting mode an=
d
  return it when reading mode (avoiding one extra register read while
  reading mode)
- add a patch to fix a checkpatch.pl warning
- in shutdown function use directly act8945a->regmap instead of an intermed=
iary
  struct regmap variable

Boris Brezillon (2):
  regulator: act8945a-regulator: Implement PM functionalities
  ARM: dts: at91: sama5d2_xplained: Add proper regulator states for
    suspend-to-mem

Claudiu Beznea (3):
  regulator: act8945a-regulator: fix line over 80 chars warning
  regulator: act8945a-regulator: add shutdown function
  regulator: add documentation for regulator modes and suspend states

 .../bindings/regulator/act8945a-regulator.txt      |  34 ++++
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |  54 ++++++
 drivers/regulator/act8945a-regulator.c             | 200 +++++++++++++++++=
+++-
 .../regulator/active-semi,8945a-regulator.h        |  30 ++++
 4 files changed, 312 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/regulator/active-semi,8945a-regulat=
or.h

--=20
2.7.4
