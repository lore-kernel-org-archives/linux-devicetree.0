From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 0/5] Implement clocksource for rockchip SoC using rockchip timer
Date: Tue, 31 Jan 2017 15:43:11 +0300
Message-ID: <1485866596-32254-1-git-send-email-al.kochet@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Alexander Kochetkov <akochetkov-KJfikXucm3wvJsYlp49lxw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alexander Kochetkov <akochetkov-KJfikXucm3wvJsYlp49lxw@public.gmane.org>

Hello, Daniel, Heiko.

Here is try 6 :) Thanks a lot for helping me to bring the code
into kernel!

This patch series contain:
- devicetree bindings clarification for rockchip timers
- dts files fixes for rk3228-evb, rk3229-evb and rk3188
- implementation of clocksource and sched clock for rockchip SoC

The clock supplying the arm-global-timer on the rk3188 is coming from the
the cpu clock itself and thus changes its rate everytime cpufreq adjusts
the cpu frequency making this timer unsuitable as a stable clocksource.

The rk3188, rk3288 and following socs share a separate timer block already
handled by the rockchip-timer driver. Therefore adapt this driver to also
be able to act as clocksource on rk3188.

In order to test clocksource you can run following commands and check
how much time it take in real. On rk3188 it take about ~45 seconds.

       cpufreq-set -f 1.6GHZ
       date; sleep 60; date

rk3288 (and probably anything newer) is irrelevant to this patch,
as it has the arch timer interface. This patch may be usefull
for Cortex-A9/A5 based parts.

Regards,
Alexander.

Changes in v6:
- Removed Reviewed-by: Heiko Stübner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> tag
- Merge 5/8, 6/8, 7/8, 8/9 into single file
- split init paths into rk_clkevt_init() and rk_clksrc_init()
  so the driver code could be adopted to CLOCKEVENT_OF_DECLARE()
- clockevents implemented using clocksource_mmio_init()
- fixed commit message for 4/8 (thanks a lot Daniel)

Changes in v5:
- Add Acked-by: Rob Herring <robh at kernel.org> to 1/8
  http://lists.infradead.org/pipermail/linux-rockchip/2016-December/013308.html
- Add Reviwed-by: Heiko Stübner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> to series
- change timer compatible property in the rk322x.dtsi 2/8
  http://lists.infradead.org/pipermail/linux-rockchip/2017-January/013784.html
- updated comment message for 4/8
  http://lists.infradead.org/pipermail/linux-rockchip/2017-January/013786.html
- updated comment message for 5/8
  http://lists.infradead.org/pipermail/linux-rockchip/2017-January/013787.html
- fixed build error for 8/8
  http://lists.infradead.org/pipermail/linux-rockchip/2017-January/013789.html

Alexander Kochetkov (5):
  dt-bindings: clarify compatible property for rockchip timers
  ARM: dts: rockchip: update compatible property for rk322x timer
  clocksource/drivers/rockchip_timer: implement clocksource timer
  ARM: dts: rockchip: add timer entries to rk3188 SoC
  ARM: dts: rockchip: disable arm-global-timer for rk3188

 .../bindings/timer/rockchip,rk-timer.txt           |   12 +-
 arch/arm/boot/dts/rk3188.dtsi                      |   17 ++
 arch/arm/boot/dts/rk322x.dtsi                      |    2 +-
 drivers/clocksource/Kconfig                        |    1 +
 drivers/clocksource/rockchip_timer.c               |  218 ++++++++++++++------
 5 files changed, 185 insertions(+), 65 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
