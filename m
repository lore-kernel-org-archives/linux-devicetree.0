From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v5 0/2] clocksource/drivers/npcm: Add NPCM7xx timer driver
Date: Thu,  8 Mar 2018 17:24:56 +0200
Message-ID: <1520522698-16153-1-git-send-email-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, avifishman70@gmail.com, brendanhiggins@google.com, venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: devicetree@vger.kernel.org

Addressed comments from:.
 - Daniel Lezcano: https://www.spinics.net/lists/kernel/msg2741546.html
				   https://www.spinics.net/lists/kernel/msg2741548.html
 - Joel Stanley:   https://www.spinics.net/lists/kernel/msg2736646.html					

Changes since version 4:
 - Remove clock-frequency option.
 - Rename driver name.
 - Enable TIMER_OF_CLOCK flag.
 - Modify register size in the dt-binding.
 
Changes since version 3:
 - Modify prefix to npcm7xx_
 - Modify licensing to SPDX license format

Changes since version 2:
 - The shutdown function called oneshot function that can cause a crash in the system,
   Modify shutdown call to unique shutdown function.
 - Adding support to resume function
 - Using timer-of.c API
 - Modify NPCM750 compatible name.

Changes since version 1:
 - Rename driver name
 - Removing unnecessary dependencies in configuration
 - Adding prefix to the macros
 - No changes to dt-binding documentation since v1
 
Modified driver have been tested on the NPCM750 evaluation board.

Tomer Maimon (2):
  dt-binding: timer: document NPCM7xx timer DT bindings
  clocksource/drivers/npcm: Add NPCM7xx timer driver

 .../bindings/timer/nuvoton,npcm7xx-timer.txt       |  21 ++
 drivers/clocksource/Kconfig                        |   8 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-npcm7xx.c                | 215 +++++++++++++++++++++
 4 files changed, 245 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
 create mode 100644 drivers/clocksource/timer-npcm7xx.c

-- 
2.14.1
