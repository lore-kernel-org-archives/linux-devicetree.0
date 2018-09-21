Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/5] dt-bindings: usb: renesas_usbhs: add bindings for r8a77990
Date: Fri, 21 Sep 2018 21:26:31 +0900
Message-Id: <1537532792-20376-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1537532792-20376-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1537532792-20376-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds bindings for r8a77990 (R-Car E3).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index 15fb3b3..a649329 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -14,6 +14,7 @@ Required properties:
 	- "renesas,usbhs-r8a7795" for r8a7795 (R-Car H3) compatible device
 	- "renesas,usbhs-r8a7796" for r8a7796 (R-Car M3-W) compatible device
 	- "renesas,usbhs-r8a77965" for r8a77965 (R-Car M3-N) compatible device
+	- "renesas,usbhs-r8a77990" for r8a77990 (R-Car E3) compatible device
 	- "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
 	- "renesas,usbhs-r7s72100" for r7s72100 (RZ/A1) compatible device
 	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible devices
-- 
1.9.1
