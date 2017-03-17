From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 6/7] arm64: dts: hi6220: register debug module
Date: Fri, 17 Mar 2017 23:02:22 +0800
Message-ID: <1489762943-25849-7-git-send-email-leo.yan@linaro.org>
References: <1489762943-25849-1-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1489762943-25849-1-git-send-email-leo.yan@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, mike.leach@linaro.org, Suzuki.Poulose@arm.com, sudeep.holla@arm.com
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
