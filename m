From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH net-next v4 06/11] phy: add QSGMII and PCIE modes
Date: Thu,  4 Oct 2018 14:22:03 +0200
Message-ID: <20181004122208.32272-7-quentin.schulz@bootlin.com>
References: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

Prepare for upcoming phys that'll handle QSGMII or PCIe.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 include/linux/phy/phy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 9713aebdd348..03b319f89a34 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -37,9 +37,11 @@ enum phy_mode {
 	PHY_MODE_USB_OTG,
 	PHY_MODE_SGMII,
 	PHY_MODE_2500SGMII,
+	PHY_MODE_QSGMII,
 	PHY_MODE_10GKR,
 	PHY_MODE_UFS_HS_A,
 	PHY_MODE_UFS_HS_B,
+	PHY_MODE_PCIE,
 };
 
 /**
-- 
2.17.1
