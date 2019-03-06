From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] dt-bindings: usb: dwc2: document the vbus-supply property
Date: Wed,  6 Mar 2019 22:24:31 +0100
Message-ID: <20190306212431.5779-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: hminas@synopsys.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, amelie.delaunay@st.com, felipe.balbi@linux.intel.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Various boards have an external VBUS supply regulator. This regulator
depends on the current mode of the controller which is defined as:
- dr_mode set to either "host" or "peripheral" (fixed value)
- dr_mode set to "otg", based on the OTG status the dwc2 controller
  internally switches between "host" and "peripheral" mode (selection
  happens at runtime)

Based on the current mode the regulator has to be enabled or disabled:
- host: provide power to the connected USB device, thus the regulator
  has to be enabled
- peripheral: the host device to which the controller is connected
  provides power, thus the regulator has to be disabled

Add the dt-bindings documentation for this property so .dts authors know
that this property exists and how it behaves.

Fixes: 531ef5ebea9639 ("usb: dwc2: add support for host mode external vbus supply")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 6dc3c4a34483..1e8a775a0e72 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -31,6 +31,10 @@ Refer to clk/clock-bindings.txt for generic clock consumer properties
 Optional properties:
 - phys: phy provider specifier
 - phy-names: shall be "usb2-phy"
+- vbus-supply: reference to the VBUS regulator. Depending on the current mode
+  this is enabled (in "host" mode") or disabled (in "peripheral" mode). The
+  regulator is updated if the controller is configured in "otg" mode and the
+  status changes between "host" and "peripheral".
 Refer to phy/phy-bindings.txt for generic phy consumer properties
 - dr_mode: shall be one of "host", "peripheral" and "otg"
   Refer to usb/generic.txt
-- 
2.21.0
