Return-Path: <SRS0=Q85b=OR=synopsys.com=thinh.nguyen@kernel.org>
Date: Fri, 7 Dec 2018 18:27:43 -0800
Message-ID: <a156d9779fe56ea7b5cc628c90b52d0162b5ae68.1544235317.git.thinhn@synopsys.com>
In-Reply-To: <cover.1544235317.git.thinhn@synopsys.com>
References: <cover.1544235317.git.thinhn@synopsys.com>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: [PATCH v2 3/4] usb: dwc3: Add property snps,enable-refclk-sof
MIME-Version: 1.0
Content-Type: text/plain
To: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds a property to enable the controller to track the
frame number based on the reference clock.

When operating in USB 2.0 mode, the peripheral controller uses the USB2
PHY clocks to track the frame number. This prevents the controller from
suspending the USB2 PHY when the device goes into low power. Version
1.80a of the DWC_usb31 peripheral controller introduces a way to track
frame number based on the reference clock instead. This feature allows
the controller to suspend the USB2 PHY when the device goes into low
power. This improves power saving for devices that have isochronous
endpoints.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2:
- Revise property description
- Rename property from snps,enable-refclk-lpm to snps,enable-refclk-sof

 Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index b7e67edff9b2..01b948fff0eb 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -101,6 +101,9 @@ Optional properties:
 			enable periodic ESS TX threshold.
  - snps,refclk-period-ns: if set, this value informs the controller of the
 			reference clock period in nanoseconds.
+ - snps,enable-refclk-sof: set to enable reference clock based frame number
+			tracking while in low power, allowing the controller to
+			suspend the PHY during low power states.
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
  - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
-- 
2.11.0
