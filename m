Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 06/11] usb: common: roles: Allow if the parent dev_name matches
Date: Wed, 18 Apr 2018 17:10:00 +0900
Message-Id: <1524039005-30618-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

THis patch adds a condition in __switch_match() to allow if
the parent dev_name matches. Otherwise, OF environment cannot match
the usb role switch devices because the usb role switch framework
adds the names of a new child device as the parent dev_name with
"-role-switch".

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/common/roles.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/common/roles.c b/drivers/usb/common/roles.c
index cc1c55a..381259c 100644
--- a/drivers/usb/common/roles.c
+++ b/drivers/usb/common/roles.c
@@ -88,7 +88,13 @@ enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw)
 
 static int __switch_match(struct device *dev, const void *name)
 {
-	return !strcmp((const char *)name, dev_name(dev));
+	int ret = !strcmp((const char *)name, dev_name(dev));
+
+	/* If doesn't match, this also checks the parent dev_name */
+	if (!ret && dev->parent)
+		ret = !strcmp((const char *)name, dev_name(dev->parent));
+
+	return ret;
 }
 
 static void *usb_role_switch_match(struct device_connection *con, int ep,
-- 
1.9.1
