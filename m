From: Randy Li <ayaka@soulik.info>
Subject: [PATCH 1/4] phy: Add reset callback
Date: Sun, 21 Aug 2016 15:56:42 +0800
Message-ID: <1471766205-12940-2-git-send-email-ayaka@soulik.info>
References: <4c931176-a09a-546c-d2b6-ea74028c78a2@cogentembedded.com>
 <1471766205-12940-1-git-send-email-ayaka@soulik.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471766205-12940-1-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: johnyoun@synopsys.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, eddie.cai@rock-chips.com, randy.li@rock-chips.com, kishon@ti.com, linux-kernel@vger.kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, Randy Li <ayaka@soulik.info>
List-Id: devicetree@vger.kernel.org

The only use for this is for solving a hardware design problem in
usb of Rockchip RK3288.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 include/linux/phy/phy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index f08b672..4d34607 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -36,6 +36,7 @@ enum phy_mode {
  * @power_on: powering on the phy
  * @power_off: powering off the phy
  * @set_mode: set the mode of the phy
+ * @reset: reseting the phy
  * @owner: the module owner containing the ops
  */
 struct phy_ops {
@@ -44,6 +45,7 @@ struct phy_ops {
 	int	(*power_on)(struct phy *phy);
 	int	(*power_off)(struct phy *phy);
 	int	(*set_mode)(struct phy *phy, enum phy_mode mode);
+	int	(*reset)(struct phy *phy);
 	struct module *owner;
 };
 
-- 
2.7.4
