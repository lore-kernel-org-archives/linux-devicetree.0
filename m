From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 02/10] phy: rcar-gen3-usb2: Add phy-supply description in device tree doc
Date: Tue, 2 Feb 2016 19:18:50 +0900
Message-ID: <1454408338-4612-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1454408338-4612-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1454408338-4612-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

To handle the VBUS on/off by a regulator driver, this patch adds
description about phy-supply in the rcar-gen3-phy-usb2.txt.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index eaf7e9b..48b33a9 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -15,6 +15,8 @@ To use a USB channel where USB 2.0 Host and HSUSB (USB 2.0 Peripheral) are
 combined, the device tree node should set interrupt properties to use the
 channel as USB OTG:
 - interrupts: interrupt specifier for the PHY.
+- phy-supply: Phandle to a regulator that provides power to the VBUS. This
+	      regulator will be managed during the PHY power on/off sequence.
 
 Example (R-Car H3):
 
-- 
1.9.1
