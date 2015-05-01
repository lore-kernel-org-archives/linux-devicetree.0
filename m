From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH 1/7] clocksource: mediatek: Don't run event_handler if it is NULL
Date: Fri, 1 May 2015 15:43:24 +0800
Message-ID: <1430466210-22963-2-git-send-email-yingjoe.chen@mediatek.com>
References: <1430466210-22963-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430466210-22963-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jason Cooper <jason@lakedaemon.net>, Catalin Marinas <catalin.marinas@arm.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Marc Carino <marc.ceeeee@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Spurious timer interrupt is noticed in mtk timer and cause kernel
crash. In mtk_timer_interrupt(), only run event_handler if it is
not NULL.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 drivers/clocksource/mtk_timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index 68ab423..85e0ab5 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -143,7 +143,8 @@ static irqreturn_t mtk_timer_interrupt(int irq, void *dev_id)
 
 	/* Acknowledge timer0 irq */
 	writel(GPT_IRQ_ACK(GPT_CLK_EVT), evt->gpt_base + GPT_IRQ_ACK_REG);
-	evt->dev.event_handler(&evt->dev);
+	if (evt->dev.event_handler)
+		evt->dev.event_handler(&evt->dev);
 
 	return IRQ_HANDLED;
 }
-- 
1.8.1.1.dirty
