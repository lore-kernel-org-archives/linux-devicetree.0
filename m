From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2] dt-bindings: arm: Explain capacities-dmips-mhz calculations in example
Date: Mon, 29 Oct 2018 15:13:05 +0530
Message-ID: <1cd2594fff3fb54948dcd2af65ae1867dd1c541a.1540806119.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-arm-kernel@lists.infradead.org, Vincent Guittot <vincent.guittot@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The example contains two values for the capacity currently, 446 in text
and 578 in code. The numbers are all correct but can confuse some of the
readers. This patch tries to explain how the numbers are calculated to
avoid same confusion going forward.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V1->V2:
- The numbers weren't incorrect in the example, just that it needs a
  bit more explanation for some people.

 Documentation/devicetree/bindings/arm/cpu-capacity.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpu-capacity.txt b/Documentation/devicetree/bindings/arm/cpu-capacity.txt
index 9b5685a1d15d..84262cdb8d29 100644
--- a/Documentation/devicetree/bindings/arm/cpu-capacity.txt
+++ b/Documentation/devicetree/bindings/arm/cpu-capacity.txt
@@ -59,9 +59,11 @@ mhz values (normalized w.r.t. the highest value found while parsing the DT).
 ===========================================
 
 Example 1 (ARM 64-bit, 6-cpu system, two clusters):
-capacities-dmips-mhz are scaled w.r.t. 1024 (cpu@0 and cpu@1)
-supposing cluster0@max-freq=1100 and custer1@max-freq=850,
-final capacities are 1024 for cluster0 and 446 for cluster1
+The capacities-dmips-mhz or DMIPS/MHz values (scaled to 1024)
+are 1024 and 578 for cluster0 and cluster1. Further normalization
+is done by the operating system based on cluster0@max-freq=1100 and
+custer1@max-freq=850, final capacities are 1024 for cluster0 and
+446 for cluster1 (576*850/1100).
 
 cpus {
 	#address-cells = <2>;
-- 
2.19.1.568.g152ad8e3369a
