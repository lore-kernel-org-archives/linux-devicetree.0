From: Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH V8 0/2] clocksource: add gx6605s SOC system timer
Date: Thu, 20 Sep 2018 16:03:40 +0800
Message-ID: <cover.1537412072.git.ren_guo@c-sky.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, c-sky_gcc_upstream@c-sky.com, green.hu@gmail.com, Guo Ren <ren_guo@c-sky.com>
List-Id: devicetree@vger.kernel.org

 - Dt-bindings documentation
 - timer-gx6605s driver

Guo Ren (2):
  clocksource: add gx6605s SOC system timer
  dt-bindings: timer: gx6605s SOC timer

 .../bindings/timer/csky,gx6605s-timer.txt          |  42 ++++++
 drivers/clocksource/Kconfig                        |   8 ++
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-gx6605s.c                | 150 +++++++++++++++++++++
 4 files changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/csky,gx6605s-timer.txt
 create mode 100644 drivers/clocksource/timer-gx6605s.c

-- 
2.7.4
