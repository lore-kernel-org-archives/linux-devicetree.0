From: Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 08/15] usb: dwc3: Make RX/TX threshold configurable
Date: Fri, 5 Jan 2018 12:14:48 -0800
Message-ID: <8446dc260efb993507a219ae11815607b8e58027.1515182391.git.thinhn@synopsys.com>
References: <cover.1515182391.git.thinhn@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1515182391.git.thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DWC_usb31 periodic transfer at 48K+ bytes per interval may need
modification to the TX/RX packet threshold to achieve optimal result.
Add properties to make it configurable.

Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Signed-off-by: Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 52fb41046b34..02dde83d02fa 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -55,6 +55,12 @@ Optional properties:
  - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
 	register for post-silicon frame length adjustment when the
 	fladj_30mhz_sdbnd signal is invalid or incorrect.
+ - snps,rx_thr_sel_prd: set to enable periodic ESS RX packet threshold.
+ - snps,rx_thr_num_pkt_prd: periodic ESS RX packet threshold count.
+ - snps,rx_max_burst_prd: Max periodic ESS RX burst size.
+ - snps,tx_thr_sel_prd: set to enable periodic ESS TX packet threshold.
+ - snps,tx_thr_num_pkt_prd: periodic ESS TX packet threshold count.
+ - snps,tx_max_burst_prd: Max periodic ESS TX burst size.
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
