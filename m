From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v4 13/13] staging: typec: tcpci: move tcpci driver out of
 staging
Date: Thu, 29 Mar 2018 00:06:18 +0800
Message-ID: <1522253178-32414-14-git-send-email-jun.li@nxp.com>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, peter.chen@nxp.com, linux-usb@vger.kernel.org, a.hajda@samsung.com, linux-imx@nxp.com, jun.li@nxp.com, shufan_lee@richtek.com
List-Id: devicetree@vger.kernel.org

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
index e95ab68..751937d 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -116,8 +116,6 @@ source "drivers/staging/vc04_services/Kconfig"
 
 source "drivers/staging/ccree/Kconfig"
 
-source "drivers/staging/typec/Kconfig"
-
 source "drivers/staging/vboxvideo/Kconfig"
 
 source "drivers/staging/pi433/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index af8cd6a..039693e 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -2,7 +2,6 @@
 # Makefile for staging directory
 
 obj-y				+= media/
-obj-y				+= typec/
 obj-$(CONFIG_IPX)		+= ipx/
 obj-$(CONFIG_NCP_FS)		+= ncpfs/
 obj-$(CONFIG_IRDA)		+= irda/net/
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
index 030f88c..2b8d3c2 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -55,6 +55,13 @@ config TYPEC_TCPM
 
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
