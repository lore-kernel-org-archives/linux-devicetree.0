From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH 2/4] mwifiex: Fetch wake-up interrupt from 'wake-up' subnode when it exists
Date: Sun, 24 Feb 2019 14:04:24 +0000
Message-ID: <20190224140426.3267-3-marc.zyngier@arm.com>
References: <20190224140426.3267-1-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190224140426.3267-1-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amitkumar Karwar <amitkarwar@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Ganapathi Bhat <gbhat@marvell.com>, Heiko Stuebner <heiko@sntech.de>, Kalle Valo <kvalo@codeaurora.org>, Nishant Sarmukadam <nishants@marvell.com>, Rob Herring <robh+dt@kernel.org>, Xinming Hu <huxinming820@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Encoding the wake-up interrupt as part of the PCI DT node is completely
broken, as it violates the most basic rules of PCI description in OF:
the interrupts described in such node are supposed to apply to the
PCI device, and not to some non-PCI stuff on the side.

In such a configuration, both the PCI device and the wake-up widget
end-up trying to share an interrupt. Of course, this doesn't work:
The PCI device can only generate interrupts through the root port,
while the wake-up widget uses sideband signaling that bypasses PCI
altogether. Clearly, this was never tested.

So let's first try and obtain the wake-up interrupt from a 'wake-up'
subnode, and fallback to the main DT node otherwise. This ensures
that old DTs will carry on working as bad as before (with the added
warning to let the user know about the situation), and new DT will
enjoy legacy interrupts in case MSIs are unavailable.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 drivers/net/wireless/marvell/mwifiex/main.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/main.c b/drivers/net/wireless/marvell/mwifiex/main.c
index 20cee5c397fb..2105c2b7c627 100644
--- a/drivers/net/wireless/marvell/mwifiex/main.c
+++ b/drivers/net/wireless/marvell/mwifiex/main.c
@@ -1590,17 +1590,26 @@ static void mwifiex_probe_of(struct mwifiex_adapter *adapter)
 {
 	int ret;
 	struct device *dev = adapter->dev;
+	struct device_node *wup_node;
 
 	if (!dev->of_node)
 		goto err_exit;
 
 	adapter->dt_node = dev->of_node;
-	adapter->irq_wakeup = irq_of_parse_and_map(adapter->dt_node, 0);
+	wup_node = of_get_child_by_name(adapter->dt_node, "wake-up");
+	if (!wup_node)
+		wup_node = adapter->dt_node;
+	adapter->irq_wakeup = irq_of_parse_and_map(wup_node, 0);
 	if (!adapter->irq_wakeup) {
 		dev_dbg(dev, "fail to parse irq_wakeup from device tree\n");
 		goto err_exit;
 	}
 
+	if (dev_is_pci(dev) && adapter->dt_node == wup_node)
+		dev_warn(dev,
+			 "wake-up interrupt outside 'wake-up' subnode of %pOF\n",
+			 adapter->dt_node);
+
 	ret = devm_request_irq(dev, adapter->irq_wakeup,
 			       mwifiex_irq_wakeup_handler, IRQF_TRIGGER_LOW,
 			       "wifi_wake", adapter);
-- 
2.20.1
