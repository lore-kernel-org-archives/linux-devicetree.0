From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 4/4] phy: rcar-gen3-usb2: add binding for r8a77995
Date: Tue, 10 Oct 2017 14:58:30 +0900
Message-ID: <1507615110-26206-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1507615110-26206-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507615110-26206-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds binding for r8a77995 (R-Car D3). Since r8a77995 doesn't
have dedicated pins (ID, VBUS), this will match against the generic
fallback on R-Car D3.

For now, this driver doesn't support usb role swap for r8a77995.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index ace9cce..99b651b 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -8,6 +8,8 @@ Required properties:
 	      SoC.
 	      "renesas,usb2-phy-r8a7796" if the device is a part of an R8A7796
 	      SoC.
+	      "renesas,usb2-phy-r8a77995" if the device is a part of an
+	      R8A77995 SoC.
 	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3 compatible device.
 
 	      When compatible with the generic version, nodes must list the
-- 
1.9.1
