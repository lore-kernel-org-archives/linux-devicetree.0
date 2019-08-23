From: megous@megous.com
Subject: [RESEND PATCH 3/5] bluetooth: hci_bcm: Give more time to come out of reset
Date: Fri, 23 Aug 2019 12:31:37 +0200
Message-ID: <20190823103139.17687-4-megous@megous.com>
References: <20190823103139.17687-1-megous@megous.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190823103139.17687-1-megous@megous.com>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, Ondrej Jirman <megous@megous.com>
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

Some supported devices need more time to come out of reset (eg.
BCM4345C5 in AP6256).

I don't have/found a datasheet, so the value was arrive at
experimentally with the Oprange Pi 3 board. Without increased delay,
I got intermittent failures during probe. This is a Bluetooth 5.0
device, so maybe that's why it takes longer to initialize than the
others.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 drivers/bluetooth/hci_bcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 95c312ae94cf..7646636f2d18 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -260,7 +260,7 @@ static int bcm_gpio_set_power(struct bcm_device *dev, bool powered)
 	}
 
 	/* wait for device to power on and come out of reset */
-	usleep_range(10000, 20000);
+	usleep_range(100000, 120000);
 
 	dev->res_enabled = powered;
 
-- 
2.23.0
