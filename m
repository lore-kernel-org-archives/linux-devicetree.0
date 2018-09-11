From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH] dts: juno: Enable coresight tmc scatter gather in ETR
Date: Tue, 11 Sep 2018 09:47:21 +0100
Message-ID: <1536655641-26192-1-git-send-email-suzuki.poulose@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org, coresight@lists.linaro.org, robert.walker@arm.com, devicetree@vger.kernel.org, robh@kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pierlisi <lorenzo.pieralisi@arm.com>
List-Id: devicetree@vger.kernel.org

We do not enable scatter-gather mode in the TMC-ETR by default
to prevent malfunctioning of systems where the ETR may not be
properly connected to the memory subsystem to allow for simultaneous
READ/WRITE transactions when used in SG mode. Instead we whitelist
the platforms where we know that it is safe to use the mode.

All revisions of Juno have a proper ETR connection and hence
white list them.

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Lorenzo Pierlisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index ce56a4a..3596e5d 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -199,6 +199,7 @@
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
 		power-domains = <&scpi_devpd 0>;
+		arm,scatter-gather;
 		port {
 			etr_in_port: endpoint {
 				slave-mode;
-- 
2.7.4
