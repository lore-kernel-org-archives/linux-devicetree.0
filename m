From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/9] clocksource: dw_apb_timer: support for timer variant used
 in rk3188 SoCs
Date: Sat, 6 Jul 2013 00:51:08 +0200
Message-ID: <201307060051.09716.heiko@sntech.de>
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
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Rockchip rk3188 SoCs use a variant of the timer with some slight
modifications. This series implements them as quirks for the dw_apb_timer.

Tested on a rk3188 for the quirk handling and on a rk3066a to check that
nothing broke.

Heiko Stuebner (5):
  clocksource: dw_apb_timer: infrastructure to handle quirks
  clocksource: dw_apb_timer: flexible register addresses
  clocksource: dw_apb_timer: quirk for variants with 64bit counter
  clocksource: dw_apb_timer_of: add quirk handling
  clocksource: dw_apb_timer: special variant for rockchip rk3188 timers

Ulrich Prinz (4):
  clocksource: dw_apb_timer: use the eoi callback to clear pending interrupts
  clocksource: dw_apb_timer: quirk for variants without EOI register
  clocksource: dw_apb_timer: quirk for inverted int mask
  clocksource: dw_apb_timer: quirk for inverted timer mode setting

 .../bindings/arm/rockchip/rk3188-timer.txt         |   20 +++
 arch/x86/kernel/apb_timer.c                        |    4 +-
 drivers/clocksource/dw_apb_timer.c                 |  166 +++++++++++++++-----
 drivers/clocksource/dw_apb_timer_of.c              |   27 +++-
 include/linux/dw_apb_timer.h                       |   34 +++-
 5 files changed, 198 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/rk3188-timer.txt

-- 
1.7.10.4
