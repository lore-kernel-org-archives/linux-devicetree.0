From: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/2] clocksource: npcm: add NPCM7xx timer driver
Date: Sun,  1 Oct 2017 12:11:36 +0300
Message-ID: <1506849098-18290-1-git-send-email-tmaimon77@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set adds clocksource support for the Nuvoton NPCM7xx Baseboard
Management Controller (BMC).

The clocksource Enable 24-bit TIMER0 and TIMER1 counters in the NPCM7xx BMC,
while TIMER0 serves as clockevent and TIMER1 serves as clocksource.

clocksource patch set depand on approval of basic support for Nuvoton BMCs
and Nuvoton NPCM750 device tree patches.
https://patchwork.kernel.org/bundle/brendanhiggins/arm:%20npcm:%20add%20basic%20support%20for%20Nuvoton%20BMCs/

Tomer Maimon (2):
  clocksource: npcm: add NPCM7xx timer driver
  dt-binding: timer: document NPCM7xx timer DT bindings

 .../bindings/timer/nuvoton,npcm7xx-timer.txt       |  25 +++
 drivers/clocksource/Kconfig                        |   9 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/npcm7xx_timer.c                | 205 +++++++++++++++++++++
 4 files changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
 create mode 100644 drivers/clocksource/npcm7xx_timer.c

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
