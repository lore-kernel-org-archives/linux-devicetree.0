From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH net-next v2 02/10] net: phy: add MoCA PHY type
Date: Wed, 12 Feb 2014 21:29:47 -0800
Message-ID: <1392269395-23513-3-git-send-email-f.fainelli@gmail.com>
References: <1392269395-23513-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1392269395-23513-1-git-send-email-f.fainelli@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, cernekee@gmail.com, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Some Ethernet MACs are connected to a MoCA PHY which will handle the
low-level job of sending Ethernet frames on the coaxial cable, these
Ethernet MACs need to know about it to be properly configured.
Add a new PHY mode "moca" and update the Device Tree parsing logic to
look for it.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes since v1:
- rebased against the latest net-next master branch

 include/linux/phy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 743c90e..950d2c9 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -75,6 +75,7 @@ typedef enum {
 	PHY_INTERFACE_MODE_SMII,
 	PHY_INTERFACE_MODE_XGMII,
 	PHY_INTERFACE_MODE_INTERNAL,
+	PHY_INTERFACE_MODE_MOCA,
 	PHY_INTERFACE_MODE_MAX,
 } phy_interface_t;
 
@@ -116,6 +117,8 @@ static inline const char *phy_modes(phy_interface_t interface)
 		return "xgmii";
 	case PHY_INTERFACE_MODE_INTERNAL:
 		return "internal";
+	case PHY_INTERFACE_MODE_MOCA:
+		return "moca";
 	default:
 		return "unknown";
 	}
-- 
1.8.3.2
