From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 1/2] ARM: dts: msm8974: Hook up adsp-pil's xo clock
Date: Wed, 15 Feb 2017 05:51:56 +0100
Message-ID: <20170215045157.11659-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: devicetree@vger.kernel.org

Without this patch (and with CONFIG_QCOM_ADSP_PIL), I get this error:

	[    0.711529] qcom_adsp_pil adsp-pil: failed to get xo clock
	[    0.711540] remoteproc remoteproc0: releasing adsp-pil

With this patch, adsp-pil can initialize correctly.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

---
NOTE: I don't know if I actually chose the right clock source.
      Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
      suggests that adsp-pil's xo should be controlled by the RPM
      processor; Existing devicetrees and a recent patch to msm8996.dtsi
      use &xo_board, though:
      https://www.spinics.net/lists/linux-arm-msm/msg25711.html
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
