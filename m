Return-Path: <SRS0=x/N+=MJ=sirena.org.uk=broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
Subject: Applied "spi: make OF helper available for others" to the spi tree
In-Reply-To: <20180925094230.32679-3-m.felsch@pengutronix.de>
Message-Id: <20180927224012.75C6E440078@finisterre.ee.mobilebroadband>
Date: Thu, 27 Sep 2018 23:40:12 +0100 (BST)
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, dmitry.torokhov@gmail.combroonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, kernel@pengutronix.delinux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The patch

   spi: make OF helper available for others

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 5f143af7501e7c435c56e181a655493edaa92509 Mon Sep 17 00:00:00 2001
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 25 Sep 2018 11:42:29 +0200
Subject: [PATCH] spi: make OF helper available for others

The of_find_spi_device_by_node() helper function is useful for other
modules too. Export the funciton as GPL like all other spi helper
functions and make it available if CONFIG_OF is enabled, because it isn't
related to the CONFIG_OF_DYNAMIC context. Finally add a stub if
CONFIG_OF isn't enabled, so others must not care about it.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi.c       |  7 +++++--
 include/linux/spi/spi.h | 17 ++++++++++++++++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index ec395a6baf9c..f939f585e917 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3314,20 +3314,23 @@ EXPORT_SYMBOL_GPL(spi_write_then_read);
 
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
index a64235e05321..e9ebfcd2e932 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -1277,7 +1277,6 @@ spi_register_board_info(struct spi_board_info const *info, unsigned n)
 	{ return 0; }
 #endif
 
-
 /* If you're hotplugging an adapter with devices (parport, usb, etc)
  * use spi_new_device() to describe each device.  You can also call
  * spi_unregister_device() to start making that device vanish, but
@@ -1309,6 +1308,22 @@ spi_transfer_is_last(struct spi_controller *ctlr, struct spi_transfer *xfer)
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
