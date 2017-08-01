From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: update OpenFirmware document links to devicetree.org
Date: Tue,  1 Aug 2017 11:03:34 -0500
Message-ID: <20170801160334.15697-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>, Harvey Hunt <harvey.hunt@imgtec.com>
List-Id: devicetree@vger.kernel.org

The mirrors for old, but still referenced OF documents have disappeared.
A new mirror has been setup on devicetree.org at:

http://devicetree.org/open-firmware/home.html

Update the URLs in the binding documents with the new mirror.

Cc: Brian Norris <briannorris@chromium.org>
Cc: Harvey Hunt <harvey.hunt@imgtec.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/pci.txt        | 4 ++--
 Documentation/devicetree/bindings/usb/usb-device.txt | 2 +-
 Documentation/devicetree/booting-without-of.txt      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/pci.txt b/Documentation/devicetree/bindings/pci/pci.txt
index 50f9e2ca5b13..c77981c5dd18 100644
--- a/Documentation/devicetree/bindings/pci/pci.txt
+++ b/Documentation/devicetree/bindings/pci/pci.txt
@@ -1,12 +1,12 @@
 PCI bus bridges have standardized Device Tree bindings:
 
 PCI Bus Binding to: IEEE Std 1275-1994
-http://www.firmware.org/1275/bindings/pci/pci2_1.pdf
+http://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf
 
 And for the interrupt mapping part:
 
 Open Firmware Recommended Practice: Interrupt Mapping
-http://www.firmware.org/1275/practice/imap/imap0_9d.pdf
+http://www.devicetree.org/open-firmware/practice/imap/imap0_9d.pdf
 
 Additionally to the properties specified in the above standards a host bridge
 driver implementation may support the following properties:
diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
index 1c35e7b665e1..d5f1992b797c 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ b/Documentation/devicetree/bindings/usb/usb-device.txt
@@ -2,7 +2,7 @@ Generic USB Device Properties
 
 Usually, we only use device tree for hard wired USB device.
 The reference binding doc is from:
-http://www.firmware.org/1275/bindings/usb/usb-1_0.ps
+http://www.devicetree.org/open-firmware/bindings/usb/usb-1_0.ps
 
 Required properties:
 - compatible: usbVID,PID. The textual representation of VID, PID shall
diff --git a/Documentation/devicetree/booting-without-of.txt b/Documentation/devicetree/booting-without-of.txt
index fb740445199f..417f91110010 100644
--- a/Documentation/devicetree/booting-without-of.txt
+++ b/Documentation/devicetree/booting-without-of.txt
@@ -1282,7 +1282,7 @@ hierarchy and routing of interrupts in the hardware.
 The interrupt tree model is fully described in the
 document "Open Firmware Recommended Practice: Interrupt
 Mapping Version 0.9".  The document is available at:
-<http://www.openfirmware.org/ofwg/practice/>
+<http://www.devicetree.org/open-firmware/practice/>
 
 1) interrupts property
 ----------------------
-- 
2.11.0
