From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: [PATCH net-next 2/6] ocelot: Refactor common ocelot probing code to ocelot_init
Date: Fri, 21 Jun 2019 18:38:48 +0300
Message-ID: <1561131532-14860-3-git-send-email-claudiu.manoil@nxp.com>
References: <1561131532-14860-1-git-send-email-claudiu.manoil@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1561131532-14860-1-git-send-email-claudiu.manoil@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Allan Nielsen <Allan.Nielsen@microsemi.com>, alexandru.marginean@nxp.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com
List-Id: devicetree@vger.kernel.org

This is just common path code that belogs to ocelot_init,
it has nothing to do with a specific SoC/board instance.
Add allocation err check in the process.

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
 drivers/net/ethernet/mscc/ocelot.c       | 6 ++++++
 drivers/net/ethernet/mscc/ocelot_board.c | 4 ----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mscc/ocelot.c b/drivers/net/ethernet/mscc/ocelot.c
index 66cf57e6fd76..f07c398f8b21 100644
--- a/drivers/net/ethernet/mscc/ocelot.c
+++ b/drivers/net/ethernet/mscc/ocelot.c
@@ -1674,6 +1674,11 @@ int ocelot_init(struct ocelot *ocelot)
 	int i, cpu = ocelot->num_phys_ports;
 	char queue_name[32];
 
+	ocelot->ports = devm_kcalloc(ocelot->dev, ocelot->num_phys_ports,
+				     sizeof(struct ocelot_port *), GFP_KERNEL);
+	if (!ocelot->ports)
+		return -ENOMEM;
+
 	ocelot->lags = devm_kcalloc(ocelot->dev, ocelot->num_phys_ports,
 				    sizeof(u32), GFP_KERNEL);
 	if (!ocelot->lags)
@@ -1692,6 +1697,7 @@ int ocelot_init(struct ocelot *ocelot)
 	if (!ocelot->stats_queue)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&ocelot->multicast);
 	ocelot_mact_init(ocelot);
 	ocelot_vlan_init(ocelot);
 	ocelot_ace_init(ocelot);
diff --git a/drivers/net/ethernet/mscc/ocelot_board.c b/drivers/net/ethernet/mscc/ocelot_board.c
index 58bde1a9eacb..2a6ee4edb858 100644
--- a/drivers/net/ethernet/mscc/ocelot_board.c
+++ b/drivers/net/ethernet/mscc/ocelot_board.c
@@ -255,10 +255,6 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
 
 	ocelot->num_phys_ports = of_get_child_count(ports);
 
-	ocelot->ports = devm_kcalloc(&pdev->dev, ocelot->num_phys_ports,
-				     sizeof(struct ocelot_port *), GFP_KERNEL);
-
-	INIT_LIST_HEAD(&ocelot->multicast);
 	ocelot_init(ocelot);
 
 	for_each_available_child_of_node(ports, portnp) {
-- 
2.17.1
