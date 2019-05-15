Return-Path: <SRS0=qLWK=TP=renesas.com=prvs=4038260dfd=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v4 03/13] phy: renesas: rcar-gen3-usb2: Check dr_mode when not using OTG
Date: Wed, 15 May 2019 10:20:38 -0500
Message-ID: <20190515152048.42363-4-chris.brandt@renesas.com>
In-Reply-To: <20190515152048.42363-1-chris.brandt@renesas.com>
References: <20190515152048.42363-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

When not using OTG, the PHY will need to know if it should function as
host or peripheral by checking dr_mode in the PHY node (not the parent
controller node).

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v4:
 * added reviewed-by
v3:
 * changed 'if' to 'switch'
 * use rcar_gen3_set_host_mode() instead of writel()
v2:
 * added braces to else statement
 * check if dr_mode is "host"
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 06e0fc804226..29da9c46ad9b 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -412,6 +412,18 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 		if (rcar_gen3_needs_init_otg(channel))
 			rcar_gen3_init_otg(channel);
 		rphy->otg_initialized = true;
+	} else {
+		/* Not OTG, so dr_mode should be set in PHY node */
+		switch (usb_get_dr_mode(channel->dev)) {
+		case USB_DR_MODE_HOST:
+			rcar_gen3_set_host_mode(channel, 1);
+			break;
+		case USB_DR_MODE_PERIPHERAL:
+			rcar_gen3_set_host_mode(channel, 0);
+			break;
+		default:
+			break;
+		}
 	}
 
 	rphy->initialized = true;
-- 
2.16.1
