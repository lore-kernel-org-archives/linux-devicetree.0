From: Chunyan Zhang <zhang.chunyan@linaro.org>
Subject: [PATCH V5 0/5] Add regulator suspend and resume support
Date: Fri, 26 Jan 2018 21:08:42 +0800
Message-ID: <1516972127-972-1-git-send-email-zhang.chunyan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>

Some systems need to set regulators to specific states when they enter low
power modes, especially around CPUs.

Currently the regulator driver, for suspend and resume features, provides
two functions which are exported for being called directly by any modules
or subsystems when they thought the regulator should be entering into
suspend states.

This patchset adds hooks to PM suspend core and provides suspend/resume
callback functions to regulator device, for those who can be switched
off or set low voltage in suspend states only need to implement the
callback functions in the driver, and set the right configurations for
suspend states via device tree and the APIs which regulator core
driver provides.

Those drivers who use the old interfaces - i.e. regulator_suspend_prepare()
and regulator_suspend_finish() should stop using that, since we leave these
two functions empty and plan to remove them one day in the future.

Thanks,
Chunyan


Changes from V4: (https://lkml.org/lkml/2018/1/23/220)
* Fixed the kbuild-test error, the glable variable 'pm_suspend_target_state'
  only can be referred when CONFIG_SUSPEND is selected.
* Added Rob's Reviewed-by.

Changes from V3:
* Addressed comments from Rob:
  - Rephrase the binding documentation.

Changes from V2: (https://lkml.org/lkml/2018/1/4/75)
* Correct the typo;
* Removed redundant comments;
* Export regulator_suspend_enable/disable(), don't call these two functions in
  regulator_set_suspend_voltage() instead;
* Checking if rstate->min_uV == rstate->max_uV instead of checking the flag when
  setting the suspend voltage.

Changes from V1: (https://lkml.org/lkml/2017/12/21/9)
* Rephrased the commit message of patch 0001;
* Declared the property 'regulator-suspend-microvolt' deperated and documented
  the way recommended;
* Revised of_regulator.c, use suspend_state::min_uV as default suspend
  voltage if the property 'regulator-suspend-microvolt' is not used.

Chunyan Zhang (5):
  bindings: regulator: added support for suspend states
  regulator: make regulator voltage be an array to support more states
  drivers: regulator: leave one item to record whether regulator is
    enabled
  drivers: regulator: empty the old suspend functions
  regulator: add PM suspend and resume hooks

 .../devicetree/bindings/regulator/regulator.txt    |  12 +-
 drivers/regulator/core.c                           | 346 ++++++++++++++-------
 drivers/regulator/internal.h                       |  18 +-
 drivers/regulator/of_regulator.c                   |  20 +-
 include/linux/regulator/driver.h                   |   2 +
 include/linux/regulator/machine.h                  |  37 ++-
 6 files changed, 309 insertions(+), 126 deletions(-)

-- 
2.7.4
