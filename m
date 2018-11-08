Return-Path: <SRS0=9/dT=NT=synopsys.com=thinh.nguyen@kernel.org>
Date: Wed, 7 Nov 2018 18:10:36 -0800
Message-ID: <9aa6ae1c68f7936f5f145c8f770348d76106b865.1541642865.git.thinhn@synopsys.com>
In-Reply-To: <cover.1541642865.git.thinhn@synopsys.com>
References: <cover.1541642865.git.thinhn@synopsys.com>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: [PATCH 2/3] usb: dwc3: Add a property to disable USB2 LPM
MIME-Version: 1.0
Content-Type: text/plain
To: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

Add an option to disable USB2 LPM from host. There maybe cases where the
user does not want to enable USB2 LPM (e.g. USB2 LPM is broken).

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 636630fb92d7..7e33e53e7c29 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -37,6 +37,7 @@ Optional properties:
  - phy-names: from the *Generic PHY* bindings; supported names are "usb2-phy"
 	or "usb3-phy".
  - resets: a single pair of phandle and reset specifier
+ - snps,usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
  - snps,usb3_lpm_capable: determines if platform is USB3 LPM capable
  - snps,disable_scramble_quirk: true when SW should disable data scrambling.
 	Only really useful for FPGA builds.
-- 
2.11.0
