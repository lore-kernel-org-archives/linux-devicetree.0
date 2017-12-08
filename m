From: Sven Eckelmann <sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/2] ath10k: search DT for qcom,ath10k-calibration-variant
Date: Fri,  8 Dec 2017 11:37:42 +0100
Message-ID: <20171208103742.3181-3-sven.eckelmann@openmesh.com>
References: <20171208103742.3181-1-sven.eckelmann@openmesh.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171208103742.3181-1-sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ext.waldemar.rymarkiewicz-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Sven Eckelmann <sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Board Data File (BDF) is loaded upon driver boot-up procedure. The right
board data file is identified on QCA4019 using bus, bmi-chip-id and
bmi-board-id.

The problem, however, can occur when the (default) board data file cannot
fulfill with the vendor requirements and it is necessary to use a different
board data file.

This problem was solved for SMBIOS by adding a special SMBIOS type 0xF8.
Something similar has to be provided for systems without SMBIOS but with
device trees. No solution was specified by QCA and therefore a new one has
to be found for ath10k.

The device tree requires addition strings to define the variant name

    wifi@a000000 {
    	status = "okay";
    	qcom,ath10k-calibration-variant = "RT-AC58U";
    };

    wifi@a800000 {
    	status = "okay";
    	qcom,ath10k-calibration-variant = "RT-AC58U";
    };

This would create the boarddata identifiers for the board-2.bin search

 *  bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=RT-AC58U
 *  bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=RT-AC58U

Signed-off-by: Sven Eckelmann <sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 40 ++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index b29fdbd21ead..6264e2cc4c0d 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -860,6 +860,28 @@ static int ath10k_core_check_smbios(struct ath10k *ar)
 	return 0;
 }
 
+static int ath10k_core_check_dt(struct ath10k *ar)
+{
+	struct device_node *node;
+	const char *variant = NULL;
+
+	node = ar->dev->of_node;
+	if (!node)
+		return -ENOENT;
+
+	of_property_read_string(node, "qcom,ath10k-calibration-variant",
+				&variant);
+	if (!variant)
+		return -ENODATA;
+
+	if (strscpy(ar->id.bdf_ext, variant, sizeof(ar->id.bdf_ext)) < 0)
+		ath10k_dbg(ar, ATH10K_DBG_BOOT,
+			   "bdf variant string is longer than the buffer can accommodate (variant: %s)\n",
+			    variant);
+
+	return 0;
+}
+
 static int ath10k_download_and_run_otp(struct ath10k *ar)
 {
 	u32 result, address = ar->hw_params.patch_load_addr;
@@ -1231,19 +1253,19 @@ static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
 	/* strlen(',variant=') + strlen(ar->id.bdf_ext) */
 	char variant[9 + ATH10K_SMBIOS_BDF_EXT_STR_LENGTH] = { 0 };
 
+	if (ar->id.bdf_ext[0] != '\0')
+		scnprintf(variant, sizeof(variant), ",variant=%s",
+			  ar->id.bdf_ext);
+
 	if (ar->id.bmi_ids_valid) {
 		scnprintf(name, name_len,
-			  "bus=%s,bmi-chip-id=%d,bmi-board-id=%d",
+			  "bus=%s,bmi-chip-id=%d,bmi-board-id=%d%s",
 			  ath10k_bus_str(ar->hif.bus),
 			  ar->id.bmi_chip_id,
-			  ar->id.bmi_board_id);
+			  ar->id.bmi_board_id, variant);
 		goto out;
 	}
 
-	if (ar->id.bdf_ext[0] != '\0')
-		scnprintf(variant, sizeof(variant), ",variant=%s",
-			  ar->id.bdf_ext);
