From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH 3/4] mwifiex: Flag wake-up interrupt as IRQ_NOAUTOEN rather than disabling it too late
Date: Sun, 24 Feb 2019 14:04:25 +0000
Message-ID: <20190224140426.3267-4-marc.zyngier@arm.com>
References: <20190224140426.3267-1-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190224140426.3267-1-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amitkumar Karwar <amitkarwar@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Ganapathi Bhat <gbhat@marvell.com>, Heiko Stuebner <heiko@sntech.de>, Kalle Valo <kvalo@codeaurora.org>, Nishant Sarmukadam <nishants@marvell.com>, Rob Herring <robh+dt@kernel.org>, Xinming Hu <huxinming820@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The mwifiex driver makes unsafe assumptions about the state of the
wake-up interrupt. It requests it and only then disable it. Of
course, the interrupt may be screaming for whatever reason at that
time, and the handler will then be called without the interrupt
having been registered with the PM/wakeup subsystem. Oops.

The right way to handle this kind of situation is to flag the
interrupt with IRQ_NOAUTOEN before requesting it. It will then
stay disabled until someone (the wake-up subsystem) enables it.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 drivers/net/wireless/marvell/mwifiex/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/main.c b/drivers/net/wireless/marvell/mwifiex/main.c
index 2105c2b7c627..82cf35e50579 100644
--- a/drivers/net/wireless/marvell/mwifiex/main.c
+++ b/drivers/net/wireless/marvell/mwifiex/main.c
@@ -1610,6 +1610,7 @@ static void mwifiex_probe_of(struct mwifiex_adapter *adapter)
 			 "wake-up interrupt outside 'wake-up' subnode of %pOF\n",
 			 adapter->dt_node);
 
+	irq_set_status_flags(adapter->irq_wakeup, IRQ_NOAUTOEN);
 	ret = devm_request_irq(dev, adapter->irq_wakeup,
 			       mwifiex_irq_wakeup_handler, IRQF_TRIGGER_LOW,
 			       "wifi_wake", adapter);
@@ -1619,7 +1620,6 @@ static void mwifiex_probe_of(struct mwifiex_adapter *adapter)
 		goto err_exit;
 	}
 
-	disable_irq(adapter->irq_wakeup);
 	if (device_init_wakeup(dev, true)) {
 		dev_err(dev, "fail to init wakeup for mwifiex\n");
 		goto err_exit;
-- 
2.20.1
