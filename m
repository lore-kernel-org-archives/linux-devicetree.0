From: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
Subject: [PATCH net-next 2/3] net: phy: Change the array size to 32 for device_ids
Date: Tue, 17 Apr 2018 04:02:32 -0500
Message-ID: <20180417090233.21548-3-vicentiu.galanopulo@nxp.com>
References: <20180417090233.21548-1-vicentiu.galanopulo@nxp.com>
Reply-To: vicentiu.galanopulo@nxp.com
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180417090233.21548-1-vicentiu.galanopulo@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@lunn.ch, robh@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, davem@davemloft.net, marcel@holtmann.org, devicetree@vger.kernel.org
Cc: alexandru.marginean@nxp.com, madalin.bucur@nxp.com, vicentiu.galanopulo@nxp.com
List-Id: devicetree@vger.kernel.org

In the context of enabling the discovery of the PHYs
which have the C45 MDIO address space in a non-standard
address:  num_ids in get_phy_c45_ids, has the
value 8 (ARRAY_SIZE(c45_ids->device_ids)), but the
u32 *devs can store 32 devices in the bitfield.

If a device is stored in *devs, in bits 32 to 9
(bit counting in lookup loop starts from 1), it will
not be found.

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
---
 include/linux/phy.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index f0b5870..26aa320 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -360,7 +360,7 @@ enum phy_state {
  */
 struct phy_c45_device_ids {
 	u32 devices_in_package;
-	u32 device_ids[8];
+	u32 device_ids[32];
 };
 
 /* phy_device: An instance of a PHY
-- 
2.7.4
