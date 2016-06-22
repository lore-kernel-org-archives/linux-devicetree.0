From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/6] regulator: add enable GPIO property to pwm-regulator
Date: Wed, 22 Jun 2016 17:25:52 +0900
Message-ID: <20160622082558.20935-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds the ability for the pwm-regulator driver to have an enable-gpio
property, a feature that is required for the VDD_GPU regulator of Jetson TX1.

Before doing that though, it goes through a few required changes/improvements
in the regulator framework.

Patch 1 allows the regulator core to use both an enable GPIO and an enable
callback for a given driver. This is required for our use-case since the PWM
also needs to be enabled/disabled in pwm-regulator regardless of whether we are
using an enable GPIO or not.

Patches 2-4 factorize the enable GPIO DT parsing code. With fixed and GPIO
regulators already using that feature, and PWM to do the same, it probably
makes sense to only have one function doing this. The parsing function supports
more properties than individual drivers require, but the DT binding is the
authority on which properties are valid, not the implementation.

Finally patches 5-6 add support for the enable GPIO in pwm-regulator and the
corresponding DT binding. The binding is kept minimal (active-high and
open-drain properties can be specified in the GPIO phandle) on purpose.

Alexandre Courbot (6):
  regulator: core: Allow simultaneous use of enable op and GPIO
  regulator: of: Add enable GPIO configuration function
  regulator: fixed: Use of_get_regulator_gpio_config
  regulator: gpio: Use of_get_regulator_gpio_config
  pwm-regulator: Support for enable GPIO
  dt-bindings: pwm-regulator: Document enable-gpio property

 .../bindings/regulator/pwm-regulator.txt           |  7 ++-
 drivers/regulator/core.c                           | 34 ++++++++------
 drivers/regulator/fixed.c                          | 52 +++++++++++-----------
 drivers/regulator/gpio-regulator.c                 | 47 ++++++++++---------
 drivers/regulator/of_regulator.c                   | 52 ++++++++++++++++++++++
 drivers/regulator/pwm-regulator.c                  |  5 +++
 include/linux/regulator/of_regulator.h             | 14 ++++++
 7 files changed, 149 insertions(+), 62 deletions(-)

-- 
2.8.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
