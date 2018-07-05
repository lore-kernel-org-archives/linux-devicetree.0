From: Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v9 0/5] Add system timer driver for Mediatek SoCs
Date: Fri, 6 Jul 2018 07:11:23 +0800
Message-ID: <1530832288-8156-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Changes since v8:
- Sorry for stupid mistake that no updated file in v7. Just re-send correct file in v7.

Changes since v7:
- Fix dt-bindings:
    - Fix clock description and add commit message to explain RTC clock removal.
    - Add new line in end of file.

Changes since v6:
- Remove duplicated variable gpt_sched_reg.
- Remove log for mtk_syst_init().

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

 .../bindings/timer/mediatek,mtk-timer.txt          |  34 ++-
 drivers/clocksource/Makefile                       |   2 +-
 drivers/clocksource/mtk_timer.c                    | 268 -----------------
 drivers/clocksource/timer-mediatek.c               | 328 +++++++++++++++++++++
 4 files changed, 349 insertions(+), 283 deletions(-)
 delete mode 100644 drivers/clocksource/mtk_timer.c
 create mode 100644 drivers/clocksource/timer-mediatek.c
