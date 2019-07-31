From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v2 1/5] phy: Add phy ports in attrs
Date: Wed, 31 Jul 2019 15:49:51 +0530
Message-ID: <1564568395-9980-2-git-send-email-srinath.mannam@broadcom.com>
References: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add phy ports bitmask to contain enabled PHY ports.
set and get APIs added to set and get phy ports value.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
---
 include/linux/phy/phy.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 15032f14..b8bca1d 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -109,10 +109,12 @@ struct phy_ops {
 /**
  * struct phy_attrs - represents phy attributes
  * @bus_width: Data path width implemented by PHY
+ * @phy_ports: Bitmask of enabled ports
  * @mode: PHY mode
  */
 struct phy_attrs {
 	u32			bus_width;
+	u32			phy_ports;
 	enum phy_mode		mode;
 };
 
@@ -225,6 +227,14 @@ static inline void phy_set_bus_width(struct phy *phy, int bus_width)
 {
 	phy->attrs.bus_width = bus_width;
 }
+static inline int phy_get_phy_ports(struct phy *phy)
+{
+	return phy->attrs.phy_ports;
+}
+static inline void phy_set_phy_ports(struct phy *phy, int phy_ports)
+{
+	phy->attrs.phy_ports |= phy_ports;
+}
 struct phy *phy_get(struct device *dev, const char *string);
 struct phy *phy_optional_get(struct device *dev, const char *string);
 struct phy *devm_phy_get(struct device *dev, const char *string);
-- 
2.7.4
