From: Roger Quadros <rogerq@ti.com>
Subject: [PATCH v2 2/3] dt-bindings: usb: keystone-usb: Add ti,am654-dwc3 support
Date: Thu, 10 Jan 2019 17:04:29 +0200
Message-ID: <1547132670-5908-3-git-send-email-rogerq@ti.com>
References: <1547132670-5908-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547132670-5908-1-git-send-email-rogerq@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org
Cc: vigneshr@ti.com, robh+dt@kernel.org, nsekhar@ti.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

The AM654 SoC from TI contains a DWC3 controller. Add
support for it.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 Documentation/devicetree/bindings/usb/keystone-usb.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/keystone-usb.txt b/Documentation/devicetree/bindings/usb/keystone-usb.txt
index f96e09f..77df82e 100644
--- a/Documentation/devicetree/bindings/usb/keystone-usb.txt
+++ b/Documentation/devicetree/bindings/usb/keystone-usb.txt
@@ -3,7 +3,9 @@ TI Keystone Soc USB Controller
 DWC3 GLUE
 
 Required properties:
- - compatible: should be "ti,keystone-dwc3".
+ - compatible: should be
+		"ti,keystone-dwc3" for Keystone 2 SoCs
+		"ti,am654-dwc3" for AM654 SoC
  - #address-cells, #size-cells : should be '1' if the device has sub-nodes
    with 'reg' property.
  - reg : Address and length of the register set for the USB subsystem on
@@ -21,7 +23,7 @@ SoCs only:
 - clock-names:		Must be "usb".
 
 
-The following are mandatory properties for Keystone 2 66AK2G SoCs only:
+The following are mandatory properties for 66AK2G and AM654:
 
 - power-domains:	Should contain a phandle to a PM domain provider node
 			and an args specifier containing the USB device id
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
