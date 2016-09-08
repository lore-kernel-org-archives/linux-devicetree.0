From: Randy Li <ayaka@soulik.info>
Subject: [PATCH 1/4] phy: Add reset callback
Date: Thu,  8 Sep 2016 22:27:13 +0800
Message-ID: <1473344836-26707-2-git-send-email-ayaka@soulik.info>
References: <1473344836-26707-1-git-send-email-ayaka@soulik.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473344836-26707-1-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: John.Youn@synopsys.com, kishon@ti.com, felipe.balbi@linux.intel.com, mark.rutland@arm.com, devicetree@vger.kernel.org, heiko@sntech.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, randy.li@rock-chips.com, Randy Li <ayaka@soulik.info>
List-Id: devicetree@vger.kernel.org

The only use for this is for solving a hardware design problem in
usb of Rockchip RK3288.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 drivers/phy/phy-core.c  | 14 ++++++++++++++
 include/linux/phy/phy.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 8eca906..32e838d 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -357,6 +357,20 @@ int phy_set_mode(struct phy *phy, enum phy_mode mode)
 }
 EXPORT_SYMBOL_GPL(phy_set_mode);
 
+int phy_reset(struct phy *phy)
+{
+	int ret;
+	if (!phy || !phy->ops->reset)
+		return 0;
+
+	mutex_lock(&phy->mutex);
+	ret = phy->ops->reset(phy);
+	mutex_unlock(&phy->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_reset);
+
 /**
  * _of_phy_get() - lookup and obtain a reference to a phy by phandle
  * @np: device_node for which to get the phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index f08b672..7978df6 100644
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
 
@@ -136,6 +138,7 @@ int phy_exit(struct phy *phy);
 int phy_power_on(struct phy *phy);
 int phy_power_off(struct phy *phy);
 int phy_set_mode(struct phy *phy, enum phy_mode mode);
+int phy_reset(struct phy *phy);
 static inline int phy_get_bus_width(struct phy *phy)
 {
 	return phy->attrs.bus_width;
-- 
2.7.4
