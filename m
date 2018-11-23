Return-Path: <SRS0=DtIy=OC=bootlin.com=miquel.raynal@kernel.org>
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/4] clk: mvebu: armada-37xx-periph: change suspend/resume time
Date: Fri, 23 Nov 2018 10:44:41 +0100
Message-Id: <20181123094444.27956-3-miquel.raynal@bootlin.com>
In-Reply-To: <20181123094444.27956-1-miquel.raynal@bootlin.com>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Armada 3700 PCIe IP relies on the PCIe clock managed by this
driver. For reasons related to the PCI core's organization when
suspending/resuming, PCI host controller drivers must reconfigure
their register at suspend_noirq()/resume_noirq() which happens after
suspend()/suspend_late() and before resume_early()/resume().

Device link support in the clock framework enforce that the clock
driver's resume() callback will be called before the PCIe
driver's. But, any resume_noirq() callback will be called before all
the registered resume() callbacks.

The solution to support PCIe resume operation is to change the
"priority" of this clock driver PM callbacks to "_noirq()".

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/mvebu/armada-37xx-periph.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 43198fb1efa4..0b4be1ce6f8b 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -713,8 +713,8 @@ static int __maybe_unused armada_3700_periph_clock_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops armada_3700_periph_clock_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(armada_3700_periph_clock_suspend,
-				armada_3700_periph_clock_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(armada_3700_periph_clock_suspend,
+				      armada_3700_periph_clock_resume)
 };
 
 static int armada_3700_periph_clock_probe(struct platform_device *pdev)
-- 
2.19.1
