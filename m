From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v4 0/5] Add system timer driver for Mediatek SoCs
Date: Fri, 29 Jun 2018 08:17:21 +0800
Message-ID: <1530231446-13760-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch adds a new driver for system timer on the Mediatek SoCs.

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
