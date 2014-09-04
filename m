From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v9 0/3] Add rockchip RK808 pmic driver
Date: Thu,  4 Sep 2014 09:12:36 +0800
Message-ID: <1409793159-2573-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is the initial version of the RK808 PMIC. This is a power management IC
for multimedia products.

It provides regulators that are able to supply power to processor cores
and other components. The chip provides other modules including RTC, Clockout

Changes in v9:
Adviced by Dmitry
- if(rk808_rtc->irq < 0), return rk808_rtc->irq
Adviced by Doug
- add reg_np

Changes in v8:
Adviced by Doug
- coding style
- fix regmap_update_bits()
- if(rk808_rtc->irq < 0) return err num
Adviced by Mike
-rename "control" to "enable"
-define RK808_NR_OUTPUT 2
Adviced by Doug
- remove rk808_regulator_dts() function
- remove the check about "client->dev.of_node"

Changes in v7:
Adviced by doug
- read rtc time from shadowed registers
Adviced by Dmitry
- use CONFIG_PM_SLEEP replace CONFIG_PM
- use SIMPLE_DEV_PM_OPS replace dev_pm_ops
- fix dev_warn
- coding style
Adviced by Heiko
- remove rtc_ctl
Adviced by doug
-fix coding style problems
- remove pdata struct from header file, add rk808_regulator struct

Changes in v6:
Adviced by doug
- move RTC_READSEL setting into probe
Adviced by doug
- use correct argument call of_clk_add_provider in probe
- remove the redundant code

Changes in v5:
- fixed a bug about set_time failed
Adviced by doug
- add some error checking in probe
- move "rockchip,rk808.h" into the patch about dt-bindings
- re-edit base on Mark's branch

Changes in v4:
- use &client->dev replace rk808->dev
Adviced by doug
- add "clock-output-names" propertiey
- add a header file "rockchip,rk808.h"
- use &client->dev replace rk808->dev

Changes in v3:
- fix compile err

Changes in v2:
Adviced by javier.martinez
- Add a separate clock driver, rather than in RTC driver
Adviced by javier.martinez
- separated from rtc-rk808.c
Adviced by Mark Browm:
- change of_find_node_by_name to find_child_by_name
- use RK808_NUM_REGULATORS as the name of the constant
- create a pdata when missing platform data
- use the rk808_reg name to supply_regulator name
- replace regulator_register with devm_regulator_register
- some other problem with coding style

Chris Zhong (3):
  RTC: RK808: add RTC driver for RK808
  clk: RK808: Add clkout driver for RK808
  regulator: RK808: Remove pdata from the regulator

 drivers/clk/Kconfig                 |    9 +
 drivers/clk/Makefile                |    1 +
 drivers/clk/clk-rk808.c             |  164 ++++++++++++++
 drivers/regulator/rk808-regulator.c |   91 ++------
 drivers/rtc/Kconfig                 |   10 +
 drivers/rtc/Makefile                |    1 +
 drivers/rtc/rtc-rk808.c             |  426 +++++++++++++++++++++++++++++++++++
 7 files changed, 629 insertions(+), 73 deletions(-)
 create mode 100644 drivers/clk/clk-rk808.c
 create mode 100644 drivers/rtc/rtc-rk808.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
