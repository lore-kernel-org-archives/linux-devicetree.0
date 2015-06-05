From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/7] phy-sun4i-usb: Swap check for disconnect threshold
Date: Fri,  5 Jun 2015 20:53:35 +0200
Message-ID: <1433530421-12197-2-git-send-email-hdegoede@redhat.com>
References: <1433530421-12197-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBPPAY6VQKGQE2O2S6RY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1433530421-12197-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
index b45d707..0df1c4f 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -437,11 +437,11 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
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
2.4.2
