From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v2 1/4] clk: bcm2835: More flexible IO register remapping
Date: Mon, 12 Jun 2017 15:25:09 +0100
Message-ID: <28279803-78d2-4231-939b-89a8c895aba9@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-clk-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The BCM2835 AUX block contains two registers - AUXIRQ and AUXENB.
The addition of an irqchip driver using AUXIRQ is hampered by
the current DT node reserving both registers with a compatible string
claimed by this bcm2835-aux-clk driver.

Ease the transition to separate DT nodes by detecting and handling
the case where this driver's MEM resource has been reduced to include
only the AUXENB register. Otherwise, use devm_ioremap to remap the
region without reserving it.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
---
 drivers/clk/bcm/clk-bcm2835-aux.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835-aux.c b/drivers/clk/bcm/clk-bcm2835-aux.c
index bd750cf..70d389e 100644
--- a/drivers/clk/bcm/clk-bcm2835-aux.c
+++ b/drivers/clk/bcm/clk-bcm2835-aux.c
@@ -37,9 +37,22 @@ static int bcm2835_aux_clk_probe(struct platform_device *pdev)
 	parent = __clk_get_name(parent_clk);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(dev, res);
-	if (IS_ERR(reg))
-		return PTR_ERR(reg);
+	/*
+	 * If the MEM resource is only 4 bytes long it covers just the
+	 * AUXENB register, otherwise it is the entire AUX block.
+	 */
+	if (resource_size(res) == 4) {
+		reg = devm_ioremap_resource(dev, res);
+		if (IS_ERR(reg))
+			return PTR_ERR(reg);
+		gate = reg;
+	} else {
+		reg = devm_ioremap(dev, res->start, resource_size(res));
+		if (IS_ERR(reg))
+			return PTR_ERR(reg);
+		gate = reg + BCM2835_AUXENB;
+	}
+
 
 	onecell = devm_kmalloc(dev, sizeof(*onecell) + sizeof(*onecell->hws) *
 			       BCM2835_AUX_CLOCK_COUNT, GFP_KERNEL);
@@ -47,7 +60,6 @@ static int bcm2835_aux_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	onecell->num = BCM2835_AUX_CLOCK_COUNT;
 
-	gate = reg + BCM2835_AUXENB;
 	onecell->hws[BCM2835_AUX_CLOCK_UART] =
 		clk_hw_register_gate(dev, "aux_uart", parent, 0, gate, 0, 0, NULL);
 
-- 
1.9.1

