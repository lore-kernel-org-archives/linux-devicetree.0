From: NeilBrown <neil@brown.name>
Subject: [PATCH 2/4] TTY: split tty_register_device_attr into 'initialize'
 and 'add' parts.
Date: Mon, 11 May 2015 11:56:14 +1000
Message-ID: <20150511015614.5709.7959.stgit@notabene.brown>
References: <20150511013540.5709.93626.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150511013540.5709.93626.stgit@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robherring2@gmail.com>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>
Cc: GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This provides seperate
  tty_device_initialize_attr()
and
  tty_device_add_attr()

similar to device_initialize() and device_add().

Similiarly tty_port_initialize_device_attr() is added to match
tty_port_register_device_attr().

It will allow a client to separate initalization and adding of the
device.

Signed-off-by: NeilBrown <neil@brown.name>
---
 drivers/tty/tty_io.c   |  102 +++++++++++++++++++++++++++++++++---------------
 drivers/tty/tty_port.c |   24 +++++++++++
 include/linux/tty.h    |    9 ++++
 3 files changed, 104 insertions(+), 31 deletions(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index ccb99b772965..83ca25b9c2da 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -3205,8 +3205,29 @@ static void tty_device_create_release(struct device *dev)
 	kfree(dev);
 }
 
+int tty_device_add(struct tty_driver *driver, struct device *dev)
+{
+	int retval;
+	bool cdev = false;
+	int index = dev->devt - MKDEV(driver->major,
+				      driver->minor_start);
+
+	if (!(driver->flags & TTY_DRIVER_DYNAMIC_ALLOC)) {
+		retval = tty_cdev_add(driver, dev->devt, index, 1);
+		if (retval)
+			return retval;
+		cdev = true;
+	}
+	retval = device_add(dev);
+	if (retval == 0)
+		return 0;
+	if (cdev)
+		cdev_del(&driver->cdevs[index]);
+	return retval;
+}
+EXPORT_SYMBOL(tty_device_add);
 /**
- *	tty_register_device_attr - register a tty device
+ *	tty_device_initialize_attr - initialize a tty device, but don't 'add'
  *	@driver: the tty driver that describes the tty device
  *	@index: the index in the tty driver for this tty device
  *	@device: a struct device that is associated with this tty device.
@@ -3218,23 +3239,19 @@ static void tty_device_create_release(struct device *dev)
  *	Returns a pointer to the struct device for this tty device
  *	(or ERR_PTR(-EFOO) on error).
  *
- *	This call is required to be made to register an individual tty device
- *	if the tty driver's flags have the TTY_DRIVER_DYNAMIC_DEV bit set.  If
- *	that bit is not set, this function should not be called by a tty
- *	driver.
+ *	tty_device_add() must be called after this call returns successfully
+ *	before the device will be full registered and available.
  *
  *	Locking: ??
  */
