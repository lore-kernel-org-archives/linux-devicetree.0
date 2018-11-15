Return-Path: <SRS0=T75w=N2=synopsys.com=thinh.nguyen@kernel.org>
Date: Wed, 14 Nov 2018 22:56:48 -0800
Message-ID: <d4d097f9545e9a19c1986f63bc0fd6f1bba252f1.1542264763.git.thinhn@synopsys.com>
In-Reply-To: <cover.1542264763.git.thinhn@synopsys.com>
References: <cover.1542264763.git.thinhn@synopsys.com>
From: Thinh Nguyen <thinh.nguyen@synopsys.com>
Subject: [PATCH v7 1/2] usb: dwc3: Add disabling of start_transfer failure quirk
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 7e33e53e7c29..8e5265e9f658 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -39,6 +39,9 @@ Optional properties:
  - resets: a single pair of phandle and reset specifier
  - snps,usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
  - snps,usb3_lpm_capable: determines if platform is USB3 LPM capable
+ - snps,dis-start-transfer-quirk: when set, disable isoc START TRANSFER command
+			failure SW work-around for DWC_usb31 version 1.70a-ea06
+			and prior.
  - snps,disable_scramble_quirk: true when SW should disable data scrambling.
 	Only really useful for FPGA builds.
  - snps,has-lpm-erratum: true when DWC3 was configured with LPM Erratum enabled
-- 
2.11.0
