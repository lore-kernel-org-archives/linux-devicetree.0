From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 3/4] mailbox: mailbox-test: use print_hex_dump_bytes to allow dynamic printk
Date: Thu, 11 Feb 2016 17:13:27 +0000
Message-ID: <1455210808-29395-4-git-send-email-sudeep.holla@arm.com>
References: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Reduce the logging from info to debug. Also use print_hex_dump_bytes
instead as it has support for dynamic printk providing options to
conditionally enable/disable these logs.

Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/mailbox/mailbox-test.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 036a852b5fa1..f690f11969a1 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -113,15 +113,15 @@ static ssize_t mbox_test_message_write(struct file *filp,
 	 * MMIO to subsequently pass the message through
 	 */
 	if (tdev->mmio && tdev->signal) {
-		print_hex_dump(KERN_INFO, "Client: Sending: Signal: ", DUMP_PREFIX_ADDRESS,
-			       MBOX_BYTES_PER_LINE, 1, tdev->signal, MBOX_MAX_SIG_LEN, true);
+		print_hex_dump_bytes("Client: Sending: Signal: ", DUMP_PREFIX_ADDRESS,
+				     tdev->signal, MBOX_MAX_SIG_LEN);
 
 		data = tdev->signal;
 	} else
 		data = tdev->message;
 
-	print_hex_dump(KERN_INFO, "Client: Sending: Message: ", DUMP_PREFIX_ADDRESS,
-		       MBOX_BYTES_PER_LINE, 1, tdev->message, MBOX_MAX_MSG_LEN, true);
+	print_hex_dump_bytes("Client: Sending: Message: ", DUMP_PREFIX_ADDRESS,
+			     tdev->message, MBOX_MAX_MSG_LEN);
 
 	ret = mbox_send_message(tdev->tx_channel, data);
 	if (ret < 0)
@@ -222,13 +222,11 @@ static void mbox_test_receive_message(struct mbox_client *client, void *message)
 	spin_lock_irqsave(&tdev->lock, flags);
 	if (tdev->mmio) {
 		memcpy_fromio(tdev->rx_buffer, tdev->mmio, MBOX_MAX_MSG_LEN);
-		print_hex_dump(KERN_INFO, "Client: Received [MMIO]: ",
-			       DUMP_PREFIX_ADDRESS, MBOX_BYTES_PER_LINE, 1,
-			       tdev->rx_buffer, MBOX_MAX_MSG_LEN, true);
+		print_hex_dump_bytes("Client: Received [MMIO]: ", DUMP_PREFIX_ADDRESS,
+				     tdev->rx_buffer, MBOX_MAX_MSG_LEN);
 	} else if (message) {
-		print_hex_dump(KERN_INFO, "Client: Received [API]: ",
-			       DUMP_PREFIX_ADDRESS, MBOX_BYTES_PER_LINE, 1,
-			       message, MBOX_MAX_MSG_LEN, true);
+		print_hex_dump_bytes("Client: Received [API]: ", DUMP_PREFIX_ADDRESS,
+				     message, MBOX_MAX_MSG_LEN);
 		memcpy(tdev->rx_buffer, message, MBOX_MAX_MSG_LEN);
 	}
 	spin_unlock_irqrestore(&tdev->lock, flags);
-- 
1.9.1
