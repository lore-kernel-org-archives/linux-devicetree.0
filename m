From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/8] dt-bindings: usb: fix example hub node name
Date: Thu,  9 Nov 2017 18:07:16 +0100
Message-ID: <20171109170723.10960-2-johan@kernel.org>
References: <20171109170723.10960-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171109170723.10960-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>, Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

According to the OF Recommended Practice for USB, hub nodes shall be
named "hub", but the example had mixed up the label and node names. Fix
the node name and drop the redundant label.

While at it, remove a newline and add a missing semicolon to the example
source.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 Documentation/devicetree/bindings/usb/usb-device.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
index ce02cebac26a..4df7e22e0084 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ b/Documentation/devicetree/bindings/usb/usb-device.txt
@@ -16,12 +16,11 @@ Required properties:
 Example:
 
 &usb1 {
-
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	hub: genesys@1 {
+	hub@1 {
 		compatible = "usb5e3,608";
 		reg = <1>;
 	};
-}
+};
-- 
2.15.0
