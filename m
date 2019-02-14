From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v3 0/3] bd718x7: Support SNVS low power state
Date: Thu, 14 Feb 2019 11:34:19 +0200
Message-ID: <cover.1550135853.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: matti.vaittinen@fi.rohmeurope.com, mazzisaccount@gmail.com
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Robin Gong <yibin.gong@nxp.com>, Elven Wang <elven.wang@nxp.com>, Anson Huang <anson.huang@nxp.com>, Angus Ainslie <angus.ainslie@puri.sm>
List-Id: devicetree@vger.kernel.org

Patch series adding SNVS power state support to ROHM bd718x7 driver.

The SNVS is a low power state used by i.MX family of SoCs. In SNVS
state processor and most of the peripherials are shut off in order
to minimize power consumption.

BD71837 and BD71847 can be configured to use the SNVS state as a
reset/shutdown target state. There is some HW limitations though.
Main limitation is that regulators which have been under SW control
(regarding enable/disable state) will stay shut down after such reset.
Thus if SNVS is used as reset target the control of boot crucial
regulators must be left to HW state machine.

This patch seris adds DT properties for specifying whether to use
SNVS as reset target state and for setting the HW run level
specific voltages.

Changelog v3:
Patch 2 unchanged
- DT bindings SNVS rest description improved(?)
- Added optional HW state properties in usage example
- Fixed a bug from DVS voltage settings (buck 1 was initialize with
  voltag from buck 2 and buck 2 was uninitialized) - thanks to Angus
  Ainslie for reoporting.

Changelog v2:
- drop RFC tag
- add handling of SNVS as reset target
- add skipping SW control for critical regulators based on presense
  of regulator-always-on and regulator-boot-on

---

Matti Vaittinen (3):
  devicetree: bindings: bd718x7: document HW state related ROHM specific
    properties
  regulator: add regulator_desc_list_voltage_linear_range
  regulator: bd718x7: Support SNVS low power state

 .../devicetree/bindings/mfd/rohm,bd71837-pmic.txt  |  17 ++
 .../bindings/regulator/rohm,bd71837-regulator.txt  |  38 ++++
 drivers/regulator/bd718x7-regulator.c              | 201 ++++++++++++++++++---
 drivers/regulator/helpers.c                        |  39 +++-
 include/linux/regulator/driver.h                   |   6 +
 5 files changed, 266 insertions(+), 35 deletions(-)

-- 
2.14.3


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~
