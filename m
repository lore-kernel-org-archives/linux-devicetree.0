Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] dt-bindings: usb: ehci: Add clocks description for R-Car Gen3
Date: Mon, 10 Sep 2018 20:15:47 +0900
Message-Id: <1536578148-27656-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
 Documentation/devicetree/bindings/usb/usb-ehci.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-ehci.txt b/Documentation/devicetree/bindings/usb/usb-ehci.txt
index 0f1b753..406252d 100644
--- a/Documentation/devicetree/bindings/usb/usb-ehci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-ehci.txt
@@ -15,7 +15,11 @@ Optional properties:
  - needs-reset-on-resume : boolean, set this to force EHCI reset after resume
  - has-transaction-translator : boolean, set this if EHCI have a Transaction
 				Translator built into the root hub.
- - clocks : a list of phandle + clock specifier pairs
+ - clocks : a list of phandle + clock specifier pairs. In case of Renesas
+	    R-Car Gen3 SoCs:
+	    - if a host only channel: first clock should be host.
+	    - if a USB DRD channel: first clock should be host and second one
+				    should be peripheral.
  - phys : see usb-hcd.txt in the current directory
  - resets : phandle + reset specifier pair
 
-- 
1.9.1
