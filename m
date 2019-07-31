From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v2 3/5] phy: sr-usb: Set phy ports
Date: Wed, 31 Jul 2019 15:49:53 +0530
Message-ID: <1564568395-9980-4-git-send-email-srinath.mannam@broadcom.com>
References: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

set phy ports value in xlate handler which is taken from second argument
of PHY phandle.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
---
 drivers/phy/broadcom/phy-bcm-sr-usb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/broadcom/phy-bcm-sr-usb.c b/drivers/phy/broadcom/phy-bcm-sr-usb.c
index fe6c589..5274e45 100644
--- a/drivers/phy/broadcom/phy-bcm-sr-usb.c
+++ b/drivers/phy/broadcom/phy-bcm-sr-usb.c
@@ -278,9 +278,16 @@ static struct phy *bcm_usb_phy_xlate(struct device *dev,
 		if (WARN_ON(phy_idx > 1))
 			return ERR_PTR(-ENODEV);
 
+		if (args->args[1])
+			phy_set_phy_ports(phy_cfg[phy_idx].phy, args->args[1]);
+
 		return phy_cfg[phy_idx].phy;
-	} else
+	} else {
+		if (args->args[0])
+			phy_set_phy_ports(phy_cfg->phy, args->args[0]);
+
 		return phy_cfg->phy;
+	}
 }
 
 static int bcm_usb_phy_create(struct device *dev, struct device_node *node,
-- 
2.7.4
