Return-Path: <SRS0=d+eE=TJ=renesas.com=prvs=4032988503=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 05/15] phy: renesas: rcar-gen3-usb2: Check dr_mode when not using OTG
Date: Thu, 9 May 2019 15:11:32 -0500
Message-ID: <20190509201142.10543-6-chris.brandt@renesas.com>
In-Reply-To: <20190509201142.10543-1-chris.brandt@renesas.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

When not using OTG, the PHY will need to know if it should function as
host or peripheral by checking dr_mode in the PHY node (not the parent
controller node).

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * added braces to else statement
 * check if dr_mode is "host"
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 1ebb08f8323f..5e5e5e938f80 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -391,6 +391,7 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	struct rcar_gen3_phy *rphy = phy_get_drvdata(p);
 	struct rcar_gen3_chan *channel = rphy->ch;
 	void __iomem *usb2_base = channel->base;
+	enum usb_dr_mode mode;
 	u32 val;
 
 	if (channel->uses_usb_x1)
@@ -408,6 +409,13 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 		if (rcar_gen3_needs_init_otg(channel))
 			rcar_gen3_init_otg(channel);
 		rphy->otg_initialized = true;
+	} else {
+		/* Not OTG, so dr_mode should be set in PHY node */
+		mode = usb_get_dr_mode(channel->dev);
+		if (mode == USB_DR_MODE_HOST)
+			writel(0x00000000, usb2_base + USB2_COMMCTRL);
+		else if (mode == USB_DR_MODE_PERIPHERAL)
+			writel(0x80000000, usb2_base + USB2_COMMCTRL);
 	}
 
 	rphy->initialized = true;
-- 
2.16.1
