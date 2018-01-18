From: Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 08/15] usb: dwc3: Make TX/RX threshold configurable
Date: Wed, 17 Jan 2018 17:57:15 -0800
Message-ID: <4afe5640926fac3698abb323cb7be01f32b30ab7.1516239813.git.thinhn@synopsys.com>
References: <cover.1516239813.git.thinhn@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1516239813.git.thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DWC_usb31 periodic transfer at 48K+ bytes per interval may need
modification to the TX/RX packet threshold to achieve optimal result.
Add properties to make it configurable.

Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Signed-off-by: Thinh Nguyen <thinhn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 52fb41046b34..a532fa6bf884 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -55,6 +55,10 @@ Optional properties:
  - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
 	register for post-silicon frame length adjustment when the
 	fladj_30mhz_sdbnd signal is invalid or incorrect.
+ - snps,rx-thr-num-pkt-prd: periodic ESS RX packet threshold count.
+ - snps,rx-max-burst-prd: Max periodic ESS RX burst size.
+ - snps,tx-thr-num-pkt-prd: periodic ESS TX packet threshold count.
+ - snps,tx-max-burst-prd: Max periodic ESS TX burst size.
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
