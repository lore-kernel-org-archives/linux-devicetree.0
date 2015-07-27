From: Govindraj Raja <govindraj.raja@imgtec.com>
Subject: [PATCH v4 1/7] clocksource: mips-gic: Enable the clock before using it
Date: Mon, 27 Jul 2015 15:00:12 +0100
Message-ID: <1438005618-27003-2-git-send-email-govindraj.raja@imgtec.com>
References: <1438005618-27003-1-git-send-email-govindraj.raja@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1438005618-27003-1-git-send-email-govindraj.raja@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Andrew Bresticker <abrestic@chromium.org>, James Hartley <James.Hartley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan <James.Hogan@imgtec.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
List-Id: devicetree@vger.kernel.org

From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>

For the clock to be used (e.g. get its rate through clk_get_rate)
it should be prepared and enabled first.

Also, while the clock is enabled the driver must hold a reference to it,
so let's remove the call to clk_put.

Reviewed-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 drivers/clocksource/mips-gic-timer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index b81ed1a..913585d 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -158,8 +158,13 @@ static void __init gic_clocksource_of_init(struct device_node *node)
 
 	clk = of_clk_get(node, 0);
 	if (!IS_ERR(clk)) {
+		if (clk_prepare_enable(clk) < 0) {
+			pr_err("GIC failed to enable clock\n");
+			clk_put(clk);
+			return;
+		}
+
 		gic_frequency = clk_get_rate(clk);
-		clk_put(clk);
 	} else if (of_property_read_u32(node, "clock-frequency",
 					&gic_frequency)) {
 		pr_err("GIC frequency not specified.\n");
-- 
1.9.1
