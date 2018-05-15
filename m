From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sdm845: Sort nodes in the reserved mem by address
Date: Mon, 14 May 2018 21:37:13 -0700
Message-ID: <20180515043714.39011-1-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Let's keep the reserved-memory node tidy and neat and keep it sorted
by address.  This should have no functional change.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 7c85e7c596db..63026133feab 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -31,6 +31,12 @@
 			no-map;
 		};
 
+		reserved-memory@85fe0000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x0 0x85fe0000 0x0 0x20000>;
+			no-map;
+		};
+
 		smem_mem: memory@86000000 {
 			reg = <0x0 0x86000000 0x0 0x200000>;
 			no-map;
@@ -40,12 +46,6 @@
 			reg = <0 0x86200000 0 0x2d00000>;
 			no-map;
 		};
-
-		memory@85fe0000 {
-			compatible = "qcom,cmd-db";
-			reg = <0x0 0x85fe0000 0x0 0x20000>;
-			no-map;
-		};
 	};
 
 	cpus {
-- 
2.17.0.441.gb46fe60e1d-goog
