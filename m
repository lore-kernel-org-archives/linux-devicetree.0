From: Linus Walleij <linus.walleij@stericsson.com>
Subject: [PATCH 11/23] rtc: coh901331: add devicetree support
Date: Mon, 22 Apr 2013 11:56:05 +0200
Message-ID: <1366624566-6510-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com
Cc: devicetree-discuss@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

This add devicetree probe support to the COH 901 331 RTC
driver.

Cc: Alessandro Zummo <a.zummo@towertech.it>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi Alessandro, I'm seeking an ACK to take this patch through
the ARM SoC tree along with the code making use of it.
---
 drivers/rtc/rtc-coh901331.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/rtc/rtc-coh901331.c b/drivers/rtc/rtc-coh901331.c
index 2d28ec1..4415b57 100644
--- a/drivers/rtc/rtc-coh901331.c
+++ b/drivers/rtc/rtc-coh901331.c
@@ -276,10 +276,16 @@ static void coh901331_shutdown(struct platform_device *pdev)
 	clk_disable_unprepare(rtap->clk);
 }
 
+static const struct of_device_id coh901331_dt_match[] = {
+	{ .compatible = "stericsson,coh901331" },
+	{},
+};
+
 static struct platform_driver coh901331_driver = {
 	.driver = {
 		.name = "rtc-coh901331",
 		.owner = THIS_MODULE,
+		.of_match_table = coh901331_dt_match,
 	},
 	.remove = __exit_p(coh901331_remove),
 	.suspend = coh901331_suspend,
-- 
1.7.11.3
