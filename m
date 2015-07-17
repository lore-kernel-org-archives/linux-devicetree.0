From: Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Doc: bindings/clock: Fix typo in devicetree/bindings/clock
Date: Fri, 17 Jul 2015 19:59:48 +0900
Message-ID: <1437130788-22690-1-git-send-email-standby24x7@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org
Cc: Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch fix typos found in Documentation/devicetree/bindings/clock.

Signed-off-by: Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/st/st,clkgen.txt  | 4 ++--
 Documentation/devicetree/bindings/clock/st/st,flexgen.txt | 2 +-
 Documentation/devicetree/bindings/clock/ti/fapll.txt      | 2 +-
 Documentation/devicetree/bindings/clock/ti/mux.txt        | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen.txt
index 78978f1..bde199b 100644
--- a/Documentation/devicetree/bindings/clock/st/st,clkgen.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,clkgen.txt
@@ -1,7 +1,7 @@
 Binding for a Clockgen hardware block found on
 certain STMicroelectronics consumer electronics SoC devices.
 
-A Clockgen node can contain pll, diviser or multiplexer nodes.
+A Clockgen node can contain pll, divider or multiplexer nodes.
 
 We will find only the base address of the Clockgen, this base
 address is common of all subnode.
@@ -40,7 +40,7 @@ address is common of all subnode.
 	};
 
 This binding uses the common clock binding[1].
-Each subnode should use the binding discribe in [2]..[7]
+Each subnode should use the binding describe in [2]..[7]
 
 [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
 [2] Documentation/devicetree/bindings/clock/st,clkgen-divmux.txt
diff --git a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
index b7ee5c7..79b1af3 100644
--- a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
@@ -65,7 +65,7 @@ Required properties:
   outputs).
 
 - clocks : must be set to the parent's phandle. it's could be output clocks of
-  a quadsfs or/and a pll or/and clk_sysin (up to 7 clocks)
+  a quadfs or/and a pll or/and clk_sysin (up to 7 clocks)
 
 - clock-output-names : List of strings used to name the clock outputs.
 
diff --git a/Documentation/devicetree/bindings/clock/ti/fapll.txt b/Documentation/devicetree/bindings/clock/ti/fapll.txt
index c19b3f2..a05713e 100644
--- a/Documentation/devicetree/bindings/clock/ti/fapll.txt
+++ b/Documentation/devicetree/bindings/clock/ti/fapll.txt
@@ -5,7 +5,7 @@ Binding status: Unstable - ABI compatibility may be broken in the future
 This binding uses the common clock binding[1]. It assumes a
 register-mapped FAPLL with usually two selectable input clocks
 (reference clock and bypass clock), and one or more child
-syntesizers.
+synthesizers.
 
 [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
 
diff --git a/Documentation/devicetree/bindings/clock/ti/mux.txt b/Documentation/devicetree/bindings/clock/ti/mux.txt
index 2d0d170..685c23b 100644
--- a/Documentation/devicetree/bindings/clock/ti/mux.txt
+++ b/Documentation/devicetree/bindings/clock/ti/mux.txt
@@ -8,7 +8,7 @@ parents, one of which can be selected as output.  This clock does not
 gate or adjust the parent rate via a divider or multiplier.
 
 By default the "clocks" property lists the parents in the same order
-as they are programmed into the regster.  E.g:
+as they are programmed into the register.  E.g:
 
 	clocks = <&foo_clock>, <&bar_clock>, <&baz_clock>;
 
-- 
2.5.0.rc2.13.g961abca

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
