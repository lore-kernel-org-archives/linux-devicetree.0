Return-Path: <SRS0=oCC0=MH=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 2/3] spi: make OF helper available for others
Date: Tue, 25 Sep 2018 11:42:29 +0200
Message-Id: <20180925094230.32679-3-m.felsch@pengutronix.de>
In-Reply-To: <20180925094230.32679-1-m.felsch@pengutronix.de>
References: <20180925094230.32679-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

The of_find_spi_device_by_node() helper function is useful for other
modules too. Export the funciton as GPL like all other spi helper
functions and make it available if CONFIG_OF is enabled, because it isn't
related to the CONFIG_OF_DYNAMIC context. Finally add a stub if
CONFIG_OF isn't enabled, so others must not care about it.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/spi/spi.c       |  7 +++++--
 include/linux/spi/spi.h | 17 ++++++++++++++++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 3a8f1224edfc..2983c3f69fb0 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3305,20 +3305,23 @@ EXPORT_SYMBOL_GPL(spi_write_then_read);
 
 /*-------------------------------------------------------------------------*/
 
-#if IS_ENABLED(CONFIG_OF_DYNAMIC)
+#if IS_ENABLED(CONFIG_OF)
 static int __spi_of_device_match(struct device *dev, void *data)
 {
 	return dev->of_node == data;
 }
 
 /* must call put_device() when done with returned spi_device device */
-static struct spi_device *of_find_spi_device_by_node(struct device_node *node)
+struct spi_device *of_find_spi_device_by_node(struct device_node *node)
 {
 	struct device *dev = bus_find_device(&spi_bus_type, NULL, node,
 						__spi_of_device_match);
 	return dev ? to_spi_device(dev) : NULL;
 }
+EXPORT_SYMBOL_GPL(of_find_spi_device_by_node);
+#endif /* IS_ENABLED(CONFIG_OF) */
 
+#if IS_ENABLED(CONFIG_OF_DYNAMIC)
 static int __spi_of_controller_match(struct device *dev, const void *data)
 {
 	return dev->of_node == data;
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 95c0243dc74a..b53f4e348b24 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -1268,7 +1268,6 @@ spi_register_board_info(struct spi_board_info const *info, unsigned n)
 	{ return 0; }
 #endif
 
-
 /* If you're hotplugging an adapter with devices (parport, usb, etc)
  * use spi_new_device() to describe each device.  You can also call
  * spi_unregister_device() to start making that device vanish, but
@@ -1300,6 +1299,22 @@ spi_transfer_is_last(struct spi_controller *ctlr, struct spi_transfer *xfer)
 	return list_is_last(&xfer->transfer_list, &ctlr->cur_msg->transfers);
 }
 
+/* OF support code */
+#if IS_ENABLED(CONFIG_OF)
+
+/* must call put_device() when done with returned spi_device device */
+extern struct spi_device *
+of_find_spi_device_by_node(struct device_node *node);
+
+#else
+
+static inline struct spi_device *
+of_find_spi_device_by_node(struct device_node *node)
+{
+	return NULL;
+}
+
+#endif /* IS_ENABLED(CONFIG_OF) */
 
 /* Compatibility layer */
 #define spi_master			spi_controller
-- 
2.19.0
