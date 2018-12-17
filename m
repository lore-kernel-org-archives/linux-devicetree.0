From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 05/15] Bluetooth: hci_bcm: Handle deferred probing for the clock supply
Date: Mon, 17 Dec 2018 12:04:39 +0800
Message-ID: <20181217040449.31437-6-wens@csie.org>
References: <20181217040449.31437-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217040449.31437-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Loic Poulain <loic.poulain@gmail.com>, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ondrej Jirman <megous@megous.com>
List-Id: devicetree@vger.kernel.org

On some systems that actually have the bluetooth controller wired up
with an extra clock signal, it's possible the bluetooth controller
probes before the clock provider. clk_get would return a defer probe
error, which was not handled by this driver.

Handle this properly, so that these systems can work reliably.

Tested-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/bluetooth/hci_bcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index ddbd8c6a0ceb..800132369134 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -907,6 +907,10 @@ static int bcm_get_resources(struct bcm_device *dev)
 
 	dev->clk = devm_clk_get(dev->dev, NULL);
 
+	/* Handle deferred probing */
+	if (dev->clk == ERR_PTR(-EPROBE_DEFER))
+		return PTR_ERR(dev->clk);
+
 	dev->device_wakeup = devm_gpiod_get_optional(dev->dev, "device-wakeup",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(dev->device_wakeup))
-- 
2.20.0
