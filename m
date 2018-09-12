From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v2 0/7] regulator/mfd/dt_bindings: bd718x7: Support ROHM
 bd71847
Date: Wed, 12 Sep 2018 14:43:59 +0300
Message-ID: <cover.1536750863.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, sboyd@kernel.org
List-Id: devicetree@vger.kernel.org

Patch series adding support for ROHM BD71847 PMIC.

ROHM BD71847 is modified version of ROHM BD71837 Power Management IC.
BD71847 integrates 6 buck regulators and 6  LDO’s.

The patch series adds support for BD71847 in BD71837 driver. It also
extends BD71837 to support all BUCK/LDO output voltages.

Support for "pickable voltage ranges" is introduced in order to fully
support BD71837/BD71847 voltage selection registers. Some of the voltage
regulators provide different multiple voltage ranges and output voltage
is determined by range selection bit(s) and voltage selection bits
instead of plain voltage selection bits.

Changelog v2
- Dropped first patch (voltage monitoring fix) and "rebased" on top of
  next-20180912 because first patch was already applied.
- Fixed two commit message typos.
Fixes based on comments from Lee Jones
- removed PMIC revision check.
- stored chip type directly to data pointer
- minor readability improvement to DT binding
- unified naming for last enum members
- moved unrelated changes from pickable ranges patch
- removed C++ style comment

Patch 2:
	limited BD71847 support (without range selection)
Patch 3:
	BD71847 device-tree bindings for regulators
Patch 4:
	BD71847 device-tree bindings for mfd
Patch 5:
	Voltage range selection support to regulator helpers
Patch 6:
	Simple renaming plenty of BD71837 occurrences to BD718XX
Patch 7:
	BD71837/BD71847 Full voltage range support using helpers from
	patch 5
Patch 8:
	Renaming bd71837 regulator driver to bd718x7

this patch series is based on linux-next tag next-20180912.

Matti Vaittinen (7):
  regulator: Support ROHM BD71847 power management IC
  regulator: dt bindings: add BD71847 device-tree binding documentation
  mfd: dt bindings: add BD71847 device-tree binding documentation
  regulator: Support regulators where voltage ranges are selectable
  regulator/mfd: bd718xx: rename bd71837/bd71847 common instances
  regulator: bd718XX use pickable ranges
  regulator: bd718xx: rename bd71837 to 718xx

 .../devicetree/bindings/mfd/rohm,bd71837-pmic.txt  |   17 +-
 .../bindings/regulator/rohm,bd71837-regulator.txt  |   12 +-
 drivers/mfd/rohm-bd718x7.c                         |  160 ++-
 drivers/regulator/Kconfig                          |    2 +-
 drivers/regulator/Makefile                         |    2 +-
 drivers/regulator/bd71837-regulator.c              |  644 -----------
 drivers/regulator/bd718x7-regulator.c              | 1138 ++++++++++++++++++++
 drivers/regulator/core.c                           |    5 +
 drivers/regulator/helpers.c                        |  232 ++++
 include/linux/mfd/rohm-bd718x7.h                   |  333 +++---
 include/linux/regulator/driver.h                   |   20 +-
 11 files changed, 1644 insertions(+), 921 deletions(-)
 delete mode 100644 drivers/regulator/bd71837-regulator.c
 create mode 100644 drivers/regulator/bd718x7-regulator.c

-- 
2.14.3
