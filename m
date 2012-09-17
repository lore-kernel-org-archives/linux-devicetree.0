From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 16/16] MTD: atmel_nand: add pinctrl consumer support
Date: Mon, 17 Sep 2012 17:27:13 +0200
Message-ID: <1347895633-1763-16-git-send-email-plagnioj@jcrosoft.com>
References: <20120917140423.GA17667@game.jcrosoft.org>
 <1347895633-1763-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1347895633-1763-1-git-send-email-plagnioj@jcrosoft.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 drivers/mtd/nand/atmel_nand.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 7275ad4..f48587b 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -39,6 +39,7 @@
 #include <linux/gpio.h>
 #include <linux/io.h>
 #include <linux/platform_data/atmel.h>
+#include <linux/pinctrl/consumer.h>
 
 #include <mach/cpu.h>
 
@@ -539,6 +540,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	struct resource *mem;
 	struct mtd_part_parser_data ppdata = {};
 	int res;
+	struct pinctrl *pinctrl;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem) {
@@ -583,6 +585,13 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	nand_chip->IO_ADDR_W = host->io_base;
 	nand_chip->cmd_ctrl = atmel_nand_cmd_ctrl;
 
+	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
+	if (IS_ERR(pinctrl)) {
+		dev_err(host->dev, "Failed to request pinctrl\n");
+		res = PTR_ERR(pinctrl);
+		goto err_ecc_ioremap;
+	}
+
 	if (gpio_is_valid(host->board.rdy_pin)) {
 		res = devm_gpio_request(&pdev->dev,
 				host->board.rdy_pin, "nand_rdy");
-- 
1.7.10.4
