Return-Path: <SRS0=Hucj=TO=renesas.com=prvs=40371367b7=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 12/15] dt-bindings: usb: renesas_usbhs: Add support for r7s9210
Date: Tue, 14 May 2019 09:56:02 -0500
Message-ID: <20190514145605.19112-13-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-1-chris.brandt@renesas.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

Add support for r7s9210 (RZ/A2M) SoC

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index b8acc2a994a8..11c99d079dfb 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -20,9 +20,11 @@ Required properties:
 	- "renesas,usbhs-r8a77990" for r8a77990 (R-Car E3) compatible device
 	- "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
 	- "renesas,usbhs-r7s72100" for r7s72100 (RZ/A1) compatible device
+	- "renesas,usbhs-r7s9210" for r7s72100 (RZ/A2) compatible device
 	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible devices
 	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 or RZ/G2 compatible devices
 	- "renesas,rza1-usbhs" for RZ/A1 compatible device
+	- "renesas,rza2-usbhs" for RZ/A2 compatible device
 
 	When compatible with the generic version, nodes must list the
 	SoC-specific version corresponding to the platform first followed
-- 
2.16.1
