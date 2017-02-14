From: Greentime Hu <green.hu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dt-bindings: net: generalize moxart-mac to support all
 faraday based ftmac IP
Date: Tue, 14 Feb 2017 16:56:30 +0800
Message-ID: <20170214085621.GA11829@app09>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Andestech and moxa use the same faraday mac IP, so we use faraday,ftmac.txt to describe it.

Signed-off-by: Greentime Hu <green.hu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../net/{moxa,moxart-mac.txt => faraday,ftmac.txt} |    7 +++++--
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 2 files changed, 6 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/net/{moxa,moxart-mac.txt => faraday,ftmac.txt} (68%)

diff --git a/Documentation/devicetree/bindings/net/moxa,moxart-mac.txt b/Documentation/devicetree/bindings/net/faraday,ftmac.txt
similarity index 68%
rename from Documentation/devicetree/bindings/net/moxa,moxart-mac.txt
rename to Documentation/devicetree/bindings/net/faraday,ftmac.txt
index 583418b..be4f55e 100644
--- a/Documentation/devicetree/bindings/net/moxa,moxart-mac.txt
+++ b/Documentation/devicetree/bindings/net/faraday,ftmac.txt
@@ -1,8 +1,11 @@
-MOXA ART Ethernet Controller
+Faraday Ethernet Controller
 
 Required properties:
 
-- compatible : Must be "moxa,moxart-mac"
+- compatible : Must contain "faraday,ftmac", as well as one of
+		the SoC specific identifiers:
+		"andestech,atmac100"
+		"moxa,moxart-mac"
 - reg : Should contain register location and length
 - interrupts : Should contain the mac interrupt number
 
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 16d3b5e..489c336 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -102,6 +102,7 @@ everest	Everest Semiconductor Co. Ltd.
 everspin	Everspin Technologies, Inc.
 excito	Excito
 ezchip	EZchip Semiconductor
+faraday	Faraday Technology Corporation
 fcs	Fairchild Semiconductor
 firefly	Firefly
 focaltech	FocalTech Systems Co.,Ltd
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
