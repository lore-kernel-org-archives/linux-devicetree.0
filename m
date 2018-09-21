From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/8] dt-bindings: rcar-gen3-phy-usb2: add no-otg-pins property
Date: Fri, 21 Sep 2018 20:53:17 +0900
Message-ID: <1537530804-19399-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds a new optional property "renesas,no-otg-pins" which
a board does not provide proper otg pins.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index fb4a204..b90d692 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -31,6 +31,8 @@ channel as USB OTG:
 - interrupts: interrupt specifier for the PHY.
 - vbus-supply: Phandle to a regulator that provides power to the VBUS. This
 	       regulator will be managed during the PHY power on/off sequence.
+- renesas,no-otg-pins: boolean, specify when a board does not provide proper
+		       otg pins.
 
 Example (R-Car H3):
 
-- 
1.9.1
