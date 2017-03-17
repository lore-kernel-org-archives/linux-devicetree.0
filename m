From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 7/7] arm64: dts: qcom: msm8916: Add debug unit
Date: Fri, 17 Mar 2017 23:02:23 +0800
Message-ID: <1489762943-25849-8-git-send-email-leo.yan@linaro.org>
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

Add debug unit on Qualcomm msm8916 based platforms, including the
DragonBoard 410c board.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 68a8e67..3af814b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1104,6 +1104,38 @@
 			};
 		};
 
+		debug@850000 {
+			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			reg = <0x850000 0x1000>;
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&CPU0>;
+		};
+
+		debug@852000 {
+			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			reg = <0x852000 0x1000>;
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&CPU1>;
+		};
+
+		debug@854000 {
+			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			reg = <0x854000 0x1000>;
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&CPU2>;
+		};
+
+		debug@856000 {
+			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			reg = <0x856000 0x1000>;
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+			cpu = <&CPU3>;
+		};
+
 		etm@85c000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85c000 0x1000>;
-- 
2.7.4
