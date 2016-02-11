From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 4/4] mailbox: mailbox-test: add support for separate tx/rx buffer with single channel
Date: Thu, 11 Feb 2016 17:13:28 +0000
Message-ID: <1455210808-29395-5-git-send-email-sudeep.holla@arm.com>
References: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds support for different MMIO region for Tx and Rx paths.
If only one region is specified, it's assumed to be shared between Rx
and Tx, thereby retaining backward compatibility.

Also in order to support single channel dealing with both Tx and Rx with
dedicated MMIO regions, Tx channel itself is assigned to Rx if MMIO
regions are different and Rx is not specified.

Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/mailbox/mailbox-test.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index f690f11969a1..767b9ec37a96 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -31,7 +31,8 @@ static struct dentry *root_debugfs_dir;
 
 struct mbox_test_device {
 	struct device		*dev;
-	void __iomem		*mmio;
+	void __iomem		*tx_mmio;
+	void __iomem		*rx_mmio;
 	struct mbox_chan	*tx_channel;
 	struct mbox_chan	*rx_channel;
 	char			*rx_buffer;
@@ -112,7 +113,7 @@ static ssize_t mbox_test_message_write(struct file *filp,
 	 * A separate signal is only of use if there is
 	 * MMIO to subsequently pass the message through
 	 */
-	if (tdev->mmio && tdev->signal) {
+	if (tdev->tx_mmio && tdev->signal) {
 		print_hex_dump_bytes("Client: Sending: Signal: ", DUMP_PREFIX_ADDRESS,
 				     tdev->signal, MBOX_MAX_SIG_LEN);
 
@@ -220,8 +221,8 @@ static void mbox_test_receive_message(struct mbox_client *client, void *message)
 	unsigned long flags;
 
 	spin_lock_irqsave(&tdev->lock, flags);
-	if (tdev->mmio) {
-		memcpy_fromio(tdev->rx_buffer, tdev->mmio, MBOX_MAX_MSG_LEN);
+	if (tdev->rx_mmio) {
+		memcpy_fromio(tdev->rx_buffer, tdev->rx_mmio, MBOX_MAX_MSG_LEN);
 		print_hex_dump_bytes("Client: Received [MMIO]: ", DUMP_PREFIX_ADDRESS,
 				     tdev->rx_buffer, MBOX_MAX_MSG_LEN);
 	} else if (message) {
@@ -236,11 +237,11 @@ static void mbox_test_prepare_message(struct mbox_client *client, void *message)
 {
 	struct mbox_test_device *tdev = dev_get_drvdata(client->dev);
 
-	if (tdev->mmio) {
+	if (tdev->tx_mmio) {
 		if (tdev->signal)
-			memcpy_toio(tdev->mmio, tdev->message, MBOX_MAX_MSG_LEN);
+			memcpy_toio(tdev->tx_mmio, tdev->message, MBOX_MAX_MSG_LEN);
 		else
-			memcpy_toio(tdev->mmio, message, MBOX_MAX_MSG_LEN);
+			memcpy_toio(tdev->tx_mmio, message, MBOX_MAX_MSG_LEN);
 	}
 }
 
@@ -294,9 +295,13 @@ static int mbox_test_probe(struct platform_device *pdev)
 
 	/* It's okay for MMIO to be NULL */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	tdev->mmio = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(tdev->mmio))
-		tdev->mmio = NULL;
+	tdev->tx_mmio = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(tdev->tx_mmio))
+		tdev->tx_mmio = NULL;
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	tdev->rx_mmio = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(tdev->rx_mmio))
+		tdev->rx_mmio = tdev->tx_mmio;
 
 	tdev->tx_channel = mbox_test_request_channel(pdev, "tx");
 	tdev->rx_channel = mbox_test_request_channel(pdev, "rx");
@@ -304,6 +309,9 @@ static int mbox_test_probe(struct platform_device *pdev)
 	if (!tdev->tx_channel && !tdev->rx_channel)
 		return -EPROBE_DEFER;
 
+	if (!tdev->rx_channel && (tdev->rx_mmio != tdev->tx_mmio))
+		tdev->rx_channel = tdev->tx_channel;
+
 	tdev->dev = &pdev->dev;
 	platform_set_drvdata(pdev, tdev);
 
-- 
1.9.1
