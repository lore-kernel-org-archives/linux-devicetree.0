Return-Path: <SRS0=xgCA=HW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr10062.outbound.protection.outlook.com ([40.107.1.62]:38784
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751708AbeECAmj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 2 May 2018 20:42:39 -0400
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v5 14/14] staging: typec: tcpci: move tcpci driver out of staging
Date: Thu,  3 May 2018 08:24:54 +0800
Message-Id: <1525307094-27402-15-git-send-email-jun.li@nxp.com>
In-Reply-To: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: jun.li@nxp.com, a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, gsomlo@gmail.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Move TCPCI(Typec port controller interface) driver out of staging.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/Kconfig                | 2 --
 drivers/staging/Makefile               | 1 -
 drivers/staging/typec/TODO             | 5 -----
 drivers/usb/typec/Kconfig              | 7 +++++++
 drivers/usb/typec/Makefile             | 1 +
 drivers/{staging => usb}/typec/tcpci.c | 0
 drivers/{staging => usb}/typec/tcpci.h | 0
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index d5926f0..d83ff66 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -112,8 +112,6 @@ source "drivers/staging/greybus/Kconfig"
 
 source "drivers/staging/vc04_services/Kconfig"
 
-source "drivers/staging/typec/Kconfig"
-
 source "drivers/staging/vboxvideo/Kconfig"
 
 source "drivers/staging/pi433/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 919753c..a71ec1f 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -2,7 +2,6 @@
 # Makefile for staging directory
 
 obj-y				+= media/
-obj-y				+= typec/
 obj-$(CONFIG_IPX)		+= ipx/
 obj-$(CONFIG_NCP_FS)		+= ncpfs/
 obj-$(CONFIG_PRISM2_USB)	+= wlan-ng/
diff --git a/drivers/staging/typec/TODO b/drivers/staging/typec/TODO
deleted file mode 100644
index 53fe2f7..0000000
--- a/drivers/staging/typec/TODO
+++ /dev/null
@@ -1,5 +0,0 @@
-tcpci:
-- Test with real hardware
-
-Please send patches to Guenter Roeck <linux@roeck-us.net> and copy
-Heikki Krogerus <heikki.krogerus@linux.intel.com>.
diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 2c8eab1..0a862fc 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -56,6 +56,13 @@ config TYPEC_TCPM
 
 if TYPEC_TCPM
 
+config TYPEC_TCPCI
+	tristate "Type-C Port Controller Interface driver"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Type-C Port Controller driver for TCPCI-compliant controller.
+
 source "drivers/usb/typec/fusb302/Kconfig"
 
 config TYPEC_WCOVE
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 1f599a6..02758a1 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_TYPEC_WCOVE)	+= typec_wcove.o
 obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
 obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
 obj-$(CONFIG_TYPEC)		+= mux/
+obj-$(CONFIG_TYPEC_TCPCI)	+= tcpci.o
diff --git a/drivers/staging/typec/tcpci.c b/drivers/usb/typec/tcpci.c
similarity index 100%
rename from drivers/staging/typec/tcpci.c
rename to drivers/usb/typec/tcpci.c
diff --git a/drivers/staging/typec/tcpci.h b/drivers/usb/typec/tcpci.h
similarity index 100%
rename from drivers/staging/typec/tcpci.h
rename to drivers/usb/typec/tcpci.h
-- 
2.7.4

