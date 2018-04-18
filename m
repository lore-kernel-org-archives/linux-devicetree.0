Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 07/11] usb: common: roles: add getting device pointer APIs
Date: Wed, 18 Apr 2018 17:10:01 +0900
Message-Id: <1524039005-30618-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds APIs that a role switch driver can get device pointer
of USB 2.0/3.0 and udc.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/common/roles.c | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/usb/role.h   |  4 ++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/usb/common/roles.c b/drivers/usb/common/roles.c
index 381259c..5fd14b2 100644
--- a/drivers/usb/common/roles.c
+++ b/drivers/usb/common/roles.c
@@ -34,6 +34,42 @@ struct usb_role_switch {
 #define to_role_switch(d)	container_of(d, struct usb_role_switch, dev)
 
 /**
+ * usb_role_switch_get_usb2_port - Get device of a USB 2.0 host
+ * @sw: USB role switch
+ *
+ * Returns USB 2.0 host device pointer.
+ */
+struct device *usb_role_switch_get_usb2_port(struct usb_role_switch *sw)
+{
+	return sw->usb2_port;
+}
+EXPORT_SYMBOL(usb_role_switch_get_usb2_port);
+
+/**
+ * usb_role_switch_get_usb3_port - Get device of a USB 3.0 host
+ * @sw: USB role switch
+ *
+ * Returns USB 3.0 host device pointer.
+ */
+struct device *usb_role_switch_get_usb3_port(struct usb_role_switch *sw)
+{
+	return sw->usb3_port;
+}
+EXPORT_SYMBOL(usb_role_switch_get_usb3_port);
+
+/**
+ * usb_role_switch_get_udc - Get device of a udc
+ * @sw: USB role switch
+ *
+ * Returns udc device pointer.
+ */
+struct device *usb_role_switch_get_udc(struct usb_role_switch *sw)
+{
+	return sw->udc;
+}
+EXPORT_SYMBOL(usb_role_switch_get_udc);
+
+/**
  * usb_role_switch_set_role - Set USB role for a switch
  * @sw: USB role switch
  * @role: USB role to be switched to
diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
index edc51be..c7eb73b 100644
--- a/include/linux/usb/role.h
+++ b/include/linux/usb/role.h
@@ -40,6 +40,10 @@ struct usb_role_switch_desc {
 	bool allow_userspace_control;
 };
 
+struct device *usb_role_switch_get_usb2_port(struct usb_role_switch *sw);
+struct device *usb_role_switch_get_usb3_port(struct usb_role_switch *sw);
+struct device *usb_role_switch_get_udc(struct usb_role_switch *sw);
+
 int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role);
 enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw);
 struct usb_role_switch *usb_role_switch_get(struct device *dev);
-- 
1.9.1
