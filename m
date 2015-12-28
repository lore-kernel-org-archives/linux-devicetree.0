From: bjorn@kryo.se
Subject: [PATCH] ARM: dts: qcom: msm8974: Add smsm node
Date: Sun, 27 Dec 2015 17:47:08 -0800
Message-ID: <1451267228-15810-1-git-send-email-bjorn@kryo.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <andy.gross@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 3f6b8f2022c4..18c419ee9d48 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -160,6 +160,47 @@
 		hwlocks = <&tcsr_mutex 3>;
 	};
 
+	smsm {
+		compatible = "qcom,smsm";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		qcom,ipc-1 = <&apcs 8 13>;
+		qcom,ipc-2 = <&apcs 8 9>;
+		qcom,ipc-3 = <&apcs 8 19>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+
+			#qcom,state-cells = <1>;
+		};
+
+		modem_smsm: modem@1 {
+			reg = <1>;
+			interrupts = <0 26 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		adsp_smsm: adsp@2 {
+			reg = <2>;
+			interrupts = <0 157 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		wcnss_smsm: wcnss@7 {
+			reg = <7>;
+			interrupts = <0 144 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.5.0
