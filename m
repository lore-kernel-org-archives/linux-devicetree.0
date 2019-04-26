From: Harish Bandi <c-hbandi@codeaurora.org>
Subject: [PATCH v8 1/2] Bluetooth: hci_qca: Added support for WCN3998
Date: Fri, 26 Apr 2019 19:26:01 +0530
Message-ID: <1556286962-3132-2-git-send-email-c-hbandi@codeaurora.org>
References: <1556286962-3132-1-git-send-email-c-hbandi@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556286962-3132-1-git-send-email-c-hbandi@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marcel@holtmann.org, johan.hedberg@gmail.com
Cc: mka@chromium.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, anubhavg@codeaurora.org, devicetree@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Harish Bandi <c-hbandi@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Added new compatible for WCN3998 and corresponding voltage
and current values to WCN3998 compatible.
Changed driver code to support WCN3998

Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
---
Changes in V8:
- Removed export of qca_is_wcn399x() and added as inline function
---
 drivers/bluetooth/btqca.c   |  7 ++++---
 drivers/bluetooth/btqca.h   | 11 ++++++++++-
 drivers/bluetooth/hci_qca.c | 40 ++++++++++++++++++++++++++--------------
 3 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 6122685..cc12eec 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -336,7 +336,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 {
 	struct rome_config config;
 	int err;
-	u8 rom_ver;
+	u8 rom_ver = 0;
 
 	bt_dev_dbg(hdev, "QCA setup on UART");
 
@@ -344,7 +344,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 
 	/* Download rampatch file */
 	config.type = TLV_TYPE_PATCH;
-	if (soc_type == QCA_WCN3990) {
+	if (qca_is_wcn399x(soc_type)) {
 		/* Firmware files to download are based on ROM version.
 		 * ROM version is derived from last two bytes of soc_ver.
 		 */
@@ -365,7 +365,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 
 	/* Download NVM configuration */
 	config.type = TLV_TYPE_NVM;
-	if (soc_type == QCA_WCN3990)
+	if (qca_is_wcn399x(soc_type))
 		snprintf(config.fwname, sizeof(config.fwname),
 			 "qca/crnv%02x.bin", rom_ver);
 	else
@@ -410,6 +410,7 @@ int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)
 }
 EXPORT_SYMBOL_GPL(qca_set_bdaddr);
 
+
 MODULE_AUTHOR("Ben Young Tae Kim <ytkim@qca.qualcomm.com>");
 MODULE_DESCRIPTION("Bluetooth support for Qualcomm Atheros family ver " VERSION);
 MODULE_VERSION(VERSION);
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index 6fdc25d..4c4fe2b 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -132,7 +132,8 @@ enum qca_btsoc_type {
 	QCA_INVALID = -1,
 	QCA_AR3002,
 	QCA_ROME,
-	QCA_WCN3990
+	QCA_WCN3990,
+	QCA_WCN3998,
 };
 
 #if IS_ENABLED(CONFIG_BT_QCA)
@@ -142,6 +143,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		   enum qca_btsoc_type soc_type, u32 soc_ver);
 int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version);
 int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
+static inline bool qca_is_wcn399x(enum qca_btsoc_type soc_type)
+{
+	return soc_type == QCA_WCN3990 || soc_type == QCA_WCN3998;
+}
 #else
 
 static inline int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
@@ -165,4 +170,8 @@ static inline int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)
 	return -EOPNOTSUPP;
 }
 
