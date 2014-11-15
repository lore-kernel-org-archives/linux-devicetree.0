From: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 0/2] Add support for the rockchip mmc clock phases using the framework
Date: Fri, 14 Nov 2014 16:00:02 -0800
Message-ID: <1416009604-31545-1-git-send-email-amstan@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, addy ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

For now all I have is the getter and setter for the phase, nothing that uses it
(that is ready). You can test the getter like this:
localhost ~ # cat /sys/kernel/debug/clk/clk_summary|grep sample -C 1
    sclk_sdio1                            0            0    24000000          0 0
       sdio1_sample                       0            0    12000000          0 0
       sdio1_drv                          0            0    12000000          0 90
--
          sclk_sdmmc                      1            1   297000000          0 0
             sdmmc_sample                 0            0   148500000          0 134
             sdmmc_drv                    0            0   148500000          0 90
--
          sclk_sdio0                      1            1   100000000          0 0
             sdio0_sample                 0            0    50000000          0 0
             sdio0_drv                    0            0    50000000          0 90
          sclk_emmc                       1            1   100000000          0 0
             emmc_sample                  0            0    50000000          0 0
             emmc_drv                     0            0    50000000          0 180

Next thing that will come is some dts changes that will make use of these new
clocks, and eventually mmc code will be changed to tune with these clocks.

Changes in v2:
- fixed my cc/to list
- removed dangling #DEFINE DEBUG

Alexandru M Stan (2):
  clk: rockchip: add bindings for the mmc clock phases
  clk: rockchip: Add support for the mmc clock phases using the
    framework

 drivers/clk/rockchip/Makefile          |   1 +
 drivers/clk/rockchip/clk-mmc-phase.c   | 149 +++++++++++++++++++++++++++++++++
 drivers/clk/rockchip/clk-rk3288.c      |  12 +++
 drivers/clk/rockchip/clk.c             |   8 ++
 drivers/clk/rockchip/clk.h             |  23 +++++
 include/dt-bindings/clock/rk3288-cru.h |  10 +++
 6 files changed, 203 insertions(+)
 create mode 100644 drivers/clk/rockchip/clk-mmc-phase.c

-- 
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
