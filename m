From: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 2/3] mwifiex: parse chip specific gpio from device tree
Date: Mon, 8 Feb 2016 02:15:27 -0800
Message-ID: <1454926528-17480-2-git-send-email-akarwar@marvell.com>
References: <1454926528-17480-1-git-send-email-akarwar@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454926528-17480-1-git-send-email-akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>

This patch parse chip specific gpio parameter from device
tree. Corresponding binding file is also updated.

Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/mwifiex.txt  | 6 ++++--
 drivers/net/wireless/marvell/mwifiex/sta_cmd.c | 9 +++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mwifiex.txt b/Documentation/devicetree/bindings/mwifiex.txt
index 39b6a74..367c97e 100644
--- a/Documentation/devicetree/bindings/mwifiex.txt
+++ b/Documentation/devicetree/bindings/mwifiex.txt
@@ -11,7 +11,9 @@ Optional properties:
   - mwifiex,caldata* : A series of properties with marvell,caldata prefix,
   		      represent Calibration data downloaded to the device during
 		      initialization. This is an array of unsigned values.
-
+  - mwifiex,chip-gpio : Chip's wakeup gpio pin number. This needs to be downloaded
+			to to firmware. Chip notifies wifi wakeup signal to SOC
+			through this pin.
 
 Example:
 
@@ -24,6 +26,6 @@ mwifiex {
 
 	mwifiex,caldata_00_txpwrlimit_2g_cfg_set = /bits/ 8 <
 0x01 0x00 0x06 0x00 0x08 0x02 0x89 0x01 ...>;
-
+	mwifiex,chip-gpio = <3>;
 };
 
diff --git a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
index a8b6939..8c011eb 100644
--- a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
+++ b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
@@ -2134,6 +2134,7 @@ int mwifiex_sta_init_cmd(struct mwifiex_private *priv, u8 first_sta, bool init)
 	enum state_11d_t state_11d;
 	struct mwifiex_ds_11n_tx_cfg tx_cfg;
 	u8 sdio_sp_rx_aggr_enable;
+	u32 data;
 
 	if (first_sta) {
 		if (priv->adapter->iface_type == MWIFIEX_PCIE) {
@@ -2157,6 +2158,14 @@ int mwifiex_sta_init_cmd(struct mwifiex_private *priv, u8 first_sta, bool init)
 		adapter->dt_node = mwifiex_plt_dev ?
 				mwifiex_plt_dev->dev.of_node : NULL;
 		if (adapter->dt_node) {
+			if (of_property_read_u32(adapter->dt_node,
+						 "mwifiex,chip-gpio",
+						 &data) == 0) {
+				mwifiex_dbg(adapter, INFO,
+					    "chip_gpio = 0x%x\n", data);
+				adapter->hs_cfg.gpio = data;
+			}
+
 			ret = mwifiex_dnld_dt_cfgdata(priv, adapter->dt_node,
 						      "mwifiex,caldata");
 			if (ret)
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
