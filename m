From: Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 1/2] dt-bindings: misc: Add DT bindings to xlnx_vcu driver
Date: Thu, 14 Dec 2017 23:24:15 -0800
Message-ID: <1513322656-4571-2-git-send-email-dshah@xilinx.com>
References: <29198c0a-783e-8aa0-00e4-44b1fa1acef7@infradead.org>
 <1513322656-4571-1-git-send-email-dshah@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513322656-4571-1-git-send-email-dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Add Device Tree binding document for logicoreIP. This logicoreIP
provides the isolation between the processing system and
programmable logic. Also provides the clock related information.

Signed-off-by: Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
Chnages since v3:
 No Changes.	
Chnages since v3:
 * Use "dt-bindings: misc: ..." for the subject.
Changes since v2:
 * Describe the h/w
 * compatible string is updated to make it more specific
   based on the logicoreIP version.
 * Removed that encoder and decoder child nodes and relatd properties as that
   will be a separate driver and dts nodes. other team is working on that.
 * Updated to use as a single driver.

 .../devicetree/bindings/misc/xlnx,vcu.txt          | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,vcu.txt

diff --git a/Documentation/devicetree/bindings/misc/xlnx,vcu.txt b/Documentation/devicetree/bindings/misc/xlnx,vcu.txt
new file mode 100644
index 0000000..6786d67
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/xlnx,vcu.txt
@@ -0,0 +1,31 @@
+LogicoreIP designed compatible with Xilinx ZYNQ family.
+-------------------------------------------------------
+
+General concept
+---------------
+
+LogicoreIP design to provide the isolation between processing system
+and programmable logic. Also provides the list of register set to configure
+the frequency.
+
+Required properties:
+- compatible: shall be one of:
+	"xlnx,vcu"
+	"xlnx,vcu-logicoreip-1.0"
+- reg, reg-names: There are two sets of registers need to provide.
+	1. vcu slcr
+	2. Logicore
+	reg-names should contain name for the each register sequence.
+- clocks: phandle for aclk and pll_ref clocksource
+- clock-names: The identification string, "aclk", is always required for
+   the axi clock. "pll_ref" is required for pll.
+Example:
+
+	xlnx_vcu: vcu@a0040000 {
+		compatible = "xlnx,vcu-logicoreip-1.0";
+		reg = <0x0 0xa0040000 0x0 0x1000>,
+			 <0x0 0xa0041000 0x0 0x1000>;
+		reg-names = "vcu_slcr", "logicore";
+		clocks = <&si570_1>, <&clkc 71>;
+		clock-names = "pll_ref", "aclk";
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
