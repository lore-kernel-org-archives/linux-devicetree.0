From: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH v2] Documentation/devicetree: document cavium-pip rx-delay/tx-delay properties
Date: Thu,  9 Jun 2016 23:37:28 +0300
Message-ID: <1465504648-15038-1-git-send-email-aaro.koskinen@iki.fi>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document cavium-pip rx-delay/tx-delay properties. Currently the board
specific values need to be hardcoded in the platform code, which we
want to avoid when moving to DT-only booting.

Signed-off-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
---

	v2: Update the description.

	v1: http://marc.info/?l=devicetree&m=146507906104224&w=2

 Documentation/devicetree/bindings/net/cavium-pip.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cavium-pip.txt b/Documentation/devicetree/bindings/net/cavium-pip.txt
index 7dbd158..e3b8fe71 100644
--- a/Documentation/devicetree/bindings/net/cavium-pip.txt
+++ b/Documentation/devicetree/bindings/net/cavium-pip.txt
@@ -37,6 +37,12 @@ Properties for PIP port which is a child the PIP interface:
 
 - phy-handle: Optional, see ethernet.txt file in the same directory.
 
+- rx-delay: Delay value for RGMII receive clock. Optional. Disabled if 0.
+  Value range is 1-31, and mapping to the actual delay varies depending on HW.
+
+- tx-delay: Delay value for RGMII transmit clock. Optional. Disabled if 0.
+  Value range is 1-31, and mapping to the actual delay varies depending on HW.
+
 Example:
 
 	pip@11800a0000000 {
-- 
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
