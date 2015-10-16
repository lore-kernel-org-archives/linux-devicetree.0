From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] mailbox: Fix a couple of trivial static checker issues
Date: Fri, 16 Oct 2015 12:32:51 +0100
Message-ID: <20151016113251.GF31804@x1>
References: <1444980091-16728-5-git-send-email-lee.jones@linaro.org>
 <201510161646.D4m1dK6L%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201510161646.D4m1dK6L%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

mailbox: Fix a couple of trivial static checker issues

This patch deals with a few spelling, white space and type
warnings reported by Intel's Kbuild Test Robot.

Reported-by: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

---
 drivers/mailbox/mailbox-sti.c  |  2 +-
 drivers/mailbox/mailbox-test.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/mailbox-sti.c b/drivers/mailbox/mailbox-sti.c
index f11d4e8..4835817 100644
--- a/drivers/mailbox/mailbox-sti.c
+++ b/drivers/mailbox/mailbox-sti.c
@@ -64,7 +64,7 @@ struct sti_mbox_device {
 };
 
 /**
- * STi Mailbox platform specfic configuration
+ * STi Mailbox platform specific configuration
  *
  * @num_inst:	Maximum number of instances in one HW Mailbox
  * @num_chan:	Maximum number of channel per instance
diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index cac1ba2..196144c 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -22,7 +22,7 @@
 #define MBOX_MAX_SIG_LEN	8
 #define MBOX_MAX_MSG_LEN	128
 #define MBOX_BYTES_PER_LINE	16
-#define MBOX_HEXDUMP_LINE_LEN 	((MBOX_BYTES_PER_LINE * 4) + 2)
+#define MBOX_HEXDUMP_LINE_LEN	((MBOX_BYTES_PER_LINE * 4) + 2)
 #define MBOX_HEXDUMP_MAX_LEN	(MBOX_HEXDUMP_LINE_LEN *		\
 				 (MBOX_MAX_MSG_LEN / MBOX_BYTES_PER_LINE))
 
@@ -30,7 +30,7 @@ static struct dentry *root_debugfs_dir;
 
 struct mbox_test_device {
 	struct device		*dev;
-	void __iomem		*mmio;
+	void			*mmio;
 	struct mbox_chan	*tx_channel;
 	struct mbox_chan	*rx_channel;
 	char			*rx_buffer;
@@ -53,7 +53,7 @@ static ssize_t mbox_test_signal_write(struct file *filp,
 
 	if (count > MBOX_MAX_SIG_LEN) {
 		dev_err(tdev->dev,
-			"Signal length %d greater than max allowed %d\n",
+			"Signal length %lu greater than max allowed %d\n",
 			count, MBOX_MAX_SIG_LEN);
 		return -EINVAL;
 	}
@@ -92,7 +92,7 @@ static ssize_t mbox_test_message_write(struct file *filp,
 
 	if (count > MBOX_MAX_MSG_LEN) {
 		dev_err(tdev->dev,
-			"Message length %d greater than max allowed %d\n",
+			"Message length %lu greater than max allowed %d\n",
 			count, MBOX_MAX_MSG_LEN);
 		return -EINVAL;
 	}
@@ -303,7 +303,7 @@ static int mbox_test_probe(struct platform_device *pdev)
 	tdev->tx_channel = mbox_test_request_channel(pdev, "tx");
 	tdev->rx_channel = mbox_test_request_channel(pdev, "rx");
 
-	if (!tdev->tx_channel && !tdev->tx_channel)
+	if (!tdev->tx_channel && !tdev->rx_channel)
 		return -EPROBE_DEFER;
 
 	tdev->dev = &pdev->dev;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
