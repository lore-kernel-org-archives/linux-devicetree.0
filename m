From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH] dt-bindings: ci-hdrc-usb2: s/gadget-itc-setting/itc-setting in example
Date: Thu, 16 Jun 2016 16:13:18 +0800
Message-ID: <1466064798-867-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, peter.chen@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

What the code expect is "itc-setting" rather than "gadget-itc-setting",
and this is also correctly described in the optional properties.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 1084e2b..341dc67 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -93,7 +93,7 @@ Example:
 		phys = <&usb_phy0>;
 		phy-names = "usb-phy";
 		vbus-supply = <&reg_usb0_vbus>;
-		gadget-itc-setting = <0x4>; /* 4 micro-frames */
+		itc-setting = <0x4>; /* 4 micro-frames */
 		 /* Incremental burst of unspecified length */
 		ahb-burst-config = <0x0>;
 		tx-burst-size-dword = <0x10>; /* 64 bytes */
-- 
2.8.1
