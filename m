From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v3 0/2] clocksource: npcm: add NPCM7xx timer driver
Date: Mon,  6 Nov 2017 18:28:34 +0200
Message-ID: <1509985716-25759-1-git-send-email-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, avifishman70@gmail.com, brendanhiggins@google.com, raltherr@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: devicetree@vger.kernel.org

Addressed comments from:.
 - Daniel Lezcano: https://www.spinics.net/lists/devicetree/msg196683.html
 - Brendan Higgins: https://www.spinics.net/lists/devicetree/msg201038.html
		    https://www.spinics.net/lists/devicetree/msg201037.html

Changes since version 2:
 - The shutdown function called oneshot function that can cause a crash
   in the system.
   Modify shutdown call to unique shutdown function to solve it.
 - Adding support to resume function
 - Using timer-of.c API
 - Modify NPCM750 compatible name.

Asked Brendon to modify NPCM7xx device tree entry.
https://lkml.org/lkml/2017/11/6/335

Changes have been tested on the NPCM750 evaluation board.

Tomer Maimon (2):
  clocksource: npcm: add NPCM7xx timer driver
  dt-binding: timer: document NPCM7xx timer DT bindings

 .../bindings/timer/nuvoton,npcm7xx-timer.txt       |  25 +++
 drivers/clocksource/Kconfig                        |   8 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/npcm7xx-timer.c                | 239 +++++++++++++++++++++
 4 files changed, 273 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
 create mode 100644 drivers/clocksource/npcm7xx-timer.c

-- 
2.14.1
