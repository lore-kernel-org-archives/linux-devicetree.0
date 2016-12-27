From: Bai Ping <ping.bai@nxp.com>
Subject: [PATCH v2 02/12] driver: clocksource: add gpt timer for imx6sll
Date: Tue, 27 Dec 2016 17:47:40 +0800
Message-ID: <1482832070-22668-3-git-send-email-ping.bai@nxp.com>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, daniel.lezcano@linaro.org, linux-gpio@vger.kernel.org, p.zabel@pengutronix.de, jacky.baip@gmail.com, fabio.estevam@nxp.com, tglx@linutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add gpt timer support for i.MX6SLL.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
 drivers/clocksource/timer-imx-gpt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
index f595460..f71822d 100644
--- a/drivers/clocksource/timer-imx-gpt.c
+++ b/drivers/clocksource/timer-imx-gpt.c
@@ -556,4 +556,5 @@ static int __init imx6dl_timer_init_dt(struct device_node *np)
 CLOCKSOURCE_OF_DECLARE(imx6q_timer, "fsl,imx6q-gpt", imx31_timer_init_dt);
 CLOCKSOURCE_OF_DECLARE(imx6dl_timer, "fsl,imx6dl-gpt", imx6dl_timer_init_dt);
 CLOCKSOURCE_OF_DECLARE(imx6sl_timer, "fsl,imx6sl-gpt", imx6dl_timer_init_dt);
+CLOCKSOURCE_OF_DECLARE(imx6sll_timer, "fsl,imx6sll-gpt", imx6dl_timer_init_dt);
 CLOCKSOURCE_OF_DECLARE(imx6sx_timer, "fsl,imx6sx-gpt", imx6dl_timer_init_dt);
-- 
1.9.1
