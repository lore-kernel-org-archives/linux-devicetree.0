Return-Path: <SRS0=mSv1=PQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:45757 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728483AbfAHQ2r (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 8 Jan 2019 11:28:47 -0500
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] pinctrl: armada-37xx: change suspend/resume time
Date: Tue,  8 Jan 2019 17:28:43 +0100
Message-Id: <20190108162843.6194-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, linux-gpio@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Armada 3700 PCIe IP relies on the pinctrl IP managed by this
driver. For reasons related to the PCI core's organization when
suspending/resuming, PCI host controller drivers must reconfigure
their register at suspend_noirq()/resume_noirq() which happens after
suspend()/suspend_late() and before resume_early()/resume().

In the current state, after resuming from a suspend to RAM cycle the
PCIe IP is reconfigured before the pinctrl one which produces an
interrupt storm. The solution to support PCIe resume operation is to
change the "priority" of this pinctrl driver PM callbacks to
"_noirq()".

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 4b9f2cf94431..6462d3ca7ceb 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -1107,8 +1107,8 @@ static int armada_3700_pinctrl_resume(struct device *dev)
  * to other IO drivers.
  */
 static const struct dev_pm_ops armada_3700_pinctrl_pm_ops = {
-	.suspend_late = armada_3700_pinctrl_suspend,
-	.resume_early = armada_3700_pinctrl_resume,
+	.suspend_noirq = armada_3700_pinctrl_suspend,
+	.resume_noirq = armada_3700_pinctrl_resume,
 };
 
 #define PINCTRL_ARMADA_37XX_DEV_PM_OPS (&armada_3700_pinctrl_pm_ops)
-- 
2.19.1
