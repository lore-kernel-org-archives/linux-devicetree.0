Return-Path: <SRS0=Ntpg=NO=synopsys.com=thinh.nguyen@kernel.org>
Date: Fri, 2 Nov 2018 18:35:45 -0700
Message-ID: <ca0957e58d1d7c1ed49b53345a5c4ed9209c0968.1541208283.git.thinhn@synopsys.com>
In-Reply-To: <cover.1541208283.git.thinhn@synopsys.com>
References: <cover.1541208283.git.thinhn@synopsys.com>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: [PATCH 1/3] usb: dwc3: Add reference clock properties
MIME-Version: 1.0
Content-Type: text/plain
To: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

Add two new device properties to program the reference clock period and
to enable low power management using the reference clock. This allows a
higher demand to go in low power for Audio Device Class devices. This
feature is currently only valid for DWC_usb31 peripheral controller
v1.80a and higher.

Set "snps,refclk-period-ns" to program the reference clock period. The
valid input periods are as follow:
 +-------------+-----------------+
 | Period (ns) | Freq (MHz)      |
 +-------------+-----------------+
 | 25          | 39.7/40         |
 | 41          | 24.4            |
 | 50          | 20              |
 | 52          | 19.2            |
 | 58          | 17.2            |
 | 62          | 16.1            |
 +-------------+-----------------+

Set "snps,refclk-lpm" to enable low power scheduling of isochronous
transfers by running SOF/ITP counters using the reference clock. Both
"snps,dis_u2_susphy_quirk" and "snps,dis_enblslpm_quirk" must not be
set for this feature to be enabled.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 636630fb92d7..712b344c3a31 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -95,6 +95,24 @@ Optional properties:
 			this and tx-thr-num-pkt-prd to a valid, non-zero value
 			1-16 (DWC_usb31 programming guide section 1.2.3) to
 			enable periodic ESS TX threshold.
+ - snps,refclk-period-ns: set to program the reference clock period. The valid
+   			input periods are as follow:
+			+-------------+-----------------+
+			| Period (ns) | Freq (MHz)      |
+			+-------------+-----------------+
+			| 25          | 39.7/40         |
+			| 41          | 24.4            |
+			| 50          | 20              |
+			| 52          | 19.2            |
+			| 58          | 17.2            |
+			| 62          | 16.1            |
+			+-------------+-----------------+
+ - snps,enable-refclk-lpm: set to enable low power scheduling of isochronous
+			transfers by running SOF/ITP counters using the
+			reference clock. Only valid for DWC_usb31 peripheral
+			controller v1.80a and higher. Both
+			"snps,dis_u2_susphy_quirk" and
+			"snps,dis_enblslpm_quirk" must not be set.
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
  - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
-- 
2.11.0
