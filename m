From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 02/15] phy-sun4i-usb: Add a helper function to
 update the iscr register
Date: Mon,  9 Mar 2015 21:40:15 +0100
Message-ID: <1425933628-9672-3-git-send-email-hdegoede@redhat.com>
References: <1425933628-9672-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBS4K7CTQKGQEDVGBUQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1425933628-9672-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add sun4i_usb_phy_update_iscr() helper function to allow the otg driver to
update the sun4i usb phy0 Interface Status and Control Register.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/phy/phy-sun4i-usb.c       | 13 +++++++++++++
 include/linux/phy/phy-sun4i-usb.h | 26 ++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 include/linux/phy/phy-sun4i-usb.h

diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
index a2b08f3c..4742d5a 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -79,6 +79,19 @@ struct sun4i_usb_phy_data {
 #define to_sun4i_usb_phy_data(phy) \
 	container_of((phy), struct sun4i_usb_phy_data, phys[(phy)->index])
 
+void sun4i_usb_phy_update_iscr(struct phy *_phy, u32 clr, u32 set)
+{
+	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
+	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
+	u32 iscr;
+
+	iscr = readl(data->base + REG_ISCR);
+	iscr &= ~clr;
+	iscr |= set;
+	writel(iscr, data->base + REG_ISCR);
+}
+EXPORT_SYMBOL(sun4i_usb_phy_update_iscr);
+
 static void sun4i_usb_phy_write(struct sun4i_usb_phy *phy, u32 addr, u32 data,
 				int len)
 {
diff --git a/include/linux/phy/phy-sun4i-usb.h b/include/linux/phy/phy-sun4i-usb.h
new file mode 100644
index 0000000..f69e784
--- /dev/null
+++ b/include/linux/phy/phy-sun4i-usb.h
@@ -0,0 +1,26 @@
+/*
+ * Allwinner sun4i USB phy header
+ *
+ * Copyright (C) 2015 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __PHY_SUN4I_USB_H
+#define __PHY_SUN4I_USB_H
+
+#include <linux/phy/phy.h>
+
+/**
+ * sun4i_usb_phy_update_iscr() - Update sun4i usb phy0 Interface Status and
+ * Control bits
+ * @phy: Reference to sun4i usb phy0
+ * @clr: bits to clear in the ISCR register
+ * @set: bits to set in the ISCR register
+ */
+void sun4i_usb_phy_update_iscr(struct phy *phy, u32 clr, u32 set);
+
+#endif
-- 
2.3.1
