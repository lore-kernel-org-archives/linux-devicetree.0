From: Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] [linux-next] bus:qcom : Fix typo in qcom,ebi2.txt
Date: Thu,  5 Jan 2017 23:43:07 +0900
Message-ID: <20170105144307.21871-1-standby24x7@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch fix 2 spelling typos found in qcom,ebi2.txt

Signed-off-by: Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/bus/qcom,ebi2.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/qcom,ebi2.txt b/Documentation/devicetree/bindings/bus/qcom,ebi2.txt
index 920681f552db..5a7d567f6833 100644
--- a/Documentation/devicetree/bindings/bus/qcom,ebi2.txt
+++ b/Documentation/devicetree/bindings/bus/qcom,ebi2.txt
@@ -51,7 +51,7 @@ Required properties:
 - compatible: should be one of:
   "qcom,msm8660-ebi2"
   "qcom,apq8060-ebi2"
-- #address-cells: shoule be <2>: the first cell is the chipselect,
+- #address-cells: should be <2>: the first cell is the chipselect,
   the second cell is the offset inside the memory range
 - #size-cells: should be <1>
 - ranges: should be set to:
@@ -64,7 +64,7 @@ Required properties:
 - reg: two ranges of registers: EBI2 config and XMEM config areas
 - reg-names: should be "ebi2", "xmem"
 - clocks: two clocks, EBI_2X and EBI
-- clock-names: shoule be "ebi2x", "ebi2"
+- clock-names: should be "ebi2x", "ebi2"
 
 Optional subnodes:
 - Nodes inside the EBI2 will be considered device nodes.
@@ -100,7 +100,7 @@ Optional properties arrays for FAST chip selects:
   assertion, with respect to the cycle where ADV (address valid) is asserted.
   2 means 2 cycles between ADV and OE. Valid values 0, 1, 2 or 3.
 - qcom,xmem-read-hold-cycles: the length in cycles of the first segment of a
-  read transfer. For a single read trandfer this will be the time from CS
+  read transfer. For a single read transfer this will be the time from CS
   assertion to OE assertion. Valid values 0 thru 15.
 
 
-- 
2.11.0.161.g6610af872f64

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
