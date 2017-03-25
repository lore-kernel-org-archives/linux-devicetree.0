From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v5 2/9] doc: Add documentation for Coresight CPU debug
Date: Sun, 26 Mar 2017 02:23:10 +0800
Message-ID: <1490466197-29163-3-git-send-email-leo.yan@linaro.org>
References: <1490466197-29163-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1490466197-29163-1-git-send-email-leo.yan@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, mike.leach@linaro.org, Suzuki.Poulose@arm.com, sudeep.holla@arm.com
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

Update kernel-parameters.txt to add two new parameters:

- coresight_cpu_debug.enable is a knob to enable debugging at boot time.
- coresight_cpu_debug.idle_constraint is used to constrain idle states
  to ensure Coresight CPU debug component can be accessible.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2ba45ca..6ed57d9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -650,6 +650,27 @@
 			/proc/<pid>/coredump_filter.
 			See also Documentation/filesystems/proc.txt.
 
+	coresight_cpu_debug.enable
+			[ARM,ARM64]
+			Format: <bool>
+			Enable/disable the CPU sampling based debugging.
+			0: default value, disable debugging
+			1: enable debugging at boot time
+
+	coresight_cpu_debug.idle_constraint
+			[ARM,ARM64]
+			Format: <int>
+			Some platforms have designed the idle states to disable
+			CPU power domain and need manually set constraint so
+			can access coresight CPU debug component safely. Setting
+			this parameter for latency requirement in
+			microseconds, finally we can constraint all or partial
+			idle states to ensure the CPU power domain is enabled.
+			Default is -1, which means no limiation to CPU idle
+			states; if set to 0, this means disabling all idle
+			states; user can choose other platform dependent values
+			so can disable specific idle states for the platform.
+
 	cpuidle.off=1	[CPU_IDLE]
 			disable the cpuidle sub-system
 
-- 
2.7.4

