From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4] usb: create usb_debug_root for gadget only
Date: Tue, 4 Jun 2019 11:28:28 +0200
Message-ID: <20190604092828.GA30054@kroah.com>
References: <1559633647-29040-1-git-send-email-chunfeng.yun@mediatek.com>
 <20190604073706.GA25045@kroah.com>
 <87k1e123mc.fsf@linux.intel.com>
 <20190604082407.GA3783@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190604082407.GA3783@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 04, 2019 at 10:24:07AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jun 04, 2019 at 10:47:55AM +0300, Felipe Balbi wrote:
> > 
> > Hi,
> > 
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> > >> +struct dentry *usb_debugfs_init(void)
> > >> +{
> > >> +	if (!usb_debug_root)
> > >> +		usb_debug_root = debugfs_create_dir("usb", NULL);
> > >> +
> > >> +	atomic_inc(&usb_debug_root_refcnt);
> > >> +
> > >> +	return usb_debug_root;
> > >> +}
> > >> +EXPORT_SYMBOL_GPL(usb_debugfs_init);
> > >> +
> > >> +void usb_debugfs_cleanup(void)
> > >> +{
> > >> +	if (atomic_dec_and_test(&usb_debug_root_refcnt)) {
> > >> +		debugfs_remove_recursive(usb_debug_root);
> > >> +		usb_debug_root = NULL;
> > >> +	}
> > >> +}
> > >> +EXPORT_SYMBOL_GPL(usb_debugfs_cleanup);
> > >
> > > Only remove the debugfs subdir if the usbcore module is removed.  Create
> > > the debugfs subdir when the usbcore module is loaded.  No need for any
> > > reference counting of any sort at all.  No need to overthink this :)
> > 
> > There is a slight need to overthink. He wants to use the same directory
> > for gadget-only builds too :-)
> 
> Again, that's fine, this file will be loaded for those builds as well,
> right?  Otherwise, how would this code even be present?  :)


As it seems to be easier to just write the patch instead of trying to
describe it in email, and the patch is even simpler than the text,
here's what I was thinking of:

Note, it's not fully correct, now that I think of it, but you get the
idea...


>From foo@baz Tue 04 Jun 2019 11:25:30 AM CEST
Date: Tue, 04 Jun 2019 11:25:30 +0200
To: Greg KH <gregkh@linuxfoundation.org>
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] USB: move usb debugfs directory creation to the usb core

The USB gadget subsystem wants to use the USB debugfs root directory, so
move it to the common "core" USB code so that it is properly initialized
and removed as needed.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 18f5dcf58b0d..3b5e4263ffef 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -15,6 +15,7 @@
 #include <linux/usb/of.h>
 #include <linux/usb/otg.h>
 #include <linux/of_platform.h>
+#include <linux/debugfs.h>
 
 static const char *const ep_type_names[] = {
 	[USB_ENDPOINT_XFER_CONTROL] = "ctrl",
@@ -291,4 +292,21 @@ struct device *usb_of_get_companion_dev(struct device *dev)
 EXPORT_SYMBOL_GPL(usb_of_get_companion_dev);
 #endif
 
+struct dentry *usb_debug_root;
+EXPORT_SYMBOL_GPL(usb_debug_root);
+
+static int usb_common_init(void)
+{
+	usb_debug_root = debugfs_create_dir("usb", NULL);
+	return 0;
+}
+
+static void usb_common_exit(void)
+{
+	debugfs_remove_recursive(usb_debug_root);
+}
+
+module_init(usb_common_init);
+module_exit(usb_common_exit);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 7fcb9f782931..2aa28445277d 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -1185,12 +1185,8 @@ static struct notifier_block usb_bus_nb = {
 	.notifier_call = usb_bus_notify,
 };
 
-struct dentry *usb_debug_root;
-EXPORT_SYMBOL_GPL(usb_debug_root);
-
 static void usb_debugfs_init(void)
 {
-	usb_debug_root = debugfs_create_dir("usb", NULL);
 	debugfs_create_file("devices", 0444, usb_debug_root, NULL,
 			    &usbfs_devices_fops);
 }
