Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] dt-bindings: usb: renesas_usb3: add bindings for r8a77990
Date: Tue,  2 Oct 2018 20:58:26 +0900
Message-Id: <1538481507-24821-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1538481507-24821-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1538481507-24821-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds bindings for r8a77990 (R-Car E3).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas_usb3.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
index b22f0a5..d366555 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
@@ -6,6 +6,7 @@ Required properties:
 	- "renesas,r8a7795-usb3-peri"
 	- "renesas,r8a7796-usb3-peri"
 	- "renesas,r8a77965-usb3-peri"
+	- "renesas,r8a77990-usb3-peri"
 	- "renesas,rcar-gen3-usb3-peri" for a generic R-Car Gen3 or RZ/G2
 	  compatible device
 
-- 
1.9.1
