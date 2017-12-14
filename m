From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: add sff,sff binding for SFP support
Date: Thu, 14 Dec 2017 10:27:42 +0000
Message-ID: <E1ePQju-0003ps-QW@rmk-PC.armlinux.org.uk>
References: <20171214102712.GP10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171214102712.GP10595-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add "sff,sff" for SFF module support with SFP.  These have a different
phys_id value, and also have the present and rate select signals omitted
compared with their socketed counter-parts.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 Documentation/devicetree/bindings/net/sff,sfp.txt | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/sff,sfp.txt b/Documentation/devicetree/bindings/net/sff,sfp.txt
index 60e970ce10ee..f1c441bedf68 100644
--- a/Documentation/devicetree/bindings/net/sff,sfp.txt
+++ b/Documentation/devicetree/bindings/net/sff,sfp.txt
@@ -3,7 +3,9 @@ Transceiver
 
 Required properties:
 
-- compatible : must be "sff,sfp"
+- compatible : must be one of
+  "sff,sfp" for SFP modules
+  "sff,sff" for soldered down SFF modules
 
 Optional Properties:
 
@@ -11,7 +13,8 @@ Transceiver
   interface
 
 - mod-def0-gpios : GPIO phandle and a specifier of the MOD-DEF0 (AKA Mod_ABS)
-  module presence input gpio signal, active (module absent) high
+  module presence input gpio signal, active (module absent) high. Must
+  not be present for SFF modules
 
 - los-gpios : GPIO phandle and a specifier of the Receiver Loss of Signal
   Indication input gpio signal, active (signal lost) high
@@ -24,10 +27,11 @@ Transceiver
 
 - rate-select0-gpios : GPIO phandle and a specifier of the Rx Signaling Rate
   Select (AKA RS0) output gpio signal, low: low Rx rate, high: high Rx rate
+  Must not be present for SFF modules
 
 - rate-select1-gpios : GPIO phandle and a specifier of the Tx Signaling Rate
   Select (AKA RS1) output gpio signal (SFP+ only), low: low Tx rate, high:
-  high Tx rate
+  high Tx rate. Must not be present for SFF modules
 
 Example #1: Direct serdes to SFP connection
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
