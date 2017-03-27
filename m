From: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v5 0/7] rk808: Add RK805 support
Date: Mon, 27 Mar 2017 14:21:38 +0800
Message-ID: <1490595705-28844-1-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org, chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

change in v5:
PATCH V5 1/7: NO change in V5
PATCH V5 2/7: fix the rk805 reg addr in numerical order
PATCH V5 3/7: NO change in V5
PATCH V5 4/7: fix up the rk805_device_shutdown func
PATCH V5 5/7: NO change in V5
PATCH V5 6/7: NO change in V5
PATCH V5 7/7: fix up the description of the rk805

change in v4:
PATCH V4 1/7: NO change in V4
PATCH V4 2/7: rename the commit message
PATCH V4 3/7: NO change in V4
PATCH V4 4/7: Split this patch up into subsystems patch 5/7 6/7
PATCH V4 5/7: new added
PATCH V4 6/7: new added
PATCH V4 7/7: NO change in V4


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

Elaine Zhang (7):
  mfd: rk808: fix up the chip id get failed
  mfd: rk808: add rk805 regs addr and ID
  regulator: rk808: Add regulator driver for RK805
  mfd: rk808: Add RK805 support
  clk: Kconfig: Name RK805 in Kconfig for COMMON_CLK_RK808
  rtc: Kconfig: Name RK805 in Kconfig for RTC_DRV_RK808
  mfd: dt-bindings: Add RK805 device tree bindings document

 Documentation/devicetree/bindings/mfd/rk808.txt |  20 +++-
 drivers/clk/Kconfig                             |   4 +-
 drivers/mfd/Kconfig                             |   4 +-
 drivers/mfd/rk808.c                             | 129 +++++++++++++++++++++--
 drivers/regulator/Kconfig                       |   4 +-
 drivers/regulator/rk808-regulator.c             | 130 ++++++++++++++++++++++++
 drivers/rtc/Kconfig                             |   4 +-
 include/linux/mfd/rk808.h                       | 121 ++++++++++++++++++++++
 8 files changed, 401 insertions(+), 15 deletions(-)

-- 
1.9.1
