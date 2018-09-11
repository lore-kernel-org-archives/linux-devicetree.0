Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 2/3] dt-bindings: usb: renesas_usbhs: add clock-names property
Date: Tue, 11 Sep 2018 17:47:04 +0900
Message-Id: <1536655625-10550-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1536655625-10550-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1536655625-10550-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index 087140a..15fb3b3 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -26,7 +26,11 @@ Required properties:
 
   - reg: Base address and length of the register for the USBHS
   - interrupts: Interrupt specifier for the USBHS
-  - clocks: A list of phandle + clock specifier pairs
+  - clocks: A list of phandle + clock specifier pairs.
+	    - In case of "renesas,rcar-gen3-usbhs", two clocks are required.
+	      First clock should be peripheral and second one should be host.
+	    - In case of except above, one clock is required. First clock
+	      should be peripheral.
 
 Optional properties:
   - renesas,buswait: Integer to use BUSWAIT register
-- 
1.9.1
