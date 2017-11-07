From: Rick Chen <rickchen36-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/3] *** Fix warning from kbuild test robot ***
Date: Tue,  7 Nov 2017 15:19:50 +0800
Message-ID: <1510039193-32522-1-git-send-email-rickchen36@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rick-MUIXKm3Oiri1Z/+hSey0Gg@public.gmane.org
Cc: Rick Chen <rickchen36-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

*** Fix warnings when make with ARCH=x86_64 from auto build test ***

rick (3):
  clocksource/drivers/atcpit100: Add andestech atcpit100 timer
  clocksource/drivers/Kconfig: Support andestech atcpit100 timer
  dt-bindings: timer: Add andestech atcpit100 timer binding doc

 .../bindings/timer/andestech,atcpit100-timer.txt   |  31 ++++
 drivers/clocksource/Kconfig                        |   6 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-atcpit100.c              | 199 +++++++++++++++++++++
 4 files changed, 237 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/andestech,atcpit100-timer.txt
 create mode 100644 drivers/clocksource/timer-atcpit100.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
