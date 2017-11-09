From: Rick Chen <rickchen36@gmail.com>
Subject: [PATCH v4 0/3] Add andestech atcpit100 timer
Date: Thu,  9 Nov 2017 16:05:25 +0800
Message-ID: <1510214728-22441-1-git-send-email-rickchen36@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rick@andestech.com
Cc: Rick Chen <rickchen36@gmail.com>
List-Id: devicetree@vger.kernel.org

Changelog v4:
 - Patch 1/3: Changes
 - Patch 2/3: No changes
 - Patch 3/3: Changes


Patch 1/3
 1 Pre-compute some definetions
 2 Remove PWM relative
 3 Refine coding style
 4 Wrap some calls into functions
 4 Use timer-of API
 5 Correct commit content
    use channel1 timer0 as clock source
	  use channel0 timer0 as clock event

Patch 3/3
 Remove description about clock-frequency
 Add clocks description for timer-of API

Rick Chen (3):
  clocksource/drivers/atcpit100: Add andestech atcpit100 timer
  clocksource/drivers/Kconfig: Support andestech atcpit100 timer
  dt-bindings: timer: Add andestech atcpit100 timer binding doc

 .../bindings/timer/andestech,atcpit100-timer.txt   |  33 +++
 drivers/clocksource/Kconfig                        |   6 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-atcpit100.c              | 248 +++++++++++++++++++++
 4 files changed, 288 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/andestech,atcpit100-timer.txt
 create mode 100644 drivers/clocksource/timer-atcpit100.c

--

Changelog v3:

Patch 1/3
 Fix warning from kbuild test robot when make ARCH=x86_64

Patch 3/3
 Acked-by: Rob Herring <robh@kernel.org>

--

Changelog v2:

Patch 3/3
 1 Add commit msg
 2 Change rick to full name Rick Chen
 3 MOdify S-o-b

2.7.4
