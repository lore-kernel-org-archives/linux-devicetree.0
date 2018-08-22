From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 9/9] power: supply: twl4030-charger: fix OF sibling-node lookup
Date: Wed, 22 Aug 2018 12:55:47 +0200
Message-ID: <20180822105547.9634-10-johan@kernel.org>
References: <20180822105547.9634-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180822105547.9634-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable <stable@vger.kernel.org>, NeilBrown <neilb@suse.de>, Felipe Balbi <balbi@ti.com>, Sebastian Reichel <sre@kernel.org>
List-Id: devicetree@vger.kernel.org

Use the new of_get_compatible_child() helper to lookup the usb sibling
node instead of using of_find_compatible_node(), which searches the
entire tree and thus can return an unrelated (non-sibling) node.

This also addresses a potential use-after-free (e.g. after probe
deferral) as the tree-wide helper drops a reference to its first
argument (i.e. the parent device node).

While at it, also fix the related phy-node reference leak.

Fixes: f5e4edb8c888 ("power: twl4030_charger: find associated phy by more reliable means.")
Cc: stable <stable@vger.kernel.org>     # 4.2
Cc: NeilBrown <neilb@suse.de>
Cc: Felipe Balbi <balbi@ti.com>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/power/supply/twl4030_charger.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/twl4030_charger.c b/drivers/power/supply/twl4030_charger.c
index bbcaee56db9d..b6a7d9f74cf3 100644
--- a/drivers/power/supply/twl4030_charger.c
+++ b/drivers/power/supply/twl4030_charger.c
@@ -996,12 +996,13 @@ static int twl4030_bci_probe(struct platform_device *pdev)
 	if (bci->dev->of_node) {
 		struct device_node *phynode;
 
-		phynode = of_find_compatible_node(bci->dev->of_node->parent,
-						  NULL, "ti,twl4030-usb");
+		phynode = of_get_compatible_child(bci->dev->of_node->parent,
+						  "ti,twl4030-usb");
 		if (phynode) {
 			bci->usb_nb.notifier_call = twl4030_bci_usb_ncb;
 			bci->transceiver = devm_usb_get_phy_by_node(
 				bci->dev, phynode, &bci->usb_nb);
+			of_node_put(phynode);
 			if (IS_ERR(bci->transceiver)) {
 				ret = PTR_ERR(bci->transceiver);
 				if (ret == -EPROBE_DEFER)
-- 
2.18.0
