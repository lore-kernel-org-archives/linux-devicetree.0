Return-Path: <SRS0=m1Og=FU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0064.outbound.protection.outlook.com ([104.47.2.64]:2944
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752947AbeBZMFj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 26 Feb 2018 07:05:39 -0500
From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v2 12/12] staging: typec: tcpci: move tcpci driver out of staging
Date: Mon, 26 Feb 2018 19:49:19 +0800
Message-Id: <1519645759-12701-13-git-send-email-jun.li@nxp.com>
In-Reply-To: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, mark.rutland@arm.com, jun.li@nxp.com, yueyao@google.com, peter.chen@nxp.com, garsilva@embeddedor.com, o_leveque@orange.fr, shufan_lee@richtek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Move TCPCI(Typec port controller interface) driver out of staging.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/Kconfig                |  2 --
 drivers/staging/Makefile               |  1 -
 drivers/staging/typec/Kconfig          | 14 --------------
 drivers/staging/typec/Makefile         |  1 -
 drivers/staging/typec/TODO             |  5 -----
 drivers/usb/typec/Kconfig              |  7 +++++++
 drivers/usb/typec/Makefile             |  1 +
 drivers/{staging => usb}/typec/tcpci.c |  0
 drivers/{staging => usb}/typec/tcpci.h |  0
 9 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 5546839..1e3d5d0 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -112,8 +112,6 @@ source "drivers/staging/vc04_services/Kconfig"
 
 source "drivers/staging/ccree/Kconfig"
 
-source "drivers/staging/typec/Kconfig"
-
 source "drivers/staging/vboxvideo/Kconfig"
 
 source "drivers/staging/pi433/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 6e53602..ba69c52 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -2,7 +2,6 @@
 # Makefile for staging directory
 
 obj-y				+= media/
-obj-y				+= typec/
 obj-$(CONFIG_IRDA)		+= irda/net/
 obj-$(CONFIG_IRDA)		+= irda/drivers/
 obj-$(CONFIG_PRISM2_USB)	+= wlan-ng/
diff --git a/drivers/staging/typec/Kconfig b/drivers/staging/typec/Kconfig
deleted file mode 100644
index 5359f55..0000000
--- a/drivers/staging/typec/Kconfig
+++ /dev/null
@@ -1,14 +0,0 @@
-menu "USB Power Delivery and Type-C drivers"
-
-if TYPEC_TCPM
-
-config TYPEC_TCPCI
-	tristate "Type-C Port Controller Interface driver"
-	depends on I2C
-	select REGMAP_I2C
-	help
-	  Type-C Port Controller driver for TCPCI-compliant controller.
-
-endif
-
-endmenu
diff --git a/drivers/staging/typec/Makefile b/drivers/staging/typec/Makefile
deleted file mode 100644
index 53d649a..0000000
--- a/drivers/staging/typec/Makefile
+++ /dev/null
@@ -1 +0,0 @@
-obj-$(CONFIG_TYPEC_TCPCI)	+= tcpci.o
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
index bcb2744..711f7ee 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -54,6 +54,13 @@ config TYPEC_TCPM
 
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
index bb3138a..59c88b4 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -5,3 +5,4 @@ obj-y				+= fusb302/
 obj-$(CONFIG_TYPEC_WCOVE)	+= typec_wcove.o
 obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
 obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
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

