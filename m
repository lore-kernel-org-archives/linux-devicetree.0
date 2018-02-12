From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 03/10] fsi: master-gpio: Add external mode
Date: Mon, 12 Feb 2018 15:45:42 +1030
Message-ID: <20180212051549.8575-4-joel@jms.id.au>
References: <20180212051549.8575-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212051549.8575-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Christopher Bostic <cbostic@linux.vnet.ibm.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Edward James <eajames@us.ibm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk@ozlabs.org>

This change introduces an 'external mode' for GPIO-based FSI masters,
allowing the clock and data lines to be driven by an external source.
For example, external mode is selected by a user when an external debug
device is attached to the FSI pins.

To do this, we need to set specific states for the trans, mux and enable
GPIOs, and prevent access to clk & data from the FSI core code (by
returning EBUSY).

External mode is controlled by a sysfs attribute, so add the relevant
information to Documentation/ABI/

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../ABI/testing/sysfs-driver-fsi-master-gpio       | 10 +++
 drivers/fsi/fsi-master-gpio.c                      | 78 +++++++++++++++++++++-
 2 files changed, 86 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-fsi-master-gpio

diff --git a/Documentation/ABI/testing/sysfs-driver-fsi-master-gpio b/Documentation/ABI/testing/sysfs-driver-fsi-master-gpio
new file mode 100644
index 000000000000..1f29c8843cfd
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-fsi-master-gpio
@@ -0,0 +1,10 @@
+What:           /sys/bus/platform/devices/[..]/fsi-master-gpio/external_mode
+Date:           Feb 2018
+KernelVersion:  4.17
+Contact:        jk@ozlabs.org
+Description:
+                Controls access arbitration for GPIO-based FSI master. A
+		value of 0 (the default) sets normal mode, where the
+		driver performs FSI bus transactions, 1 sets external mode,
+		where the FSI bus is driven externally (for example, by
+		a debug device).
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index a6d602e89c11..b54c213f3dcb 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -59,6 +59,7 @@ struct fsi_master_gpio {
 	struct gpio_desc	*gpio_trans;	/* Voltage translator */
 	struct gpio_desc	*gpio_enable;	/* FSI enable */
 	struct gpio_desc	*gpio_mux;	/* Mux control */
+	bool			external_mode;
 };
 
 #define CREATE_TRACE_POINTS
@@ -411,6 +412,12 @@ static int fsi_master_gpio_xfer(struct fsi_master_gpio *master, uint8_t slave,
 	int rc;
 
 	spin_lock_irqsave(&master->cmd_lock, flags);
+
+	if (master->external_mode) {
+		spin_unlock_irqrestore(&master->cmd_lock, flags);
+		return -EBUSY;
+	}
+
 	serial_out(master, cmd);
 	echo_delay(master);
 	rc = poll_for_response(master, slave, resp_len, resp);
@@ -469,6 +476,10 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 	trace_fsi_master_gpio_break(master);
 
 	spin_lock_irqsave(&master->cmd_lock, flags);
+	if (master->external_mode) {
+		spin_unlock_irqrestore(&master->cmd_lock, flags);
+		return -EBUSY;
+	}
 	set_sda_output(master, 1);
 	sda_out(master, 1);
 	clock_toggle(master, FSI_PRE_BREAK_CLOCKS);
@@ -497,25 +508,84 @@ static void fsi_master_gpio_init(struct fsi_master_gpio *master)
 	clock_zeros(master, FSI_INIT_CLOCKS);
 }
 
+static void fsi_master_gpio_init_external(struct fsi_master_gpio *master)
+{
+	gpiod_direction_output(master->gpio_mux, 0);
+	gpiod_direction_output(master->gpio_trans, 0);
+	gpiod_direction_output(master->gpio_enable, 1);
+	gpiod_direction_input(master->gpio_clk);
+	gpiod_direction_input(master->gpio_data);
+}
+
 static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
 	unsigned long flags;
+	int rc = -EBUSY;
 
 	if (link != 0)
 		return -ENODEV;
 
 	spin_lock_irqsave(&master->cmd_lock, flags);
-	gpiod_set_value(master->gpio_enable, 1);
+	if (!master->external_mode) {
+		gpiod_set_value(master->gpio_enable, 1);
+		rc = 0;
+	}
 	spin_unlock_irqrestore(&master->cmd_lock, flags);
 
-	return 0;
+	return rc;
+}
+
+static ssize_t external_mode_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct fsi_master_gpio *master = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n",
+			master->external_mode ? 1 : 0);
+}
+
+static ssize_t external_mode_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct fsi_master_gpio *master = dev_get_drvdata(dev);
+	unsigned long flags, val;
+	bool external_mode;
+	int err;
+
+	err = kstrtoul(buf, 0, &val);
+	if (err)
+		return err;
+
+	external_mode = !!val;
+
+	spin_lock_irqsave(&master->cmd_lock, flags);
+
+	if (external_mode == master->external_mode) {
+		spin_unlock_irqrestore(&master->cmd_lock, flags);
+		return count;
+	}
+
+	master->external_mode = external_mode;
+	if (master->external_mode)
+		fsi_master_gpio_init_external(master);
+	else
+		fsi_master_gpio_init(master);
+	spin_unlock_irqrestore(&master->cmd_lock, flags);
+
+	fsi_master_rescan(&master->master);
+
+	return count;
 }
 
+static DEVICE_ATTR(external_mode, 0664,
+		external_mode_show, external_mode_store);
+
 static int fsi_master_gpio_probe(struct platform_device *pdev)
 {
 	struct fsi_master_gpio *master;
 	struct gpio_desc *gpio;
+	int rc;
 
 	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
@@ -572,6 +642,10 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 
 	fsi_master_gpio_init(master);
 
+	rc = device_create_file(&pdev->dev, &dev_attr_external_mode);
+	if (rc)
+		return rc;
+
 	return fsi_master_register(&master->master);
 }
 
-- 
2.15.1
