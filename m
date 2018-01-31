From: Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 08/15] usb: dwc3: Make TX/RX threshold configurable
Date: Wed, 31 Jan 2018 13:16:38 -0800
Message-ID: <c42923b000093b7fc77a27e64d51b60fb28d3312.1517428812.git.thinhn@synopsys.com>
References: <cover.1517428812.git.thinhn@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1517428812.git.thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DWC_usb31 periodic transfer at 48K+ bytes per interval may need
modification to the TX/RX packet threshold to achieve optimal result.
Add properties to make it configurable.

By default, periodic ESS TX and RX threshold are not enabled. To enable
TX or RX threshold (host mode only), both packet threshold count and max
burst size properties must be set to a valid non-zero value 1-16.

DWC_usb31 programming guide section 1.2.3 and 1.2.4.

Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Signed-off-by: Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 52fb41046b34..e2c1edcd83dd 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -55,6 +55,22 @@ Optional properties:
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

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
