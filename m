From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 10/15] Bluetooth: hci_bcm: Wait for device to come out of reset after power on
Date: Mon, 17 Dec 2018 12:04:44 +0800
Message-ID: <20181217040449.31437-11-wens@csie.org>
References: <20181217040449.31437-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217040449.31437-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Loic Poulain <loic.poulain@gmail.com>, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ondrej Jirman <megous@megous.com>
List-Id: devicetree@vger.kernel.org

The datasheets for BCM20702 and BCM43438 both have power up time
sequence graphs, however they are slightly different. Both chips
also have an internal power-on-reset, which holds the chip in reset
for a short time after the regulators are enabled.

For the BCM20702, the time period from when the regulators are enabled,
until the chip settles and comes out of sleep state, is 6564 ~ 8171 us.

For the BCM43438, the graph only shows the time period from when the
regulators are enabled until the chip responds by driving the host's
CTS line low, assuming the host has already driven its RTS line low.
This is shown to be 6.5 sleep cycles, with the sleep clock at 32.768
kHz. This is around 2 ms.

Wait a full 10 ms after the regulators are enabled to account for signal
rising times.

Tested-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/bluetooth/hci_bcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index f2101038284e..538ce8059bff 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -256,6 +256,9 @@ static int bcm_gpio_set_power(struct bcm_device *dev, bool powered)
 		regulator_bulk_disable(BCM_NUM_SUPPLIES, dev->supplies);
 	}
 
+	/* wait for device to power on and come out of reset */
+	usleep_range(10000, 20000);
+
 	dev->res_enabled = powered;
 
 	return 0;
-- 
2.20.0
