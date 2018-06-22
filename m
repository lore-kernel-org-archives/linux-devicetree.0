Return-Path: <SRS0=/GFF=JI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:47342 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751183AbeFVEib (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 22 Jun 2018 00:38:31 -0400
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 2/2] fsi: Add support for device-tree provided chip IDs
Date: Fri, 22 Jun 2018 14:37:56 +1000
Message-Id: <20180622043756.21158-2-benh@kernel.crashing.org>
In-Reply-To: <20180622043756.21158-1-benh@kernel.crashing.org>
References: <20180622043756.21158-1-benh@kernel.crashing.org>
Sender: devicetree-owner@vger.kernel.org
To: openbmc@lists.ozlabs.org
Cc: linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-ID: <devicetree@vger.kernel.org>

They get retrieved from the device-tree and exposed
as an attribute in sysfs

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-core.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 1ae5be31b4bf..3fe36673cb21 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -80,6 +80,7 @@ struct fsi_slave {
 	struct fsi_master	*master;
 	int			id;
 	int			link;
+	int			chip_id;
 	uint32_t		size;	/* size of slave address space */
 	u8			t_send_delay;
 	u8			t_echo_delay;
@@ -723,6 +724,17 @@ static ssize_t slave_send_echo_store(struct device *dev,
 static DEVICE_ATTR(send_echo_delays, 0600,
 		   slave_send_echo_show, slave_send_echo_store);
 
+static ssize_t chip_id_show(struct device *dev,
+			    struct device_attribute *attr,
+			    char *buf)
+{
+	struct fsi_slave *slave = to_fsi_slave(dev);
+
+	return sprintf(buf, "%d\n", slave->chip_id);
+}
+
+static DEVICE_ATTR_RO(chip_id);
+
 static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 {
 	uint32_t chip_id;
@@ -786,6 +798,14 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	slave->t_send_delay = 16;
 	slave->t_echo_delay = 16;
 
+	/* Get chip ID if any */
+	slave->chip_id = -1;
+	if (slave->dev.of_node) {
+		uint32_t prop;
+		if (!of_property_read_u32(slave->dev.of_node, "chip-id", &prop))
+			slave->chip_id = prop;
+
+	}
 	rc = fsi_slave_set_smode(slave);
 	if (rc) {
 		dev_warn(&master->dev,
@@ -820,6 +840,10 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	if (rc)
 		dev_warn(&slave->dev, "failed to create delay attr: %d\n", rc);
 
+	rc = device_create_file(&slave->dev, &dev_attr_chip_id);
+	if (rc)
+		dev_warn(&slave->dev, "failed to create chip id: %d\n", rc);
+
 	rc = fsi_slave_scan(slave);
 	if (rc)
 		dev_dbg(&master->dev, "failed during slave scan with: %d\n",
-- 
2.17.1

