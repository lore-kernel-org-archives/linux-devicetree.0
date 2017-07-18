From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 3/4] gpio: davinci: Add a separate compatible for keystone-k2g
 soc
Date: Tue, 18 Jul 2017 16:27:15 +0530
Message-ID: <1500375436-9435-4-git-send-email-j-keerthy@ti.com>
References: <1500375436-9435-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1500375436-9435-1-git-send-email-j-keerthy@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org, ssantosh@kernel.org
Cc: devicetree@vger.kernel.org, j-keerthy@ti.com, nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, fcooper@ti.com
List-Id: devicetree@vger.kernel.org

Add a separate compatible for keystone-k2g soc

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 Documentation/devicetree/bindings/gpio/gpio-davinci.txt | 3 ++-
 drivers/gpio/gpio-davinci.c                             | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
index 5079ba7..1a5c1a2 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
@@ -1,7 +1,8 @@
 Davinci/Keystone GPIO controller bindings
 
 Required Properties:
-- compatible: should be "ti,dm6441-gpio", "ti,keystone-gpio"
+- compatible: should be "ti,dm6441-gpio", "ti,keystone-gpio",
+	      "ti,keystone-k2g-gpio"
 
 - reg: Physical base address of the controller and the size of memory mapped
        registers.
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 932f270..a8d8dd9 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -610,6 +610,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 static const struct of_device_id davinci_gpio_ids[] = {
 	{ .compatible = "ti,keystone-gpio", keystone_gpio_get_irq_chip},
 	{ .compatible = "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
+	{ .compatible = "ti,keystone-k2g-gpio", keystone_gpio_get_irq_chip},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, davinci_gpio_ids);
-- 
1.9.1
