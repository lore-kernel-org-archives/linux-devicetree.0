From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 0/4] dw_apb_timer: osc as sched_clock,
 clocks and clocksource_of support
Date: Tue, 4 Jun 2013 11:36:09 +0200
Message-ID: <201306041136.09566.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is split off of my Rockchip support series from yesterday. It's now
a patch more than before, as the third patch enables the timer to be used
thru clocksource_of_init and moves picoxcell and socfpga to it.

changes since v1:
- hopefully improve the patch description of patch 1
  after a suggestion by Linus Walleij
- move the selection of DW_APB_TIMER and CLKSRC_OF into DW_APB_TIMER_OF
  after a suggestion by Baruch Siach

Heiko Stuebner (4):
  clocksource: dw_apb_timer_of: enable the use the clocksource as sched clock
  clocksource: dw_apb_timer_of: add clock-handling
  clocksource: dw_apb_timer_of: select DW_APB_TIMER
  clocksource: dw_apb_timer_of: use clocksource_of_init

 Documentation/devicetree/bindings/rtc/dw-apb.txt |   19 +++++
 arch/arm/mach-picoxcell/Kconfig                  |    1 -
 arch/arm/mach-picoxcell/common.c                 |    2 -
 arch/arm/mach-socfpga/Kconfig                    |    1 -
 arch/arm/mach-socfpga/socfpga.c                  |    2 -
 drivers/clocksource/Kconfig                      |    2 +
 drivers/clocksource/dw_apb_timer_of.c            |   95 ++++++++++++++-------
 include/linux/dw_apb_timer.h                     |    1 -
 8 files changed, 84 insertions(+), 39 deletions(-)

-- 
1.7.2.3
