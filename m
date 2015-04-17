From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/5] Add st_lpc clocksource timer driver.
Date: Fri, 17 Apr 2015 11:50:18 +0100
Message-ID: <1429267823-8879-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Following on from the discussion here
https://www.mail-archive.com/devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg68857.html

This series adds the st_lpc clocksource driver found on stih407 family
silicon. Regardless of whether the change referenced above actually gets
merged, adding this alternative clocksource driver is useful so that we
can activate cpufreq upstream on stih407 family.

regards,

Peter.

Peter Griffin (5):
  clocksource: st_lpc: Add LPC timer as a clocksource.
  clocksource: st_lpc: Add DT bindings documentation for lpc timer
  MAINTAINERS: Add st_lpc.c to ARCH/STI section of maintainers
  ARM: sti: Always enable CLKSRC_ST_LPC_CLOCK
  ARM: DT: STi: STiH407: Add DT node for st-lpc timer.

 .../devicetree/bindings/timer/st,lpc-timer.txt     |  15 ++
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/stih407-family.dtsi              |   7 +
 arch/arm/mach-sti/Kconfig                          |   7 +-
 drivers/clocksource/Kconfig                        |  16 +++
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/st_lpc.c                       | 154 +++++++++++++++++++++
 7 files changed, 198 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/st,lpc-timer.txt
 create mode 100644 drivers/clocksource/st_lpc.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
