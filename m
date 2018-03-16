Return-Path: <SRS0=yttm=GG=synopsys.com=Thinh.Nguyen@kernel.org>
Date: Fri, 16 Mar 2018 15:35:38 -0700
Message-ID: <772528b787dc3f8c5618de982c4a4d40ab5418fe.1521239259.git.thinhn@synopsys.com>
In-Reply-To: <cover.1521239259.git.thinhn@synopsys.com>
References: <cover.1521239259.git.thinhn@synopsys.com>
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v5 07/10] usb: dwc3: Make TX/RX threshold configurable
MIME-Version: 1.0
Content-Type: text/plain
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <John.Youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

DWC_usb31 periodic transfer at 48K+ bytes per interval may need
modification to the TX/RX packet threshold to achieve optimal result.
Add properties to make it configurable.

By default, periodic ESS TX and RX threshold are not enabled. To enable
TX or RX threshold (host mode only), both packet threshold count and max
burst size properties must be set to a valid non-zero value 1-16.

DWC_usb31 programming guide section 1.2.3 and 1.2.4.

Cc: John Youn <johnyoun@synopsys.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 44e8bab159ad..0dbd3083e7dd 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -57,6 +57,22 @@ Optional properties:
  - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
 	register for post-silicon frame length adjustment when the
 	fladj_30mhz_sdbnd signal is invalid or incorrect.
+ - snps,rx-thr-num-pkt-prd: periodic ESS RX packet threshold count - host mode
+			only. Set this and rx-max-burst-prd to a valid,
+			non-zero value 1-16 (DWC_usb31 programming guide
+			section 1.2.4) to enable periodic ESS RX threshold.
+ - snps,rx-max-burst-prd: max periodic ESS RX burst size - host mode only. Set
+			this and rx-thr-num-pkt-prd to a valid, non-zero value
+			1-16 (DWC_usb31 programming guide section 1.2.4) to
+			enable periodic ESS RX threshold.
+ - snps,tx-thr-num-pkt-prd: periodic ESS TX packet threshold count - host mode
+			only. Set this and tx-max-burst-prd to a valid,
+			non-zero value 1-16 (DWC_usb31 programming guide
+			section 1.2.3) to enable periodic ESS TX threshold.
+ - snps,tx-max-burst-prd: max periodic ESS TX burst size - host mode only. Set
+			this and tx-thr-num-pkt-prd to a valid, non-zero value
+			1-16 (DWC_usb31 programming guide section 1.2.3) to
+			enable periodic ESS TX threshold.
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
 
-- 
2.11.0
