Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] usb: gadget: udc: renesas_usb3: add binging for r8a77965
Date: Tue, 27 Feb 2018 17:16:03 +0900
Message-Id: <1519719363-27850-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1519719363-27850-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1519719363-27850-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds binding for r8a77965 (R-Car M3-N).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas_usb3.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
index 87a45e2..2c071bb 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
@@ -4,6 +4,7 @@ Required properties:
   - compatible: Must contain one of the following:
 	- "renesas,r8a7795-usb3-peri"
 	- "renesas,r8a7796-usb3-peri"
+	- "renesas,r8a77965-usb3-peri"
 	- "renesas,rcar-gen3-usb3-peri" for a generic R-Car Gen3 compatible
 	  device
 
-- 
1.9.1
