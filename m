From: Mischa Jonker <Mischa.Jonker-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 2/2] ARC: Add documentation on DT binding for ARC700 PMU
Date: Thu,  7 Nov 2013 14:55:12 +0100
Message-ID: <1383832512-21130-3-git-send-email-mjonker@synopsys.com>
References: <1383832512-21130-1-git-send-email-mjonker@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383832512-21130-1-git-send-email-mjonker-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org
Cc: Mischa Jonker <Mischa.Jonker-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Mischa Jonker <mjonker-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arc/pmu.txt |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arc/pmu.txt

diff --git a/Documentation/devicetree/bindings/arc/pmu.txt b/Documentation/devicetree/bindings/arc/pmu.txt
new file mode 100644
index 0000000..49d5173
--- /dev/null
+++ b/Documentation/devicetree/bindings/arc/pmu.txt
@@ -0,0 +1,24 @@
+* ARC Performance Monitor Unit
+
+The ARC 700 can be configured with a pipeline performance monitor for counting
+CPU and cache events like cache misses and hits.
+
+Note that:
+ * ARC 700 refers to a family of ARC processor cores;
+   - There is only one type of PMU available for the whole family;
+   - The PMU may support different sets of events; supported events are probed
+     at boot time, as required by the reference manual.
+
+ * The ARC 700 PMU does not support interrupts; although HW events may be
+   counted, the HW events themselves cannot serve as a trigger for a sample.
+
+Required properties:
+
+- compatible : should contain
+	"snps,arc700-pmu"
+
+Example:
+
+pmu {
+        compatible = "snps,arc700-pmu";
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
