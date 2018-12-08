Return-Path: <SRS0=Q85b=OR=synopsys.com=thinh.nguyen@kernel.org>
Date: Fri, 7 Dec 2018 18:27:30 -0800
Message-ID: <83adc98adc1760a0fad87d81d171e1dac783e7e5.1544235317.git.thinhn@synopsys.com>
In-Reply-To: <cover.1544235317.git.thinhn@synopsys.com>
References: <cover.1544235317.git.thinhn@synopsys.com>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: [PATCH v2 1/4] usb: dwc3: Add property snps,refclk-period-ns
MIME-Version: 1.0
Content-Type: text/plain
To: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

This patch introduces property "snps,refclk-period-ns" to inform the
controller of the reference clock period. If the reference clock period
is different from the default Core Consultant setting, then this
property can be set to the reference clock period.

This property does not control the reference clock rate. The controller
uses this value to perform internal timing calculations that are based
on the reference clock.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
Changes in v2:
- Split from "usb: dwc3: Add reference clock properties"
- Revise commit message and property description

 Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 8e5265e9f658..b7e67edff9b2 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -99,6 +99,8 @@ Optional properties:
 			this and tx-thr-num-pkt-prd to a valid, non-zero value
 			1-16 (DWC_usb31 programming guide section 1.2.3) to
 			enable periodic ESS TX threshold.
+ - snps,refclk-period-ns: if set, this value informs the controller of the
+			reference clock period in nanoseconds.
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
  - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
-- 
2.11.0