-struct device *tty_register_device_attr(struct tty_driver *driver,
-				   unsigned index, struct device *device,
-				   void *drvdata,
-				   const struct attribute_group **attr_grp)
+struct device *tty_device_initialize_attr(struct tty_driver *driver,
+					  unsigned index, struct device *device,
+					  void *drvdata,
+					  const struct attribute_group **attr_grp)
 {
 	char name[64];
 	dev_t devt = MKDEV(driver->major, driver->minor_start) + index;
 	struct device *dev = NULL;
-	int retval = -ENODEV;
-	bool cdev = false;
 
 	if (index >= driver->num) {
 		printk(KERN_ERR "Attempt to register invalid tty line number "
@@ -3247,19 +3264,11 @@ struct device *tty_register_device_attr(struct tty_driver *driver,
 	else
 		tty_line_name(driver, index, name);
 
-	if (!(driver->flags & TTY_DRIVER_DYNAMIC_ALLOC)) {
-		retval = tty_cdev_add(driver, devt, index, 1);
-		if (retval)
-			goto error;
-		cdev = true;
-	}
-
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
-	if (!dev) {
-		retval = -ENOMEM;
-		goto error;
-	}
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
 
+	device_initialize(dev);
 	dev->devt = devt;
 	dev->class = tty_class;
 	dev->parent = device;
@@ -3268,17 +3277,48 @@ struct device *tty_register_device_attr(struct tty_driver *driver,
 	dev->groups = attr_grp;
 	dev_set_drvdata(dev, drvdata);
 
-	retval = device_register(dev);
-	if (retval)
-		goto error;
-
 	return dev;
+}
+EXPORT_SYMBOL_GPL(tty_device_initialize_attr);
 
-error:
-	put_device(dev);
-	if (cdev)
-		cdev_del(&driver->cdevs[index]);
-	return ERR_PTR(retval);
+/**
+ *	tty_register_device_attr - register a tty device
+ *	@driver: the tty driver that describes the tty device
+ *	@index: the index in the tty driver for this tty device
+ *	@device: a struct device that is associated with this tty device.
+ *		This field is optional, if there is no known struct device
+ *		for this tty device it can be set to NULL safely.
+ *	@drvdata: Driver data to be set to device.
+ *	@attr_grp: Attribute group to be set on device.
+ *
+ *	Returns a pointer to the struct device for this tty device
+ *	(or ERR_PTR(-EFOO) on error).
+ *
+ *	This call is required to be made to register an individual tty device
+ *	if the tty driver's flags have the TTY_DRIVER_DYNAMIC_DEV bit set.  If
+ *	that bit is not set, this function should not be called by a tty
+ *	driver.
+ *
+ *	Locking: ??
+ */
+struct device *tty_register_device_attr(struct tty_driver *driver,
+				   unsigned index, struct device *device,
+				   void *drvdata,
+				   const struct attribute_group **attr_grp)
+{
+	struct device *dev;
+	int ret;
+
+	dev = tty_device_initialize_attr(driver, index, device,
+					 drvdata, attr_grp);
+	if (IS_ERR(dev))
+		return dev;
+	ret = tty_device_add(driver, dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+	return dev;
 }
 EXPORT_SYMBOL_GPL(tty_register_device_attr);
 
diff --git a/drivers/tty/tty_port.c b/drivers/tty/tty_port.c
index 40b31835f80b..f4145c0f1f45 100644
--- a/drivers/tty/tty_port.c
+++ b/drivers/tty/tty_port.c
@@ -97,6 +97,30 @@ struct device *tty_port_register_device_attr(struct tty_port *port,
 }
 EXPORT_SYMBOL_GPL(tty_port_register_device_attr);
 
+/**
+ * tty_port_initialize_device_attr - initialize tty device
+ * @port: tty_port of the device
+ * @driver: tty_driver for this device
+ * @index: index of the tty
+ * @device: parent if exists, otherwise NULL
+ * @drvdata: Driver data to be set to device.
+ * @attr_grp: Attribute group to be set on device.
+ *
+ * It is the same as tty_initialize_device_attr except the provided @port is
+ * linked to a concrete tty specified by @index. Use this or tty_port_install
+ * (or both). Call tty_port_link_device as a last resort.
+ */
+struct device *tty_port_initialize_device_attr(struct tty_port *port,
+		struct tty_driver *driver, unsigned index,
+		struct device *device, void *drvdata,
+		const struct attribute_group **attr_grp)
+{
+	tty_port_link_device(port, driver, index);
+	return tty_device_initialize_attr(driver, index, device, drvdata,
+					  attr_grp);
+}
+EXPORT_SYMBOL_GPL(tty_port_initialize_device_attr);
+
 int tty_port_alloc_xmit_buf(struct tty_port *port)
 {
 	/* We may sleep in get_zeroed_page() */
diff --git a/include/linux/tty.h b/include/linux/tty.h
index 04d5f1213700..1b371ba9ed09 100644
--- a/include/linux/tty.h
+++ b/include/linux/tty.h
@@ -436,6 +436,11 @@ extern struct device *tty_register_device_attr(struct tty_driver *driver,
 				unsigned index, struct device *device,
 				void *drvdata,
 				const struct attribute_group **attr_grp);
+extern struct device *tty_device_initialize_attr(struct tty_driver *driver,
+				unsigned index, struct device *device,
+				void *drvdata,
+				const struct attribute_group **attr_grp);
+extern int tty_device_add(struct tty_driver *driver, struct device *dev);
 extern void tty_unregister_device(struct tty_driver *driver, unsigned index);
 extern int tty_read_raw_data(struct tty_struct *tty, unsigned char *bufp,
 			     int buflen);
@@ -534,6 +539,10 @@ extern struct device *tty_port_register_device_attr(struct tty_port *port,
 		struct tty_driver *driver, unsigned index,
 		struct device *device, void *drvdata,
 		const struct attribute_group **attr_grp);
+extern struct device *tty_port_initialize_device_attr(struct tty_port *port,
+		struct tty_driver *driver, unsigned index,
+		struct device *device, void *drvdata,
+		const struct attribute_group **attr_grp);
 extern int tty_port_alloc_xmit_buf(struct tty_port *port);
 extern void tty_port_free_xmit_buf(struct tty_port *port);
 extern void tty_port_destroy(struct tty_port *port);
