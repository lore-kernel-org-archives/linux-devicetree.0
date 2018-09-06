Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/3] dt-bindings: usb: renesas_usbhs: add clock-names property
Date: Thu,  6 Sep 2018 14:50:13 +0900
Message-Id: <1536213014-1325-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1536213014-1325-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1536213014-1325-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

R-Car Gen3 needs to enable clocks of both host and peripheral.
Otherwise, other side device cannot work correctly. So, this patch
adds a property of clock-names for R-Car Gen3 as an optional.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index 087140a..a8fa3ec 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -37,6 +37,8 @@ Optional properties:
   - dmas: Must contain a list of references to DMA specifiers.
   - dma-names : named "ch%d", where %d is the channel number ranging from zero
                 to the number of channels (DnFIFOs) minus one.
+  - clock-names: For a "renesas,rcar-gen3-usbhs" compatible device,
+		 "hsusb" and "ehci/ohci" can be set.
 
 Example:
 	usbhs: usb@e6590000 {
-- 
1.9.1
