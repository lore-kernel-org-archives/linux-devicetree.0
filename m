From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH 1/4] phy: sun4i-usb: support PHY0 on H3 in MUSB mode
Date: Tue, 17 Jan 2017 03:14:46 +0800
Message-ID: <20170116191449.50397-2-icenowy@aosc.xyz>
References: <20170116191449.50397-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB5FX6TBQKGQEVSU5KJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170116191449.50397-1-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The PHY0 on H3 can be wired either to MUSB controller or OHCI/EHCI
controller.

The original driver wired it to OHCI/EHCI controller; however, as the
code to use PHY0 as OHCI/EHCI is missing, it makes the PHY fully
unusable.

Rename the register (according to its function and the name in BSP
driver), and remove the code which wires the PHY0 to OHCI/EHCI, as MUSB
can support both peripheral and host mode (although the host mode of
MUSB is buggy).

The register that is renamed is now unused, as its initial value is just
MUSB mode. However, when OHCI/EHCI mode support is added, the register
can be used again.

Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
---
 drivers/phy/phy-sun4i-usb.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
index bf28a0fdd569..6b193a635c6b 100644
--- a/drivers/phy/phy-sun4i-usb.c
+++ b/drivers/phy/phy-sun4i-usb.c
@@ -49,7 +49,7 @@
 #define REG_PHYBIST			0x08
 #define REG_PHYTUNE			0x0c
 #define REG_PHYCTL_A33			0x10
-#define REG_PHY_UNK_H3			0x20
+#define REG_PHY_OTGCTL			0x20
 
 #define REG_PMU_UNK1			0x10
 
@@ -269,23 +269,16 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		writel(val & ~2, phy->pmu + REG_PMU_UNK1);
 	}
 
-	if (data->cfg->type == sun8i_h3_phy) {
-		if (phy->index == 0) {
-			val = readl(data->base + REG_PHY_UNK_H3);
-			writel(val & ~1, data->base + REG_PHY_UNK_H3);
-		}
-	} else {
-		/* Enable USB 45 Ohm resistor calibration */
-		if (phy->index == 0)
-			sun4i_usb_phy_write(phy, PHY_RES45_CAL_EN, 0x01, 1);
+	/* Enable USB 45 Ohm resistor calibration */
+	if (phy->index == 0)
+		sun4i_usb_phy_write(phy, PHY_RES45_CAL_EN, 0x01, 1);
 
-		/* Adjust PHY's magnitude and rate */
-		sun4i_usb_phy_write(phy, PHY_TX_AMPLITUDE_TUNE, 0x14, 5);
+	/* Adjust PHY's magnitude and rate */
+	sun4i_usb_phy_write(phy, PHY_TX_AMPLITUDE_TUNE, 0x14, 5);
 
-		/* Disconnect threshold adjustment */
-		sun4i_usb_phy_write(phy, PHY_DISCON_TH_SEL,
-				    data->cfg->disc_thresh, 2);
-	}
+	/* Disconnect threshold adjustment */
+	sun4i_usb_phy_write(phy, PHY_DISCON_TH_SEL,
+			    data->cfg->disc_thresh, 2);
 
 	sun4i_usb_phy_passby(phy, 1);
 
-- 
2.11.0
