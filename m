From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v8 0/6] stm32 clocksource driver rework
Date: Tue, 14 Nov 2017 09:52:37 +0100
Message-ID: <1510649563-22975-1-git-send-email-benjamin.gaignard@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, julien.thierry-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

version 8:
 - rebased on timers/core
 - change timer_of_exit() name to timer_of_cleanup()
 - update stm32 clocksource driver to use this function

version 7:
 - reword "clocksource: stm32: only use 32 bits timers" commit message
   to give more details about why 16 bits are problematics.

version 6:
 - add dedicated patch min delta change
 - rework commit messages, I hope it will be better now
 - change new function name from timer_of_deinit to timer_of_exit
 - make stm32_clock_event_set_next_event() safer like done in other
   drivers

version 6:
- add timer_of_deinit function in core
- rework failure cases in probe function

version 5:
- rebase on top of timer/core branch
- rework commit message of the first patch

version 4:
- split patch in 3 parts
  - convert code to timer_of
  - only use 32 bits timers
  - add clocksource support

version 3:
- fix comments done by Daniel
- use timer_of helper functions

version 2:
- fix uninitialized variable

Benjamin Gaignard (6):
  clocksource: timer_of: rename timer_of_exit to timer_of_cleanup
  clocksource: stm32: convert driver to timer_of
  clocksource: stm32: increase min delta value
  clocksource: stm32: only use 32 bits timers
  clocksource: stm32: add clocksource support
  arm: dts: stm32: remove useless clocksource nodes

 arch/arm/boot/dts/stm32f429.dtsi  |  32 -----
 arch/arm/boot/dts/stm32f746.dtsi  |  32 -----
 drivers/clocksource/Kconfig       |   1 +
 drivers/clocksource/timer-of.c    |   9 +-
 drivers/clocksource/timer-of.h    |   2 +-
 drivers/clocksource/timer-stm32.c | 242 ++++++++++++++++++++------------------
 6 files changed, 138 insertions(+), 180 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
