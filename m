From: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH resend 12/12] staging: typec: tcpci: move tcpci driver out of staging
Date: Tue, 26 Sep 2017 12:05:23 +0800
Message-ID: <1506398723-19359-13-git-send-email-jun.li@nxp.com>
References: <1506398723-19359-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506398723-19359-1-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: yueyao-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, o_leveque-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, jun.li-3arQi8VN3Tc@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Move TCPCI(Typec port controller interface) driver out of staging.

Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
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
index 8951c37..4d1ccb4 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -1,7 +1,6 @@
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
-Please send patches to Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> and copy
-Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>.
diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 819c0ed..33b04c4 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -14,6 +14,13 @@ config TYPEC_TCPM
 
 if TYPEC_TCPM
 
+config TYPEC_TCPCI
+	tristate "Type-C Port Controller Interface driver"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Type-C Port Controller driver for TCPCI-compliant controller.
+
 source "drivers/usb/typec/fusb302/Kconfig"
 
 endif
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index b77688c..c2fbf17 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_TYPEC_TCPM)	+= tcpm.o
 obj-y				+= fusb302/
 obj-$(CONFIG_TYPEC_WCOVE)	+= typec_wcove.o
 obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
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
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
