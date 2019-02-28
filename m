From: Mans Rullgard <mans@mansr.com>
Subject: [PATCH 1/2] dt-bindings: usb: add non-removable-ports hub property
Date: Thu, 28 Feb 2019 18:45:39 +0000
Message-ID: <20190228184540.24570-1-mans@mansr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a non-removable-ports property that lists the hardwired downstream
ports of a hub.  Although hubs can provide this information, they are
not always configured correctly.  An alternate means of indicating this
for built-in USB devices is thus useful.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 Documentation/devicetree/bindings/usb/usb-device.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
index 036be172b1ae..92d863cc96b6 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ b/Documentation/devicetree/bindings/usb/usb-device.txt
@@ -66,6 +66,10 @@ Required properties for host-controller nodes with device nodes:
 - #size-cells: shall be 0
 
 
+Optional properties for hub and host-controller nodes:
+- non-removable-ports: list of hardwired downstream ports
+
+
 Example:
 
 &usb1 {	/* host controller */
-- 
2.20.1
