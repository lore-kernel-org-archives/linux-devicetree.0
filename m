From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 1/3] usb: gadget: udc: renesas_usb3: add debugfs to set the b-device mode
Date: Fri,  4 Aug 2017 11:16:56 +0900
Message-ID: <1501813018-6116-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501813018-6116-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501813018-6116-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds debugfs to set the "b-device" mode for using a board
which is not connected to the ID pin (e.g. CN11 on Salvator-X).
If we want to use peripheral mode on such a board, we have to disable
VBUS output first. So, this patch can set such a mode as the following:

 # mount -t debugfs none /sys/kernel/debug
 # modprobe renesas_usb3
 # modprobe g_mass_storage file=/dev/shm/test.bin
 # echo 1 > /sys/kernel/debug/ee020000.usb/b_device

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 78 ++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index d827832..3415d32 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -8,6 +8,7 @@
  * the Free Software Foundation; version 2 of the License.
  */
 
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -20,6 +21,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/uaccess.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 
@@ -344,6 +346,7 @@ struct renesas_usb3 {
 	bool workaround_for_vbus;
 	bool extcon_host;		/* check id and set EXTCON_USB_HOST */
 	bool extcon_usb;		/* check vbus and set EXTCON_USB */
+	bool forced_b_device;
 };
 
 #define gadget_to_renesas_usb3(_gadget)	\
@@ -660,7 +663,9 @@ static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, bool a_dev)
 	spin_lock_irqsave(&usb3->lock, flags);
 	usb3_set_mode(usb3, host);
 	usb3_vbus_out(usb3, a_dev);
-	if (!host && a_dev)		/* for A-Peripheral */
+	/* for A-Peripheral or forced B-device mode */
+	if ((!host && a_dev) ||
+	    (usb3->workaround_for_vbus && usb3->forced_b_device))
 		usb3_connect(usb3);
 	spin_unlock_irqrestore(&usb3->lock, flags);
 }
@@ -674,7 +679,7 @@ static void usb3_check_id(struct renesas_usb3 *usb3)
 {
 	usb3->extcon_host = usb3_is_a_device(usb3);
 
-	if (usb3->extcon_host)
+	if (usb3->extcon_host && !usb3->forced_b_device)
 		usb3_mode_config(usb3, true, true);
 	else
 		usb3_mode_config(usb3, false, false);
@@ -2266,6 +2271,9 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 	if (!usb3->driver)
 		return -ENODEV;
 
+	if (usb3->forced_b_device)
+		return -EBUSY;
+
 	if (!strncmp(buf, "host", strlen("host")))
 		new_mode_is_host = true;
 	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
@@ -2293,6 +2301,70 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(role);
 
+static int renesas_usb3_b_device_show(struct seq_file *s, void *unused)
+{
+	struct renesas_usb3 *usb3 = s->private;
+
+	seq_printf(s, "%d\n", usb3->forced_b_device);
+
+	return 0;
+}
+
+static int renesas_usb3_b_device_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, renesas_usb3_b_device_show, inode->i_private);
+}
+
+static ssize_t renesas_usb3_b_device_write(struct file *file,
+					   const char __user *ubuf,
+					   size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct renesas_usb3 *usb3 = s->private;
+	char buf[32];
+
+	if (!usb3->driver)
+		return -ENODEV;
+
+	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
+		return -EFAULT;
+
+	if (!strncmp(buf, "1", 1))
+		usb3->forced_b_device = true;
+	else
+		usb3->forced_b_device = false;
+
+	/* Let this driver call usb3_connect() anyway */
+	usb3_check_id(usb3);
+
+	return count;
+}
+
+static const struct file_operations renesas_usb3_b_device_fops = {
+	.open = renesas_usb3_b_device_open,
+	.write = renesas_usb3_b_device_write,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static void renesas_usb3_debugfs_init(struct renesas_usb3 *usb3,
+				      struct device *dev)
+{
+	struct dentry *root, *file;
+
+	root = debugfs_create_dir(dev_name(dev), NULL);
+	if (IS_ERR_OR_NULL(root)) {
+		dev_info(dev, "%s: Can't create the root\n", __func__);
+		return;
+	}
+
+	file = debugfs_create_file("b_device", 0644, root, usb3,
+				   &renesas_usb3_b_device_fops);
+	if (!file)
+		dev_info(dev, "%s: Can't create debugfs mode\n", __func__);
+}
+
 /*------- platform_driver ------------------------------------------------*/
 static int renesas_usb3_remove(struct platform_device *pdev)
 {
@@ -2510,6 +2582,8 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 
 	usb3->workaround_for_vbus = priv->workaround_for_vbus;
 
+	renesas_usb3_debugfs_init(usb3, &pdev->dev);
+
 	dev_info(&pdev->dev, "probed\n");
 
 	return 0;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
