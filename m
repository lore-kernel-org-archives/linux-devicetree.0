From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH] dt-bindings: Add vendor prefix for Linksys
Date: Fri,  9 Jun 2017 11:04:21 +0200
Message-ID: <20170609090421.4984-1-ralph.sennhauser@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Imre Kaloz <kaloz@openwrt.org>, Ralph Sennhauser <ralph.sennhauser@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Linksys (http://www.linksys.com/us/) is a vendor of networking products
mostly for use by home and small business user. The brand is currently
owned by Belkin International, Inc. (http://www.belkin.com/us/).

The vendor prefix linksys is already used by various supported boards.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---

Hi,

Two weeks ago I asked for a vendor comment via Imre Kaloz but haven't heard
back, so sending this one out for inclusion as-is.

Ralph

---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index c03d201..c0cddc8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -174,6 +174,7 @@ lenovo	Lenovo Group Ltd.
 lg	LG Corporation
 licheepi	Lichee Pi
 linaro	Linaro Limited
+linksys	Belkin International, Inc. (Linksys)
 linux	Linux-specific binding
 lltc	Linear Technology Corporation
 lsi	LSI Corp. (LSI Logic)
-- 
2.10.2
