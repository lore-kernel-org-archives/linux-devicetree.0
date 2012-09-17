From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 14/16] MTD: atmel nand: fix gpio missing request
Date: Mon, 17 Sep 2012 17:27:11 +0200
Message-ID: <1347895633-1763-14-git-send-email-plagnioj@jcrosoft.com>
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

without this the gpio will not be muxed as a gpio by the current custom pinmux
or later by the pinctrl

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 drivers/mtd/nand/atmel_nand.c |   50 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 97ac671..7275ad4 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -583,8 +583,41 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	nand_chip->IO_ADDR_W = host->io_base;
 	nand_chip->cmd_ctrl = atmel_nand_cmd_ctrl;
 
-	if (gpio_is_valid(host->board.rdy_pin))
+	if (gpio_is_valid(host->board.rdy_pin)) {
+		res = devm_gpio_request(&pdev->dev,
+				host->board.rdy_pin, "nand_rdy");
+		if (res < 0) {
+			dev_err(&pdev->dev,
+				"can't request rdy gpio %d\n", host->board.rdy_pin);
+			goto err_ecc_ioremap;
+		}
+
+		res = gpio_direction_input(host->board.rdy_pin);
+		if (res < 0) {
+			dev_err(&pdev->dev,
+				"can't request input direction rdy gpio %d\n", host->board.rdy_pin);
+			goto err_ecc_ioremap;
+		}
+
 		nand_chip->dev_ready = atmel_nand_device_ready;
+	}
+
+	if (gpio_is_valid(host->board.enable_pin)) {
+		res = devm_gpio_request(&pdev->dev,
+				host->board.enable_pin, "nand_enable");
+		if (res < 0) {
+			dev_err(&pdev->dev,
+				"can't request enable gpio %d\n", host->board.enable_pin);
+			goto err_ecc_ioremap;
+		}
+
+		res = gpio_direction_output(host->board.enable_pin, 1);
+		if (res < 0) {
+			dev_err(&pdev->dev,
+				"can't request output direction enable gpio %d\n", host->board.enable_pin);
+			goto err_ecc_ioremap;
+		}
+	}
 
 	nand_chip->ecc.mode = host->board.ecc_mode;
 
@@ -622,6 +655,21 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	atmel_nand_enable(host);
 
 	if (gpio_is_valid(host->board.det_pin)) {
+		res = devm_gpio_request(&pdev->dev,
+				host->board.det_pin, "nand_det");
+		if (res < 0) {
+			dev_err(&pdev->dev,
+				"can't request det gpio %d\n", host->board.det_pin);
+			goto err_no_card;
+		}
+
+		res = gpio_direction_input(host->board.det_pin);
+		if (res < 0) {
+			dev_err(&pdev->dev,
+				"can't request input direction det gpio %d\n", host->board.det_pin);
+			goto err_no_card;
+		}
+
 		if (gpio_get_value(host->board.det_pin)) {
 			printk(KERN_INFO "No SmartMedia card inserted.\n");
 			res = -ENXIO;
-- 
1.7.10.4
