From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] dt-bindings: phy: rcar-gen3-phy-usb2: Revise #phy-cells property
Date: Mon,  1 Apr 2019 21:01:21 +0900
Message-ID: <1554120083-29990-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1554120083-29990-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554120083-29990-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

To have the detailed property on each PHY specifier, this patch revices
the #phy-cells property.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index ad9c290..7f0d4bf 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -27,7 +27,12 @@ Required properties:
 
 - reg: offset and length of the partial USB 2.0 Host register block.
 - clocks: clock phandle and specifier pair(s).
-- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
+- #phy-cells: see phy-bindings.txt in the same directory, must be <1>.
+
+The phandle's argument in the PHY specifier is the INT_STATUS bit of controller:
+- 1 = USBH_INTA (OHCI)
+- 2 = USBH_INTB (EHCI)
+- 3 = UCOM_INT (OTG and BC)
 
 Optional properties:
 To use a USB channel where USB 2.0 Host and HSUSB (USB 2.0 Peripheral) are
-- 
2.7.4
