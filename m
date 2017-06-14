From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v3 1/4] clk: bcm2835: More flexible IO register remapping
Date: Wed, 14 Jun 2017 17:29:07 +0100
Message-ID: <1497457750-35585-2-git-send-email-phil@raspberrypi.org>
References: <4ceb6c92-f752-180e-6a6e-a94dcd120737@raspberrypi.org>
 <1497457750-35585-1-git-send-email-phil@raspberrypi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497457750-35585-1-git-send-email-phil@raspberrypi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Phil Elwell <phil@raspberrypi.org>
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
 drivers/clk/bcm/clk-bcm2835-aux.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835-aux.c b/drivers/clk/bcm/clk-bcm2835-aux.c
index bd750cf..7b99395 100644
--- a/drivers/clk/bcm/clk-bcm2835-aux.c
+++ b/drivers/clk/bcm/clk-bcm2835-aux.c
@@ -37,9 +37,29 @@ static int bcm2835_aux_clk_probe(struct platform_device *pdev)
 	parent = __clk_get_name(parent_clk);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(dev, res);
-	if (IS_ERR(reg))
-		return PTR_ERR(reg);
+
+	/*
+	 * If the MEM resource is only 4 bytes long it covers just the
+	 * AUXENB register, otherwise it is the entire AUX block.
+	 *
+	 * If remapping the entire block, use devm_ioremap rather than
+	 * devm_ioremap_resource to avoid requesting the mem_region.
+	 *
+	 * N.B. This if/else can be replaced with the if body once the
+	 * new DT bindings are in use.
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
@@ -47,7 +67,6 @@ static int bcm2835_aux_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	onecell->num = BCM2835_AUX_CLOCK_COUNT;
 
-	gate = reg + BCM2835_AUXENB;
 	onecell->hws[BCM2835_AUX_CLOCK_UART] =
 		clk_hw_register_gate(dev, "aux_uart", parent, 0, gate, 0, 0, NULL);
 
-- 
1.9.1
