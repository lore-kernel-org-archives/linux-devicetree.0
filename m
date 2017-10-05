From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 5/5] arm64: dts: msm8916: Mark rmtfs node as qcom,rmtfs-mem compatible
Date: Wed,  4 Oct 2017 20:32:58 -0700
Message-ID: <20171005033258.12825-6-bjorn.andersson@linaro.org>
References: <20171005033258.12825-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005033258.12825-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, David Brown <david.brown@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Kees Cook <keescook@chromium.org>, Rob Herring <robh+dt@kernel.org>, Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we have a binding defined for the shared file system memory use
this to describe the rmtfs memory region.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

Changes since v1:
- New patch

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 039991f80831..f6ae6f9b27e1 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -69,8 +69,11 @@
 		};
 
 		rmtfs@86700000 {
+			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0x86700000 0x0 0xe0000>;
 			no-map;
+
+			qcom,client-id = <1>;
 		};
 
 		rfsa@867e00000 {
-- 
2.12.0
