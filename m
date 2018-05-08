From: Rob Herring <robh@kernel.org>
Subject: [PATCH] arm64: dts: msm8916: fix Coresight ETF graph connections
Date: Tue,  8 May 2018 10:09:51 -0500
Message-ID: <20180508150952.24562-3-robh@kernel.org>
References: <20180508150952.24562-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180508150952.24562-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, "Ivan T . Ivanov" <ivan.ivanov@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The ETF input should be connected to the funnel output, and the ETF
output should be connected to the replicator input. The labels are wrong
and these got swapped:

Warning (graph_endpoint): /soc/funnel@821000/ports/port@8/endpoint: graph connection to node '/soc/etf@825000/ports/port@1/endpoint' is not bidirectional
Warning (graph_endpoint): /soc/replicator@824000/ports/port@2/endpoint: graph connection to node '/soc/etf@825000/ports/port@0/endpoint' is not bidirectional

Fixes: 7c10da373698 ("arm64: dts: qcom: Add msm8916 CoreSight components")
Cc: Ivan T. Ivanov <ivan.ivanov@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 66b318e1de80..aef814b2dc9e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1191,14 +1191,14 @@
 
 				port@0 {
 					reg = <0>;
-					etf_out: endpoint {
+					etf_in: endpoint {
 						slave-mode;
 						remote-endpoint = <&funnel0_out>;
 					};
 				};
 				port@1 {
 					reg = <0>;
-					etf_in: endpoint {
+					etf_out: endpoint {
 						remote-endpoint = <&replicator_in>;
 					};
 				};
-- 
2.17.0
