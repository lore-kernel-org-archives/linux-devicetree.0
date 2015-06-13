From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 3/7] phy-sun4i-usb: Swap check for disconnect threshold
Date: Sat, 13 Jun 2015 14:37:47 +0200
Message-ID: <1434199071-22127-4-git-send-email-hdegoede@redhat.com>
References: <1434199071-22127-1-git-send-email-hdegoede@redhat.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434199071-22127-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Before this commit the code for determining the disconnect threshold was
checking for "allwinner,sun4i-a10-usb-phy" or "allwinner,sun6i-a31-usb-phy"
assuming that those where the exception and then newer SoCs would use a
disconnect threshold of 2 like sun7i does. But it turns out that newer
SoCs use a disconnect threshold of 3 and sun5i and sun7i are the
exceptions, so check for those instead.

Here are the settings from the various Allwinner SDK sources:
 sun4i-a10: USBC_Phy_Write(usbc_no, 0x2a, 3, 2);
 sun5i-a13: USBC_Phy_Write(usbc_no, 0x2a, 2, 2);
 sun6i-a31: USBC_Phy_Write(usbc_no, 0x2a, 3, 2);
 sun7i-a20: USBC_Phy_Write(usbc_no, 0x2a, 2, 2);
 sun8i-a23: USBC_Phy_Write(usbc_no, 0x2a, 3, 2);
 sun8i-h3:  USBC_Phy_Write(usbc_no, 0x2a, 3, 2);
 sun9i-a80: USBC_Phy_Write(usbc_no, 0x2a, 3, 2);

Note this commit makes no functional changes as currently we only support
sun4i - sun7i.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/phy/phy-sun4i-usb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
index 86d9ce1..d78a071 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -447,11 +447,11 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 	else
 		data->num_phys = 3;
 
-	if (of_device_is_compatible(np, "allwinner,sun4i-a10-usb-phy") ||
-	    of_device_is_compatible(np, "allwinner,sun6i-a31-usb-phy"))
-		data->disc_thresh = 3;
-	else
+	if (of_device_is_compatible(np, "allwinner,sun5i-a13-usb-phy") ||
+	    of_device_is_compatible(np, "allwinner,sun7i-a20-usb-phy"))
 		data->disc_thresh = 2;
+	else
+		data->disc_thresh = 3;
 
 	if (of_device_is_compatible(np, "allwinner,sun6i-a31-usb-phy"))
 		dedicated_clocks = true;
-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
