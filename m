From: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 0/5] rk808: Add RK805 support
Date: Thu, 16 Mar 2017 10:14:59 +0800
Message-ID: <1489630504-11328-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

change in V3:
PATCH V3 1/5: NO change in V3
PATCH V3 2/5: add rk805 RTC INT MASK define
PATCH V3 3/5: RK805 set suspend enable and disable is different from rk808
	      use rk805_regs_ops and rk805_switch_ops
PATCH V3 4/5: fix up the shutdown func
	      use pm_shutdown_prepare_fn to prepare shutdown
	      and pm_pwroff_fn pull down gpio to shut down rk805
	      it will update in the future(after rk808 support gpio func)
PATCH V3 5/5: NO change in V3

change in V2:
PATCH V2 1/5: NO change in V2
PATCH V2 2/5: add rk805 BUCK ILMAX define
PATCH V2 3/5: NO change in V2
PATCH V2 4/5: setting RK805 BUCK ILMAX in pre init
PATCH V2 5/5: Add RK805 device tree bindings document

Elaine Zhang (5):
  mfd: rk808: fix up the chip id get failed
  linux: mfd: rk808: add rk805 regs addr and ID
  regulator: rk808: Add regulator driver for RK805
  mfd: rk808: Add RK805 support
  mfd: dt-bindings: Add RK805 device tree bindings document

 Documentation/devicetree/bindings/mfd/rk808.txt |  20 +++-
 drivers/clk/Kconfig                             |   4 +-
 drivers/mfd/Kconfig                             |   4 +-
 drivers/mfd/rk808.c                             | 143 +++++++++++++++++++++++-
 drivers/regulator/Kconfig                       |   4 +-
 drivers/regulator/rk808-regulator.c             | 130 +++++++++++++++++++++
 drivers/rtc/Kconfig                             |   4 +-
 include/linux/mfd/rk808.h                       | 120 ++++++++++++++++++++
 8 files changed, 414 insertions(+), 15 deletions(-)

-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
