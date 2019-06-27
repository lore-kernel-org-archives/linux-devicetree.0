Return-Path: <SRS0=QEaW=U2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:46237 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbfF0Mww (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Jun 2019 08:52:52 -0400
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 2/4] clk: mvebu: armada-37xx-periph: change suspend/resume time
Date: Thu, 27 Jun 2019 14:52:43 +0200
Message-Id: <20190627125245.26788-3-miquel.raynal@bootlin.com>
In-Reply-To: <20190627125245.26788-1-miquel.raynal@bootlin.com>
References: <20190627125245.26788-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Bjorn Helgaas <bhelgaas@google.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Armada 3700 PCIe IP relies on the PCIe clock managed by this
driver. For reasons related to the PCI core's organization when
suspending/resuming, PCI host controller drivers must reconfigure
their registers at suspend_noirq()/resume_noirq() which happens after
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
index 1e18c5a875bd..bee45e43a85f 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -715,8 +715,8 @@ static int __maybe_unused armada_3700_periph_clock_resume(struct device *dev)
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
