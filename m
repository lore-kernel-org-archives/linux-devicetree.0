From: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/5] phy: sun4i: add support for USB phy0
Date: Mon, 10 Nov 2014 19:55:06 +0100
Message-ID: <997f1e2744504f3461f9e94e2171180b5ce87aa2.1415645258.git.rbyshko@gmail.com>
References: <cover.1415645258.git.rbyshko@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJMXIOHZIFBBHMUQSRQKGQEM6EGQII-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <cover.1415645258.git.rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1415645258.git.rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1415645258.git.rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The driver for sun4i USB phys currently supports
only phy1 and phy2 which are used for USB host
controllers. This patch adds support for USB phy0,
which is used by the musb hdrc USB controller.

Signed-off-by: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/phy/phy-sun4i-usb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
index 0baf5ef..6bd2b0c 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -157,6 +157,10 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		return ret;
 	}
 
+	/* Enable USB 45 Ohm resistor calibration */
+	if (phy->index == 0)
+		sun4i_usb_phy_write(phy, PHY_RES45_CAL_EN, 0x01, 1);
+
 	/* Adjust PHY's magnitude and rate */
 	sun4i_usb_phy_write(phy, PHY_TX_AMPLITUDE_TUNE, 0x14, 5);
 
@@ -213,7 +217,7 @@ static struct phy *sun4i_usb_phy_xlate(struct device *dev,
 {
 	struct sun4i_usb_phy_data *data = dev_get_drvdata(dev);
 
-	if (WARN_ON(args->args[0] == 0 || args->args[0] >= data->num_phys))
+	if (args->args[0] >= data->num_phys)
 		return ERR_PTR(-ENODEV);
 
 	return data->phys[args->args[0]].phy;
@@ -255,8 +259,7 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
-	/* Skip 0, 0 is the phy for otg which is not yet supported. */
-	for (i = 1; i < data->num_phys; i++) {
+	for (i = 0; i < data->num_phys; i++) {
 		struct sun4i_usb_phy *phy = data->phys + i;
 		char name[16];
 
-- 
2.1.2
