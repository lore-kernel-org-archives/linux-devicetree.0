From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v7 0/2] regulator: get voltage & duty table from dts for pwm-regulator
Date: Sun, 28 Sep 2014 10:28:52 +0800
Message-ID: <1411871334-17692-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

get voltage & duty table from device tree might be better, other platforms
can also use this driver without any modify.
Tested on a rk3288 sdk board as logic voltage regulator.

Changes in v7:
Adviced by Mark Brown
- re-edit changelog
- re-edit changelog

Changes in v6:
Adviced by Mark Rutland
- fix a spelling error

Changes in v4:
Adviced by Doug Anderson
- improve kconfig
- add const for desc structure
Adviced by Doug Anderson
- remove regulator-always-on and regulator-boot-on from the Example

Changes in v3:
Adviced by Doug Anderson
- Make Kconfig & Makefile alphabetical
- remove pwm_reg_period from pwm_regulator_data
- modify the calculation in pwm_regulator_set_voltage_sel
- add length validity check
Adviced by Doug Anderson
- update the Example

Changes in v2:
Adviced by Lee Jones
- rename the file
- remove all the prefix st_
- add depend on PWM in Kconfig
Adviced by Lee Jones
- rename the documentation
Adviced by Doug Anderson
- update the example
Adviced by Mark Rutland
- remove pwm-reg-period

Chris Zhong (2):
  regulator: pwm-regulator: get voltage and duty table from dts
  dt-bindings: add devicetree bindings for pwm regulator

 .../bindings/regulator/pwm-regulator.txt           |   27 ++++
 drivers/regulator/Kconfig                          |   13 +-
 drivers/regulator/Makefile                         |    2 +-
 drivers/regulator/{st-pwm.c => pwm-regulator.c}    |  147 ++++++++++----------
 4 files changed, 112 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/pwm-regulator.txt
 rename drivers/regulator/{st-pwm.c => pwm-regulator.c} (44%)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
