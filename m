From: Dave Martin <dave.martin@linaro.org>
Subject: [PATCH] net/smsc911x: Correctly configure 16-bit register access from DT
Date: Tue, 13 Sep 2011 11:49:29 +0100
Message-ID: <1315910969-4018-1-git-send-email-dave.martin@linaro.org>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: patches@linaro.org, Steve Glendinning <steve.glendinning@smsc.com>, Shawn Guo <shawn.guo@linaro.org>, devicetree-discuss@lists.ozlabs.org, Dave Martin <dave.martin@linaro.org>
List-Id: devicetree@vger.kernel.org

The SMSC911X_USE_16BIT needs to be set when using 16-bit register
access.  However, currently no flag is set if the device tree
doesn't specify 32-bit access, resulting in a BUG() and a non-
working driver when 16-bit register access is configured for
smsc911x in the DT.

This patch should set the SMSC911X_USE_16BIT flag in a manner
consistent with the documented DT bindings.

Signed-off-by: Dave Martin <dave.martin@linaro.org>
---
 drivers/net/ethernet/smsc/smsc911x.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smsc911x.c b/drivers/net/ethernet/smsc/smsc911x.c
index 788c4fd..a3aa4c0 100644
--- a/drivers/net/ethernet/smsc/smsc911x.c
+++ b/drivers/net/ethernet/smsc/smsc911x.c
@@ -2121,6 +2121,8 @@ static int __devinit smsc911x_probe_config_dt(
 	of_property_read_u32(np, "reg-io-width", &width);
 	if (width == 4)
 		config->flags |= SMSC911X_USE_32BIT;
+	else
+		config->flags |= SMSC911X_USE_16BIT;
 
 	if (of_get_property(np, "smsc,irq-active-high", NULL))
 		config->irq_polarity = SMSC911X_IRQ_POLARITY_ACTIVE_HIGH;
-- 
1.7.4.1
