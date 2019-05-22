From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 1/2] net: phy: add interface mode
 PHY_INTERFACE_MODE_USXGMII
Date: Wed, 22 May 2019 21:57:16 +0200
Message-ID: <aca070f6-f56b-1b1f-180a-ddf52af91ecb@gmail.com>
References: <110a1e45-56a7-a646-7b63-f39fe3083c28@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <110a1e45-56a7-a646-7b63-f39fe3083c28@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Madalin-cristian Bucur <madalin.bucur@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add support for interface mode PHY_INTERFACE_MODE_USXGMII.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/linux/phy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 073fb151b..7180b1d1e 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -103,6 +103,7 @@ typedef enum {
 	PHY_INTERFACE_MODE_XAUI,
 	/* 10GBASE-KR, XFI, SFI - single lane 10G Serdes */
 	PHY_INTERFACE_MODE_10GKR,
+	PHY_INTERFACE_MODE_USXGMII,
 	PHY_INTERFACE_MODE_MAX,
 } phy_interface_t;
 
@@ -178,6 +179,8 @@ static inline const char *phy_modes(phy_interface_t interface)
 		return "xaui";
 	case PHY_INTERFACE_MODE_10GKR:
 		return "10gbase-kr";
+	case PHY_INTERFACE_MODE_USXGMII:
+		return "usxgmii";
 	default:
 		return "unknown";
 	}
-- 
2.21.0
