From: Rob Herring <robh@kernel.org>
Subject: [PATCH] arm64: dts: sprd: fix typo in 'remote-endpoint'
Date: Tue,  8 May 2018 10:09:52 -0500
Message-ID: <20180508150952.24562-4-robh@kernel.org>
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
Cc: Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Baolin Wang <baolin.wang@linaro.org>
List-Id: devicetree@vger.kernel.org

dtc now warns on incomplete OF graph endpoint connections:

arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: Warning (graph_endpoint): /soc/stm@10006000/port/endpoint: graph connection to node '/soc/funnel@10001000/ports/port@2/endpoint' is not bidirectional

The cause is a typo in 'remote-endpoint'.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/boot/dts/sprd/sc9860.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/sprd/sc9860.dtsi b/arch/arm64/boot/dts/sprd/sc9860.dtsi
index 5dbfb796d9f9..dcd03ffcda03 100644
--- a/arch/arm64/boot/dts/sprd/sc9860.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc9860.dtsi
@@ -326,7 +326,7 @@
 					reg = <4>;
 					soc_funnel_in_port1: endpoint {
 						slave-mode;
-						remote-endpioint =
+						remote-endpoint =
 							<&stm_out_port>;
 					};
 				};
-- 
2.17.0
