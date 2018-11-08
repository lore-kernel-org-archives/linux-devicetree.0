Return-Path: <SRS0=9/dT=NT=synopsys.com=thinh.nguyen@kernel.org>
Date: Wed, 7 Nov 2018 19:51:15 -0800
Message-ID: <49d57899abea493e72f1b516650a60ef25cdc06c.1541648784.git.thinhn@synopsys.com>
In-Reply-To: <cover.1541648784.git.thinhn@synopsys.com>
References: <cover.1541648784.git.thinhn@synopsys.com>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: [PATCH v5 2/3] usb: dwc3: Add disabling of start_transfer failure quirk
MIME-Version: 1.0
Content-Type: text/plain
To: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

DWC_usb31 peripheral v1.70a-ea06 and prior needs a SW workaround for
isoc START TRANSFER command failure. However, some affected versions may
have RTL patches to fix this without a SW workaround. Add this quirk to
disable the SW workaround when it is not needed.

Synopsys STAR 9001202023: Wrong microframe number for isochronous IN
endpoints.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 636630fb92d7..fc64db0a7a0a 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -37,6 +37,9 @@ Optional properties:
  - phy-names: from the *Generic PHY* bindings; supported names are "usb2-phy"
 	or "usb3-phy".
  - resets: a single pair of phandle and reset specifier
+ - snps,dis-start-transfer-quirk: when set, disable isoc START TRANSFER command
+			failure SW work-around for DWC_usb31 version 1.70a-ea06
+			and prior.
  - snps,usb3_lpm_capable: determines if platform is USB3 LPM capable
  - snps,disable_scramble_quirk: true when SW should disable data scrambling.
 	Only really useful for FPGA builds.
-- 
2.11.0
