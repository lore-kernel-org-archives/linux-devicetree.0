From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 13/15] arm: dts: r8a7743: Add missing OPP properties for CPUs
Date: Fri, 25 May 2018 16:01:59 +0530
Message-ID: <5821a6dbe413b5a217ca1e24ddf8ebfa63ba6ef0.1527244201.git.viresh.kumar@linaro.org>
References: <cover.1527244200.git.viresh.kumar@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1527244200.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1527244200.git.viresh.kumar@linaro.org>
References: <cover.1527244200.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, ionela.voinescu@arm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, chris.redpath@arm.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The OPP properties, like "operating-points", should either be present
for all the CPUs of a cluster or none. If these are present only for a
subset of CPUs of a cluster then things will start falling apart as soon
as the CPUs are brought online in a different order. For example, this
will happen because the operating system looks for such properties in
the CPU node it is trying to bring up, so that it can create an OPP
table.

Add such missing properties.

Fix other missing property (clock latency) as well to make it all
work.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/boot/dts/r8a7743.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 142949d7066f..e4fb31c4f0ee 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -98,8 +98,17 @@
 			reg = <1>;
 			clock-frequency = <1500000000>;
 			clocks = <&cpg CPG_CORE R8A7743_CLK_Z>;
+			clock-latency = <300000>; /* 300 us */
 			power-domains = <&sysc R8A7743_PD_CA15_CPU1>;
 			next-level-cache = <&L2_CA15>;
+
+			/* kHz - uV - OPPs unknown yet */
+			operating-points = <1500000 1000000>,
+					   <1312500 1000000>,
+					   <1125000 1000000>,
+					   < 937500 1000000>,
+					   < 750000 1000000>,
+					   < 375000 1000000>;
 		};
 
 		L2_CA15: cache-controller-0 {
-- 
2.15.0.194.g9af6a3dea062
