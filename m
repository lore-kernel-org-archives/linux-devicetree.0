From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 6/9] NFC: NCI: move generic spi driver to a module
Date: Mon, 26 Oct 2015 10:27:42 +0100
Message-ID: <1445851665-2497-7-git-send-email-cuissard@marvell.com>
References: <1445851665-2497-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445851665-2497-1-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SPI driver should be a module.

Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 net/nfc/nci/Kconfig  | 2 +-
 net/nfc/nci/Makefile | 3 ++-
 net/nfc/nci/spi.c    | 4 ++++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/Kconfig b/net/nfc/nci/Kconfig
index 901c1dd..85d4819 100644
--- a/net/nfc/nci/Kconfig
+++ b/net/nfc/nci/Kconfig
@@ -12,7 +12,7 @@ config NFC_NCI
 config NFC_NCI_SPI
 	depends on NFC_NCI && SPI
 	select CRC_CCITT
-	bool "NCI over SPI protocol support"
+	tristate "NCI over SPI protocol support"
 	default n
 	help
 	  NCI (NFC Controller Interface) is a communication protocol between
diff --git a/net/nfc/nci/Makefile b/net/nfc/nci/Makefile
index b4b85b8..0ca31d9 100644
--- a/net/nfc/nci/Makefile
+++ b/net/nfc/nci/Makefile
@@ -6,7 +6,8 @@ obj-$(CONFIG_NFC_NCI) += nci.o
 
 nci-objs := core.o data.o lib.o ntf.o rsp.o hci.o
 
-nci-$(CONFIG_NFC_NCI_SPI) += spi.o
+nci_spi-y += spi.o
+obj-$(CONFIG_NFC_NCI_SPI) += nci_spi.o
 
 nci_uart-y += uart.o
 obj-$(CONFIG_NFC_NCI_UART) += nci_uart.o
diff --git a/net/nfc/nci/spi.c b/net/nfc/nci/spi.c
index ec250e7..25153d0 100644
--- a/net/nfc/nci/spi.c
+++ b/net/nfc/nci/spi.c
@@ -18,6 +18,8 @@
 
 #define pr_fmt(fmt) "nci_spi: %s: " fmt, __func__
 
+#include <linux/module.h>
+
 #include <linux/export.h>
 #include <linux/spi/spi.h>
 #include <linux/crc-ccitt.h>
@@ -320,3 +322,5 @@ done:
 	return skb;
 }
 EXPORT_SYMBOL_GPL(nci_spi_read);
+
+MODULE_LICENSE("GPL");
-- 
2.2.0.33.gc18b867

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
