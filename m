From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 6/9] tty: pxa: configure pin
Date: Tue, 23 Oct 2012 00:08:56 +0800
Message-ID: <1350922139-3693-7-git-send-email-haojian.zhuang@gmail.com>
References: <1350922139-3693-1-git-send-email-haojian.zhuang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1350922139-3693-1-git-send-email-haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Configure pins by pinctrl driver.

Signed-off-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/tty/serial/pxa.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/tty/serial/pxa.c b/drivers/tty/serial/pxa.c
index 9033fc6..02dc771 100644
--- a/drivers/tty/serial/pxa.c
+++ b/drivers/tty/serial/pxa.c
@@ -37,6 +37,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
@@ -809,6 +810,7 @@ static int serial_pxa_probe_dt(struct platform_device *pdev,
 			       struct uart_pxa_port *sport)
 {
 	struct device_node *np = pdev->dev.of_node;
+	struct pinctrl *pinctrl;
 	int ret;
 
 	if (!np)
@@ -819,6 +821,10 @@ static int serial_pxa_probe_dt(struct platform_device *pdev,
 		dev_err(&pdev->dev, "failed to get alias id, errno %d\n", ret);
 		return ret;
 	}
+	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
+	if (IS_ERR(pinctrl))
+		return -EPROBE_DEFER;
+
 	sport->port.line = ret;
 	return 0;
 }
@@ -857,7 +863,7 @@ static int serial_pxa_probe(struct platform_device *dev)
 	ret = serial_pxa_probe_dt(dev, sport);
 	if (ret > 0)
 		sport->port.line = dev->id;
-	else if (ret < 0)
+	if (ret < 0)
 		goto err_clk;
 	snprintf(sport->name, PXA_NAME_LEN - 1, "UART%d", sport->port.line + 1);
 
-- 
1.7.0.4
