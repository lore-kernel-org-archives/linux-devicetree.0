From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 11/15] Bluetooth: hci_bcm: Add BCM20702A1 variant
Date: Wed,  7 Nov 2018 18:13:04 +0800
Message-ID: <20181107101308.7626-12-wens@csie.org>
References: <20181107101308.7626-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBRHVRLPQKGQEBPBIW6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181107101308.7626-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

The BCM20702A1 chip is a single-chip Bluetooth 4.0 controller and
transceiver. It is found in the AMPAK AP6210 WiFi+BT package.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/bluetooth/btbcm.c   | 6 ++++++
 drivers/bluetooth/hci_bcm.c | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index e3e4d929e74f..22d4b530da03 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -33,6 +33,7 @@
 #define VERSION "0.1"
 
 #define BDADDR_BCM20702A0 (&(bdaddr_t) {{0x00, 0xa0, 0x02, 0x70, 0x20, 0x00}})
+#define BDADDR_BCM20702A1 (&(bdaddr_t) {{0x00, 0x00, 0xa0, 0x02, 0x70, 0x20}})
 #define BDADDR_BCM4324B3 (&(bdaddr_t) {{0x00, 0x00, 0x00, 0xb3, 0x24, 0x43}})
 #define BDADDR_BCM4330B1 (&(bdaddr_t) {{0x00, 0x00, 0x00, 0xb1, 0x30, 0x43}})
 
@@ -64,6 +65,9 @@ int btbcm_check_bdaddr(struct hci_dev *hdev)
 	 * The address 00:20:70:02:A0:00 indicates a BCM20702A0 controller
 	 * with no configured address.
 	 *
+	 * The address 20:70:02:A0:00:00 indicates a BCM20702A1 controller
+	 * with no configured address.
+	 *
 	 * The address 43:24:B3:00:00:00 indicates a BCM4324B3 controller
 	 * with waiting for configuration state.
 	 *
@@ -71,6 +75,7 @@ int btbcm_check_bdaddr(struct hci_dev *hdev)
 	 * with waiting for configuration state.
 	 */
 	if (!bacmp(&bda->bdaddr, BDADDR_BCM20702A0) ||
+	    !bacmp(&bda->bdaddr, BDADDR_BCM20702A1) ||
 	    !bacmp(&bda->bdaddr, BDADDR_BCM4324B3) ||
 	    !bacmp(&bda->bdaddr, BDADDR_BCM4330B1)) {
 		bt_dev_info(hdev, "BCM: Using default device address (%pMR)",
@@ -330,6 +335,7 @@ static const struct bcm_subver_table bcm_uart_subver_table[] = {
 	{ 0x2209, "BCM43430A1"  },	/* 001.002.009 */
 	{ 0x6119, "BCM4345C0"	},	/* 003.001.025 */
 	{ 0x230f, "BCM4356A2"	},	/* 001.003.015 */
+	{ 0x220e, "BCM20702A1"  },	/* 001.002.014 */
 	{ }
 };
 
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index bf5dee9b04d8..73b520622a24 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -1396,6 +1396,7 @@ static void bcm_serdev_remove(struct serdev_device *serdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id bcm_bluetooth_of_match[] = {
+	{ .compatible = "brcm,bcm20702a1" },
 	{ .compatible = "brcm,bcm43438-bt" },
 	{ },
 };
-- 
2.19.1
