From: Ravi Babu <ravibabu@ti.com>
Subject: [PATCH v7 11/11] arm/dts: am33xx: add phy phandle to usbss
Date: Thu, 2 Aug 2012 17:42:54 +0530
Message-ID: <1343909574-15633-12-git-send-email-ravibabu@ti.com>
References: <1343909574-15633-1-git-send-email-ravibabu@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1343909574-15633-1-git-send-email-ravibabu@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-omap@vger.kernel.org, balbi@ti.com, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, tony@atomide.com, ajayguptaj@gmail.com
List-Id: devicetree@vger.kernel.org

From: Ajay Kumar Gupta <ajay.gupta@ti.com>

Added NOP PHY phandle to usbss device node as same will be used
to get the phy from otg framework.

Signed-off-by: Ajay Kumar Gupta <ajay.gupta@ti.com>
Signed-off-by: Ravi Babu <ravibabu@ti.com>
---
 arch/arm/boot/dts/am33xx.dtsi |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index b03a9b5..d3ab69a 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -172,6 +172,8 @@
 			port0_mode = <3>;
 			port1_mode = <1>;
 			power = <250>;
+			usb0-phy = <&usb0_phy>;
+			usb1-phy = <&usb1_phy>;
 		};
 	};
 };
-- 
1.7.0.4

