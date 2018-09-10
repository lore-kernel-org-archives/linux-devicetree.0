Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] dt-bindings: usb: ohci: Add clocks description for R-Car Gen3
Date: Mon, 10 Sep 2018 20:15:48 +0900
Message-Id: <1536578148-27656-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1536578148-27656-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1536578148-27656-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds detailed information of an optional property "clocks"
description for R-Car Gen3.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/usb-ohci.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-ohci.txt b/Documentation/devicetree/bindings/usb/usb-ohci.txt
index a8d2103..aaaa525 100644
--- a/Documentation/devicetree/bindings/usb/usb-ohci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-ohci.txt
@@ -12,7 +12,11 @@ Optional properties:
 - no-big-frame-no : boolean, set if frame_no lives in bits [15:0] of HCCA
 - remote-wakeup-connected: remote wakeup is wired on the platform
 - num-ports : u32, to override the detected port count
-- clocks : a list of phandle + clock specifier pairs
+- clocks : a list of phandle + clock specifier pairs. In case of Renesas
+	   R-Car Gen3 SoCs:
+	   - if a host only channel: first clock should be host.
+	   - if a USB DRD channel: first clock should be host and second one
+				   should be peripheral.
 - phys : see usb-hcd.txt in the current directory
 - resets : a list of phandle + reset specifier pairs
 
-- 
1.9.1
