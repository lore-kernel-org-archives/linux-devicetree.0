From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 05/11] arm64: dts: Add clock DT nodes for Stingray SOC
Date: Mon, 15 May 2017 17:32:15 +0530
Message-ID: <1494849741-21294-6-git-send-email-anup.patel@broadcom.com>
References: <1494849741-21294-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494849741-21294-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod Kumar <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <sandeep.tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sandeep Tripathy <sandeep.tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

This patch describes Stingray SOC clock tree using
DT nodes in Stingray DTS.

Signed-off-by: Sandeep Tripathy <sandeep.tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../boot/dts/broadcom/stingray/stingray-clock.dtsi | 170 +++++++++++++++++++++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |   9 ++
 2 files changed, 179 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-clock.dtsi

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-clock.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-clock.dtsi
new file mode 100644
index 0000000..070e22e2
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray-clock.dtsi
@@ -0,0 +1,170 @@
+/*
+ *  BSD LICENSE
+ *
+ *  Copyright(c) 2016-2017 Broadcom.  All rights reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions
+ *  are met:
+ *
+ *    * Redistributions of source code must retain the above copyright
+ *      notice, this list of conditions and the following disclaimer.
+ *    * Redistributions in binary form must reproduce the above copyright
+ *      notice, this list of conditions and the following disclaimer in
+ *      the documentation and/or other materials provided with the
+ *      distribution.
+ *    * Neither the name of Broadcom nor the names of its
+ *      contributors may be used to endorse or promote products derived
+ *      from this software without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <dt-bindings/clock/bcm-sr.h>
+
+		osc: oscillator {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <50000000>;
+		};
+
+		crmu_ref25m: crmu_ref25m {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&osc>;
+			clock-div = <2>;
+			clock-mult = <1>;
+		};
+
+		genpll0: genpll0@6641d104 {
+			#clock-cells = <1>;
+			compatible = "brcm,sr-genpll0";
+			reg = <0x0001d104 0x32>,
+			      <0x0001c854 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "genpll0", "clk_125", "clk_scr",
+					     "clk_250", "clk_pcie_axi",
+					     "clk_paxc_axi_x2",
+					     "clk_paxc_axi";
+		};
+
+		genpll3: genpll3@6641d1e0 {
+			#clock-cells = <1>;
+			compatible = "brcm,sr-genpll3";
+			reg = <0x0001d1e0 0x32>,
+			      <0x0001c854 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "genpll3", "clk_hsls",
+					     "clk_sdio";
+		};
+
+		genpll4: genpll4@6641d214 {
+			#clock-cells = <1>;
+			compatible = "brcm,sr-genpll4";
+			reg = <0x0001d214 0x32>,
+			      <0x0001c854 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "genpll4", "clk_ccn",
+					     "clk_tpiu_pll", "noc_clk",
+					     "pll_chclk_fs4",
+					     "clk_bridge_fscpu";
+		};
+
+		genpll5: genpll5@6641d248 {
+			#clock-cells = <1>;
+			compatible = "brcm,sr-genpll5";
+			reg = <0x0001d248 0x32>,
+			      <0x0001c870 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "genpll5", "fs4_hf_clk",
+					     "crypto_ae_clk", "raid_ae_clk";
+		};
+
+		lcpll0: lcpll0 {
+			#clock-cells = <1>;
+			compatible = "brcm,sr-lcpll0";
+			reg = <0x0001d0c4 0x3c>,
+			      <0x0001c870 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "lcpll0", "clk_sata_refp",
+					     "clk_sata_refn", "clk_sata_350",
+					     "clk_sata_500";
+		};
+
+		lcpll1: lcpll1 {
+			#clock-cells = <1>;
+			compatible = "brcm,sr-lcpll1";
+			reg = <0x0001d138 0x3c>,
+			      <0x0001c870 0x4>;
+			clocks = <&osc>;
+			clock-output-names = "lcpll1", "clk_wanpn",
+					     "clk_usb_ref",
+					     "timesync_evt_clk";
+		};
+
+		hsls_clk: hsls_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&genpll3 1>;
+			clock-div = <1>;
+			clock-mult = <1>;
+		};
+
+		hsls_div2_clk: hsls_div2_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&genpll3 BCM_SR_GENPLL3_HSLS_CLK>;
+			clock-div = <2>;
+			clock-mult = <1>;
+
+		};
+
+		hsls_div4_clk: hsls_div4_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&genpll3 BCM_SR_GENPLL3_HSLS_CLK>;
+			clock-div = <4>;
+			clock-mult = <1>;
+		};
+
+		hsls_25m_clk: hsls_25m_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&crmu_ref25m>;
+			clock-div = <1>;
+			clock-mult = <1>;
+		};
+
+		hsls_25m_div2_clk: hsls_25m_div2_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&hsls_25m_clk>;
+			clock-div = <2>;
+			clock-mult = <1>;
+		};
+
+		sdio0_clk: sdio0_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&genpll3 BCM_SR_GENPLL3_SDIO_CLK>;
+			clock-div = <1>;
+			clock-mult = <1>;
+		};
+
+		sdio1_clk: sdio1_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&genpll3 BCM_SR_GENPLL3_SDIO_CLK>;
+			clock-div = <1>;
+			clock-mult = <1>;
+		};
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index c82e1d8..24856e3 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -249,6 +249,15 @@
 		};
 	};
 
+	crmu: crmu {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x66400000 0x100000>;
+
+		#include "stingray-clock.dtsi"
+	};
+
 	hsls {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
