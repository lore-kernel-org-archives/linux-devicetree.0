From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v6 0/5] Add system timer driver for Mediatek SoCs
Date: Wed, 4 Jul 2018 22:50:15 +0800
Message-ID: <1530715820-3406-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Changes since v5:
- Optimize driver and remove redundant register operations.
- Docuement registers.
- Fix system timer base address.

Changes since v4:
- Simplify dt-bindings.
- Add error handling for mtk_syst_init().

Changes since v3:
- Use the same binding style for both GPT and System Timer.
- Use timer_of.of_clk->period instead of private structure.
- Arrange patches to contain system timer changes in patch 5/5 only.

Changes since v2:
- Rename existed mtk_timer.c to timer-mediatek.c.
- Add system timer support into timer-mediatek.c instead of creating a new file.
- Use _gpt_ and _syst_ to identify different timers.
- Convert gpt driver to use timer_of.
- Fix system timer driver: irq flags.
- Fix bindings of both gpt and system timer.

Changes since v1:
- Use timer_of structure and APIs to make driver more clean.
- Remove unnecessary headers.
- Use fixed-clock.
- Fix indent.


Stanley Chu (5):
  clocksource/drivers/timer-mediatek: Add system timer bindings
  clocksource/drivers/timer-mediatek: Rename mtk_timer to timer-mediatek
  clocksource/drivers/timer-mediatek: Use specific prefix for GPT
  clocksource/drivers/timer-mediatek: Convert the driver to timer-of
  clocksource/drivers/timer-mediatek: Add support for system timer

 .../bindings/timer/mediatek,mtk-timer.txt          |  36 ++-
 drivers/clocksource/Makefile                       |   2 +-
 drivers/clocksource/mtk_timer.c                    | 268 -----------------
 drivers/clocksource/timer-mediatek.c               | 334 +++++++++++++++++++++
 4 files changed, 356 insertions(+), 284 deletions(-)
 delete mode 100644 drivers/clocksource/mtk_timer.c
 create mode 100644 drivers/clocksource/timer-mediatek.c
