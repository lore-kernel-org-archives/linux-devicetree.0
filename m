From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] dt-bindings: clock: ti-sci: Fix incorrect usage of headers
Date: Tue, 11 Jul 2017 17:36:15 -0500
Message-ID: <20170711223615.29398-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The clock consumer usage description was erroneously referring to
couple of dt-binding headers that are no longer valid. The definition
and/or usage of these headers is incorrect and the only file present
at the moment, dt-bindings/soc/k2g.h is also being cleaned up. The
examples in this binding were updated properly, but the update to
description was missed out. So, fix this.

Fixes: 8f306cfe4383 ("Documentation: dt: Add TI SCI clock driver")
Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
---
Hi Stephen,

Looks like this was missed during the update/repost of the ti-sci-clk
driver/binding. FYI, Santosh is going to pickup the header file cleanup
patch https://patchwork.kernel.org/patch/9741279/ for the next merge
window.

regards
Suman

 Documentation/devicetree/bindings/clock/ti,sci-clk.txt | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt b/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
index 1e884c40ab50..4e59dc6b1778 100644
--- a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
+++ b/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
@@ -14,10 +14,9 @@ Required properties:
 - compatible: Must be "ti,k2g-sci-clk"
 - #clock-cells: Shall be 2.
   In clock consumers, this cell represents the device ID and clock ID
-  exposed by the PM firmware. The assignments can be found in the header
-  files <dt-bindings/genpd/<soc>.h> (which covers the device IDs) and
-  <dt-bindings/clock/<soc>.h> (which covers the clock IDs), where <soc>
-  is the SoC involved, for example 'k2g'.
+  exposed by the PM firmware. The list of valid values for the device IDs
+  and clocks IDs for 66AK2G SoC are documented at
+  http://processors.wiki.ti.com/index.php/TISCI#66AK2G02_Data
 
 Examples:
 --------
-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
