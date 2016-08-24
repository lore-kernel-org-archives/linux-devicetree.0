From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/4] arm64: dts: qcom: msm8916: Add Hexagon SMD edge
Date: Tue, 23 Aug 2016 18:33:11 -0700
Message-ID: <1472002393-1875-2-git-send-email-bjorn.andersson@linaro.org>
References: <1472002393-1875-1-git-send-email-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1472002393-1875-1-git-send-email-bjorn.andersson@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the Hexagon SMD edge, so that QRTR is probed when the Hexagon is
booted.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 4a268e714db5..3f3ef20865cd 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -692,6 +692,14 @@
 			};
 		};
 
+		hexagon {
+			interrupts = <0 25 IRQ_TYPE_EDGE_RISING>;
+
+			qcom,smd-edge = <0>;
+			qcom,ipc = <&apcs 8 12>;
+			qcom,remote-pid = <1>;
+		};
+
 		pronto {
 			interrupts = <0 142 1>;
 
-- 
2.5.0
