From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/3] phy: rcar-gen3-usb2: Add support for r8a77965
Date: Mon,  5 Mar 2018 14:32:44 +0900
Message-ID: <1520227965-4471-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1520227965-4471-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520227965-4471-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for r8a77965 (R-Car M3-N). This SoC has
dedicated pins.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 9c90e7d..fb8f05e 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -397,6 +397,10 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 		.data = (void *)RCAR_GEN3_PHY_HAS_DEDICATED_PINS,
 	},
 	{
+		.compatible = "renesas,usb2-phy-r8a77965",
+		.data = (void *)RCAR_GEN3_PHY_HAS_DEDICATED_PINS,
+	},
+	{
 		.compatible = "renesas,rcar-gen3-usb2-phy",
 	},
 	{ }
-- 
1.9.1
