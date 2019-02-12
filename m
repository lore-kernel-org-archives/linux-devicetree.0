From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [RFC PATCH v1 0/3] bd718x7: Support SNVS low power state
Date: Tue, 12 Feb 2019 16:16:35 +0200
Message-ID: <cover.1549980347.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Robin Gong =?utf-8?B?4oCO?= <yibin.gong@nxp.com>, Elven Wang =?utf-8?B?4oCO?= <elven.wang@nxp.com>, Anson Huang =?utf-8?B?4oCO?= <anson.huang@nxp.com>
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

This patch seris allows one to describe the boot crucial regulators
and reset/shutdown target state as well as the default HW state
voltages from device-tree. I am unsure if the device-tree is the
correct way to bring this information and hence I send this initial
patch set as an RFC. Please comment and I will generate properly tested
patch series on top of this idea if this is seen as a reasonable
approach.

---

Matti Vaittinen (3):
  devicetree: bindings: bd718x7: document HW state related ROHM specific
    properties
  regulator: add regulator_desc_list_voltage_linear_range
  regulator: bd718x7: Support SNVS low power state

 .../devicetree/bindings/mfd/rohm,bd71837-pmic.txt  |  17 +++
 .../bindings/regulator/rohm,bd71837-regulator.txt  |  36 ++++++
 drivers/regulator/bd718x7-regulator.c              | 135 +++++++++++++++++++++
 drivers/regulator/helpers.c                        |  39 ++++--
 include/linux/regulator/driver.h                   |   6 +
 5 files changed, 223 insertions(+), 10 deletions(-)

-- 
2.14.3


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~
