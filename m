From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/3] dt-bindings: phy: rcar-gen3-phy-usb2: Revise #phy-cells property
Date: Thu, 11 Apr 2019 19:27:34 +0900
Message-ID: <1554978456-20794-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1554978456-20794-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554978456-20794-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

To have the detailed property on each PHY specifier, this patch revises
the #phy-cells property.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index 23894db..d46188f 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -29,7 +29,13 @@ Required properties:
 
 - reg: offset and length of the partial USB 2.0 Host register block.
 - clocks: clock phandle and specifier pair(s).
-- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
+- #phy-cells: see phy-bindings.txt in the same directory, must be <1> (and
+	      using <0> is deprecated).
+
+The phandle's argument in the PHY specifier is the INT_STATUS bit of controller:
+- 1 = USBH_INTA (OHCI)
+- 2 = USBH_INTB (EHCI)
+- 3 = UCOM_INT (OTG and BC)
 
 Optional properties:
 To use a USB channel where USB 2.0 Host and HSUSB (USB 2.0 Peripheral) are
-- 
2.7.4