+static inline bool qca_is_wcn399x(enum qca_btsoc_type soc_type)
+{
+	return false;
+}
 #endif
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7f75652..c53ee8d 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -521,7 +521,7 @@ static int qca_open(struct hci_uart *hu)
 	if (hu->serdev) {
 
 		qcadev = serdev_device_get_drvdata(hu->serdev);
-		if (qcadev->btsoc_type != QCA_WCN3990) {
+		if (!qca_is_wcn399x(qcadev->btsoc_type)) {
 			gpiod_set_value_cansleep(qcadev->bt_en, 1);
 			/* Controller needs time to bootup. */
 			msleep(150);
@@ -629,7 +629,7 @@ static int qca_close(struct hci_uart *hu)
 
 	if (hu->serdev) {
 		qcadev = serdev_device_get_drvdata(hu->serdev);
-		if (qcadev->btsoc_type == QCA_WCN3990)
+		if (qca_is_wcn399x(qcadev->btsoc_type))
 			qca_power_shutdown(hu);
 		else
 			gpiod_set_value_cansleep(qcadev->bt_en, 0);
@@ -1011,7 +1011,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
 		      msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS));
 
 	/* Give the controller time to process the request */
-	if (qca_soc_type(hu) == QCA_WCN3990)
+	if (qca_is_wcn399x(qca_soc_type(hu)))
 		msleep(10);
 	else
 		msleep(300);
@@ -1087,7 +1087,7 @@ static unsigned int qca_get_speed(struct hci_uart *hu,
 
 static int qca_check_speeds(struct hci_uart *hu)
 {
-	if (qca_soc_type(hu) == QCA_WCN3990) {
+	if (qca_is_wcn399x(qca_soc_type(hu))) {
 		if (!qca_get_speed(hu, QCA_INIT_SPEED) &&
 		    !qca_get_speed(hu, QCA_OPER_SPEED))
 			return -EINVAL;
@@ -1119,7 +1119,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		/* Disable flow control for wcn3990 to deassert RTS while
 		 * changing the baudrate of chip and host.
 		 */
-		if (soc_type == QCA_WCN3990)
+		if (qca_is_wcn399x(soc_type))
 			hci_uart_set_flow_control(hu, true);
 
 		qca_baudrate = qca_get_baudrate_value(speed);
@@ -1131,7 +1131,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		host_set_baudrate(hu, speed);
 
 error:
-		if (soc_type == QCA_WCN3990)
+		if (qca_is_wcn399x(soc_type))
 			hci_uart_set_flow_control(hu, false);
 	}
 
@@ -1204,7 +1204,7 @@ static int qca_setup(struct hci_uart *hu)
 	/* Patch downloading has to be done without IBS mode */
 	clear_bit(STATE_IN_BAND_SLEEP_ENABLED, &qca->flags);
 
-	if (soc_type == QCA_WCN3990) {
+	if (qca_is_wcn399x(soc_type)) {
 		bt_dev_info(hdev, "setting up wcn3990");
 
 		/* Enable NON_PERSISTENT_SETUP QUIRK to ensure to execute
@@ -1235,7 +1235,7 @@ static int qca_setup(struct hci_uart *hu)
 		qca_baudrate = qca_get_baudrate_value(speed);
 	}
 
-	if (soc_type != QCA_WCN3990) {
+	if (!qca_is_wcn399x(soc_type)) {
 		/* Get QCA version information */
 		ret = qca_read_soc_version(hdev, &soc_ver);
 		if (ret)
@@ -1260,7 +1260,7 @@ static int qca_setup(struct hci_uart *hu)
 	}
 
 	/* Setup bdaddr */
-	if (soc_type == QCA_WCN3990)
+	if (qca_is_wcn399x(soc_type))
 		hu->hdev->set_bdaddr = qca_set_bdaddr;
 	else
 		hu->hdev->set_bdaddr = qca_set_bdaddr_rome;
@@ -1283,7 +1283,7 @@ static int qca_setup(struct hci_uart *hu)
 	.dequeue	= qca_dequeue,
 };
 
-static const struct qca_vreg_data qca_soc_data = {
+static const struct qca_vreg_data qca_soc_data_wcn3990 = {
 	.soc_type = QCA_WCN3990,
 	.vregs = (struct qca_vreg []) {
 		{ "vddio",   1800000, 1900000,  15000  },
@@ -1294,6 +1294,17 @@ static int qca_setup(struct hci_uart *hu)
 	.num_vregs = 4,
 };
 
+static const struct qca_vreg_data qca_soc_data_wcn3998 = {
+	.soc_type = QCA_WCN3998,
+	.vregs = (struct qca_vreg []) {
+		{ "vddio",   1800000, 1900000,  10000  },
+		{ "vddxo",   1800000, 1900000,  80000  },
+		{ "vddrf",   1300000, 1352000,  300000 },
+		{ "vddch0",  3300000, 3300000,  450000 },
+	},
+	.num_vregs = 4,
+};
+
 static void qca_power_shutdown(struct hci_uart *hu)
 {
 	struct qca_data *qca = hu->priv;
@@ -1427,8 +1438,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	qcadev->serdev_hu.serdev = serdev;
 	data = of_device_get_match_data(&serdev->dev);
 	serdev_device_set_drvdata(serdev, qcadev);
-	if (data && data->soc_type == QCA_WCN3990) {
-		qcadev->btsoc_type = QCA_WCN3990;
+	if (data && qca_is_wcn399x(data->soc_type)) {
+		qcadev->btsoc_type = data->soc_type;
 		qcadev->bt_power = devm_kzalloc(&serdev->dev,
 						sizeof(struct qca_power),
 						GFP_KERNEL);
@@ -1492,7 +1503,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
 
-	if (qcadev->btsoc_type == QCA_WCN3990)
+	if (qca_is_wcn399x(qcadev->btsoc_type))
 		qca_power_shutdown(&qcadev->serdev_hu);
 	else
 		clk_disable_unprepare(qcadev->susclk);
@@ -1502,7 +1513,8 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 
 static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,qca6174-bt" },
-	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data},
+	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
+	{ .compatible = "qcom,wcn3998-bt", .data = &qca_soc_data_wcn3998},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
