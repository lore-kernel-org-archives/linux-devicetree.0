From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH RFC 3/3] arm64: dts: register Hi6220's coresight debug module
Date: Mon, 13 Feb 2017 14:11:38 +0800
Message-ID: <1486966298-16767-4-git-send-email-leo.yan@linaro.org>
References: <1486966298-16767-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486966298-16767-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

Bind coresight debug driver for Hi6220.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../boot/dts/hisilicon/hikey_6220_coresight.dtsi   | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hikey_6220_coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hikey_6220_coresight.dtsi
index 77c2aab..e14d75c 100644
--- a/arch/arm64/boot/dts/hisilicon/hikey_6220_coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hikey_6220_coresight.dtsi
@@ -15,6 +15,79 @@
 		#size-cells = <2>;
 		compatible = "arm,amba-bus";
 		ranges;
+
+		debug@0,f6590000 {
+			compatible = "arm,coresight-debug","arm,primecell";
+			reg = <0 0xf6590000 0 0x1000>;
+			default_enable;
+			clocks = <&sys_ctrl HI6220_CS_ATB>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu0>;
+		};
+
+		debug@1,f6592000 {
+			compatible = "arm,coresight-debug","arm,primecell";
+			reg = <0 0xf6592000 0 0x1000>;
+			default_enable;
+			clocks = <&sys_ctrl HI6220_CS_ATB>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu1>;
+		};
+
+		debug@2,f6594000 {
+			compatible = "arm,coresight-debug","arm,primecell";
+			reg = <0 0xf6594000 0 0x1000>;
+			default_enable;
+			clocks = <&sys_ctrl HI6220_CS_ATB>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu2>;
+		};
+
+		debug@3,f6596000 {
+			compatible = "arm,coresight-debug","arm,primecell";
+			reg = <0 0xf6596000 0 0x1000>;
+			default_enable;
+			clocks = <&sys_ctrl HI6220_CS_ATB>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu3>;
+		};
+
+		debug@4,f65d0000 {
+			compatible = "arm,coresight-debug","arm,primecell";
+			reg = <0 0xf65d0000 0 0x1000>;
+			default_enable;
+			clocks = <&sys_ctrl HI6220_CS_ATB>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu4>;
+		};
+
+		debug@5,f65d2000 {
+			compatible = "arm,coresight-debug","arm,primecell";
+			reg = <0 0xf65d2000 0 0x1000>;
+			default_enable;
+			clocks = <&sys_ctrl HI6220_CS_ATB>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu5>;
+		};
+
+		debug@6,f65d4000 {
+			compatible = "arm,coresight-debug","arm,primecell";
+			reg = <0 0xf65d4000 0 0x1000>;
+			default_enable;
+			clocks = <&sys_ctrl HI6220_CS_ATB>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu6>;
+		};
+
+		debug@7,f65d6000 {
+			compatible = "arm,coresight-debug","arm,primecell";
+			reg = <0 0xf65d6000 0 0x1000>;
+			default_enable;
+			clocks = <&sys_ctrl HI6220_CS_ATB>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu7>;
+		};
+
 		etm@0,f659c000 {
 			compatible = "arm,coresight-etm4x","arm,primecell";
 			reg = <0 0xf659c000 0 0x1000>;
-- 
2.7.4
