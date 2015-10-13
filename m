From: Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] drm: sti: fix typos in stih4xx binding
Date: Tue, 13 Oct 2015 13:51:39 +0200
Message-ID: <1444737099-20046-1-git-send-email-michael.opdenacker@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, vincent.abriou-qxv4g6HH51o@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fix typos in the st,stih4xx binding, in particular replacing
"pinctrl-name" by "pinctrl-names".

Fix minor typos in the descriptions too.

Signed-off-by: Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 Documentation/devicetree/bindings/gpu/st,stih4xx.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/st,stih4xx.txt b/Documentation/devicetree/bindings/gpu/st,stih4xx.txt
index a36dfce0032e..a352ed30cd70 100644
--- a/Documentation/devicetree/bindings/gpu/st,stih4xx.txt
+++ b/Documentation/devicetree/bindings/gpu/st,stih4xx.txt
@@ -61,7 +61,7 @@ STMicroelectronics stih4xx platforms
   - reg-names: names of the mapped memory regions listed in regs property in
     the same order.
   - interrupts : HDMI interrupt number to the CPU.
-  - interrupt-names: name of the interrupts listed in interrupts property in
+  - interrupt-names: names of the interrupts listed in interrupts property in
     the same order
   - clocks: from common clock binding: handle hardware IP needed clocks, the
     number of clocks may depend of the SoC type.
@@ -95,7 +95,7 @@ sti-dvo:
   - clock-names: names of the clocks listed in clocks property in the same
     order.
   - pinctrl-0: pin control handle
-  - pinctrl-name: names of the pin control to use
+  - pinctrl-names: names of the pin control states to use
   - sti,panel: phandle of the panel connected to the DVO output
 
 sti-hqvdp:
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
