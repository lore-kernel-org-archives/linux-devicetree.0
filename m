From: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/5] Add regulator suspend and resume support
Date: Thu, 21 Dec 2017 14:25:01 +0800
Message-ID: <1513837506-26543-1-git-send-email-zhang.chunyan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

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

Any comments would be greatly appreciated.

Thanks,
Chunyan

Chunyan Zhang (5):
  bindings: regulator: added support for suspend states
  regulator: make regulator voltage be an array to support more states
  drivers: regulator: leave one item to record whether regulator is
    enabled
  drivers: regulator: empty the old suspend functions
  regulator: add PM suspend and resume hooks

 .../devicetree/bindings/regulator/regulator.txt    |  11 +-
 drivers/regulator/core.c                           | 342 ++++++++++++++-------
 drivers/regulator/internal.h                       |  18 +-
 drivers/regulator/of_regulator.c                   |  18 +-
 include/linux/regulator/driver.h                   |   2 +
 include/linux/regulator/machine.h                  |  31 +-
 6 files changed, 299 insertions(+), 123 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
