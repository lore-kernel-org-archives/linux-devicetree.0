From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v6 7/8] arm64: dts: hi6220: register debug module
Date: Thu,  6 Apr 2017 21:31:00 +0800
Message-ID: <1491485461-22800-8-git-send-email-leo.yan@linaro.org>
References: <1491485461-22800-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1491485461-22800-1-git-send-email-leo.yan@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Mike Leach <mike.leach@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

Bind debug module driver for Hi6220.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 64 +++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 470461d..467aa15 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -913,5 +913,69 @@
 				};
 			};
 		};
+
+		debug@f6590000 {
+			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			reg = <0 0xf6590000 0 0x1000>;
+			clocks = <&sys_ctrl HI6220_DAPB_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu0>;
+		};
+
+		debug@f6592000 {
+			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			reg = <0 0xf6592000 0 0x1000>;
+			clocks = <&sys_ctrl HI6220_DAPB_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu1>;
+		};
+
+		debug@f6594000 {
+			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			reg = <0 0xf6594000 0 0x1000>;
+			clocks = <&sys_ctrl HI6220_DAPB_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu2>;
+		};
+
+		debug@f6596000 {
+			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			reg = <0 0xf6596000 0 0x1000>;
+			clocks = <&sys_ctrl HI6220_DAPB_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu3>;
+		};
+
+		debug@f65d0000 {
+			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			reg = <0 0xf65d0000 0 0x1000>;
+			clocks = <&sys_ctrl HI6220_DAPB_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu4>;
+		};
+
+		debug@f65d2000 {
+			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			reg = <0 0xf65d2000 0 0x1000>;
+			clocks = <&sys_ctrl HI6220_DAPB_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu5>;
+		};
+
+		debug@f65d4000 {
+			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			reg = <0 0xf65d4000 0 0x1000>;
+			clocks = <&sys_ctrl HI6220_DAPB_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu6>;
+		};
+
+		debug@f65d6000 {
+			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			reg = <0 0xf65d6000 0 0x1000>;
+			clocks = <&sys_ctrl HI6220_DAPB_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&cpu7>;
+		};
 	};
 };
-- 
2.7.4

