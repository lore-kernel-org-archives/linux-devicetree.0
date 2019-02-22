From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 1/3] Bluetooth: btusb: add QCA6174A compatible properties
Date: Fri, 22 Feb 2019 14:53:43 -0800
Message-ID: <20190222225345.69084-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Rajat Jain <rajatja@google.com>, Robin Murphy <robin.murphy@arm.com>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

We may need to specify a GPIO wake pin for this device, so add a
compatible property for it.

There are at least to USB PID/VID variations of this chip: one with a
Lite-On ID and one with an Atheros ID.

Signed-off-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
v2:
 * drop leading zeroes from VID, per documented binding
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 470ee68555d9..54cb5f583b1d 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2862,6 +2862,8 @@ static irqreturn_t btusb_oob_wake_handler(int irq, void *priv)
 
 static const struct of_device_id btusb_match_table[] = {
 	{ .compatible = "usb1286,204e" },
+	{ .compatible = "usbcf3,e300" }, /* QCA6174A */
+	{ .compatible = "usb4ca,301a" }, /* QCA6174A (Lite-On) */
 	{ }
 };
 MODULE_DEVICE_TABLE(of, btusb_match_table);
-- 
2.21.0.rc0.258.g878e2cd30e-goog
