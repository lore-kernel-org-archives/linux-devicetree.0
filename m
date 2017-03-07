From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v2 1/2] ARM: dts: msm8974: Hook up adsp-pil's xo clock
Date: Tue,  7 Mar 2017 03:22:00 +0100
Message-ID: <20170307022201.24563-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: devicetree@vger.kernel.org

Without this patch (and with CONFIG_QCOM_ADSP_PIL), I get this error:

	[    0.711529] qcom_adsp_pil adsp-pil: failed to get xo clock
	[    0.711540] remoteproc remoteproc0: releasing adsp-pil

With this patch, adsp-pil can initialize correctly.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

---
v2:
* Add Bjorn Andersson's R-b
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index d3e1a61b8671..cccd8cba8872 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -250,6 +250,9 @@
 
 		cx-supply = <&pm8841_s2>;
 
+		clocks = <&xo_board>;
+		clock-names = "xo";
+
 		memory-region = <&adsp_region>;
 
 		qcom,smem-states = <&adsp_smp2p_out 0>;
-- 
2.11.0
