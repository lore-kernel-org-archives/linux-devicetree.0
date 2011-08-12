From: Robin Holt <holt@sgi.com>
Subject: [PATCH v12 4/6] flexcan: Add of_match to platform_device definition.
Date: Fri, 12 Aug 2011 03:45:50 -0500
Message-ID: <1313138752-24006-5-git-send-email-holt@sgi.com>
References: <1313138752-24006-1-git-send-email-holt@sgi.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1313138752-24006-1-git-send-email-holt@sgi.com>
Sender: netdev-owner@vger.kernel.org
To: Kumar Gala <galak@kernel.crashing.org>
Cc: Robin Holt <holt@sgi.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Wolfgang Grandegger <wg@grandegger.com>, U Bhaskar-B22300 <B22300@freescale.com>, Grant Likely <grant.likely@secretlab.ca>, socketcan-core@lists.berlios.de, netdev@vger.kernel.org, PPC list <linuxppc-dev@lists.ozlabs.org>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On powerpc, the OpenFirmware devices are not matched without specifying
an of_match array.  Introduce that array as that is used for matching
on the Freescale P1010 processor.

Signed-off-by: Robin Holt <holt@sgi.com>
Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
Acked-by: Wolfgang Grandegger <wg@grandegger.com>
Cc: U Bhaskar-B22300 <B22300@freescale.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: socketcan-core@lists.berlios.de
Cc: netdev@vger.kernel.org
Cc: PPC list <linuxppc-dev@lists.ozlabs.org>
Cc: devicetree-discuss@lists.ozlabs.org
---
 drivers/net/can/flexcan.c |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/drivers/net/can/flexcan.c b/drivers/net/can/flexcan.c
index 68cbe52..662f832 100644
--- a/drivers/net/can/flexcan.c
+++ b/drivers/net/can/flexcan.c
@@ -1027,8 +1027,19 @@ static int __devexit flexcan_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static struct of_device_id flexcan_of_match[] = {
+	{
+		.compatible = "fsl,flexcan",
+	},
+	{},
+};
+
 static struct platform_driver flexcan_driver = {
-	.driver.name = DRV_NAME,
+	.driver = {
+		.name = DRV_NAME,
+		.owner = THIS_MODULE,
+		.of_match_table = flexcan_of_match,
+	},
 	.probe = flexcan_probe,
 	.remove = __devexit_p(flexcan_remove),
 };
-- 
1.7.2.1

