From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v9 1/9] coresight: bindings for CPU debug module
Date: Tue,  9 May 2017 10:49:54 +0800
Message-ID: <1494298202-6739-2-git-send-email-leo.yan@linaro.org>
References: <1494298202-6739-1-git-send-email-leo.yan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494298202-6739-1-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

According to ARMv8 architecture reference manual (ARM DDI 0487A.k)
Chapter 'Part H: External debug', the CPU can integrate debug module
and it can support self-hosted debug and external debug. Especially
for supporting self-hosted debug, this means the program can access
the debug module from mmio region; and usually the mmio region is
integrated with coresight.

So add document for binding debug component, includes binding to APB
clock; and also need specify the CPU node which the debug module is
dedicated to specific CPU.

Suggested-by: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/arm/coresight-cpu-debug.txt           | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt

diff --git a/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt b/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
new file mode 100644
index 0000000..2982912
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
@@ -0,0 +1,49 @@
+* CoreSight CPU Debug Component:
+
+CoreSight CPU debug component are compliant with the ARMv8 architecture
+reference manual (ARM DDI 0487A.k) Chapter 'Part H: External debug'. The
+external debug module is mainly used for two modes: self-hosted debug and
+external debug, and it can be accessed from mmio region from Coresight
+and eventually the debug module connects with CPU for debugging. And the
+debug module provides sample-based profiling extension, which can be used
+to sample CPU program counter, secure state and exception level, etc;
+usually every CPU has one dedicated debug module to be connected.
+
+Required properties:
+
+- compatible : should be "arm,coresight-cpu-debug"; supplemented with
+               "arm,primecell" since this driver is using the AMBA bus
+	       interface.
+
+- reg : physical base address and length of the register set.
+
+- clocks : the clock associated to this component.
+
+- clock-names : the name of the clock referenced by the code. Since we are
+                using the AMBA framework, the name of the clock providing
+		the interconnect should be "apb_pclk" and the clock is
+		mandatory. The interface between the debug logic and the
+		processor core is clocked by the internal CPU clock, so it
+		is enabled with CPU clock by default.
+
+- cpu : the CPU phandle the debug module is affined to. When omitted
+	the module is considered to belong to CPU0.
+
+Optional properties:
+
+- power-domains: a phandle to the debug power domain. We use "power-domains"
+                 binding to turn on the debug logic if it has own dedicated
+		 power domain and if necessary to use "cpuidle.off=1" or
+		 "nohlt" in the kernel command line or sysfs node to
+		 constrain idle states to ensure registers in the CPU power
+		 domain are accessible.
+
+Example:
+
+	debug@f6590000 {
+		compatible = "arm,coresight-cpu-debug","arm,primecell";
+		reg = <0 0xf6590000 0 0x1000>;
+		clocks = <&sys_ctrl HI6220_DAPB_CLK>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu0>;
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
