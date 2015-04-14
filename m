From: "Mark A. Greer" <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH] NFC: trf7970a: Handle extra byte in response to Type 5 RMB commands
Date: Tue, 14 Apr 2015 14:51:24 -0700
Message-ID: <1429048284-8916-1-git-send-email-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, "Mark A. Greer" <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The current versions of the trf7970a has an erratum where it returns
an extra byte in the response to 'Read Multiple Block' (RMB) commands.
This command is issued to Type 5 tags (i.e., ISO/IEC 15693 tags) by
the neard daemon.

To handle this, define a new Device Tree property,
't5t-rmb-extra-byte-quirk', which indicates that the associated
trf7970a device has this erratum.  The trf7970a device driver
will then ensure that the response length to RMB commands is
reduced by one byte (for devices with the erratum).

Signed-off-by: Mark A. Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
---
 .../devicetree/bindings/net/nfc/trf7970a.txt       |  4 ++++
 drivers/nfc/trf7970a.c                             | 23 ++++++++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt b/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
index 7c89ca2..32b35a0 100644
--- a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
+++ b/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
@@ -18,6 +18,9 @@ Optional SoC Specific Properties:
   "IRQ Status Read" erratum.
 - en2-rf-quirk: Specify that the trf7970a being used has the "EN2 RF"
   erratum.
+- t5t-rmb-extra-byte-quirk: Specify that the trf7970a has the erratum
+  where an extra byte is returned by Read Multiple Block commands issued
+  to Type 5 tags.
 
 Example (for ARM-based BeagleBone with TRF7970A on SPI1):
 
@@ -39,6 +42,7 @@ Example (for ARM-based BeagleBone with TRF7970A on SPI1):
 		autosuspend-delay = <30000>;
 		irq-status-read-quirk;
 		en2-rf-quirk;
+		t5t-rmb-extra-byte-quirk;
 		status = "okay";
 	};
 };
diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index aa6a333..85b4d86 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -149,6 +149,7 @@
  */
 #define TRF7970A_QUIRK_IRQ_STATUS_READ		BIT(0)
 #define TRF7970A_QUIRK_EN2_MUST_STAY_LOW	BIT(1)
+#define TRF7970A_QUIRK_T5T_RMB_EXTRA_BYTE	BIT(2)
 
 /* Direct commands */
 #define TRF7970A_CMD_IDLE			0x00
@@ -446,6 +447,7 @@ struct trf7970a {
 	u8				md_rf_tech;
 	u8				tx_cmd;
 	bool				issue_eof;
+	bool				adjust_resp_len;
 	int				en2_gpio;
 	int				en_gpio;
 	struct mutex			lock;
@@ -626,6 +628,11 @@ static void trf7970a_send_upstream(struct trf7970a *trf)
 		trf->aborting = false;
 	}
 
+	if (trf->adjust_resp_len) {
+		skb_trim(trf->rx_skb, trf->rx_skb->len - 1);
+		trf->adjust_resp_len = false;
+	}
+
 	trf->cb(trf->ddev, trf->cb_arg, trf->rx_skb);
 
 	trf->rx_skb = NULL;
@@ -1429,10 +1436,15 @@ static int trf7970a_per_cmd_config(struct trf7970a *trf, struct sk_buff *skb)
 			trf->iso_ctrl = iso_ctrl;
 		}
 
-		if ((trf->framing == NFC_DIGITAL_FRAMING_ISO15693_T5T) &&
-				trf7970a_is_iso15693_write_or_lock(req[1]) &&
-				(req[0] & ISO15693_REQ_FLAG_OPTION))
-			trf->issue_eof = true;
+		if (trf->framing == NFC_DIGITAL_FRAMING_ISO15693_T5T) {
+			if (trf7970a_is_iso15693_write_or_lock(req[1]) &&
+					(req[0] & ISO15693_REQ_FLAG_OPTION))
+				trf->issue_eof = true;
+			else if ((trf->quirks &
+					TRF7970A_QUIRK_T5T_RMB_EXTRA_BYTE) &&
+				 (req[1] == ISO15693_CMD_READ_MULTIPLE_BLOCK))
+				trf->adjust_resp_len = true;
+		}
 	}
 
 	return 0;
@@ -1992,6 +2004,9 @@ static int trf7970a_probe(struct spi_device *spi)
 		return ret;
 	}
 
+	if (of_property_read_bool(np, "t5t-rmb-extra-byte-quirk"))
+		trf->quirks |= TRF7970A_QUIRK_T5T_RMB_EXTRA_BYTE;
+
 	if (of_property_read_bool(np, "irq-status-read-quirk"))
 		trf->quirks |= TRF7970A_QUIRK_IRQ_STATUS_READ;
 
-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
