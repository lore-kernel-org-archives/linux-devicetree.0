From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v2 0/2] Add system timer driver for Mediatek SoCs
Date: Wed, 27 Jun 2018 15:53:57 +0800
Message-ID: <1530086039-3763-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch adds a new driver for system timer on the Mediatek SoCs.

Changes since v1:
- Use timer_of structure and APIs to make driver more clean.
- Remove unnecessary headers.
- Use fixed-clock.
- Fix indent.


Stanley Chu (2):
  dt-bindings: Add mtk-systimer bindings
  clocksource/drivers/mtk_systimer: Add support for Mediatek SoCs

 .../bindings/timer/mediatek,mtk-systimer.txt       |  18 +++
 drivers/clocksource/Kconfig                        |  13 +-
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/mtk_systimer.c                 | 132 +++++++++++++++++++++
 4 files changed, 162 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt
 create mode 100644 drivers/clocksource/mtk_systimer.c
