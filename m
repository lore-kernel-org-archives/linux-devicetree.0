From: Chenhui Zhao <chenhui.zhao@nxp.com>
Subject: [PATCH 1/2] ARM: dts: ls1043a: add a rcpm node
Date: Mon, 1 Aug 2016 17:49:02 +0800
Message-ID: <1470044943-3814-1-git-send-email-chenhui.zhao@nxp.com>
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
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: z.chenhui@gmail.com, Chenhui Zhao <chenhui.zhao@nxp.com>, jason.jin@nxp.com
List-Id: devicetree@vger.kernel.org

LS1043A have a RCPM module (Run Control and Power Management), which
performs all device-level tasks associated with power management.

Signed-off-by: Chenhui Zhao <chenhui.zhao@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index de0323b..43944b7 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -196,6 +196,12 @@
 			bus-width = <4>;
 		};
 
+		rcpm: rcpm@1ee2000 {
+			compatible = "fsl,ls1043a-rcpm", "fsl,qoriq-rcpm-2.1";
+			reg = <0x0 0x1ee2000 0x0 0x1000>;
+			fsl,#rcpm-wakeup-cells = <1>;
+		};
+
 		dspi0: dspi@2100000 {
 			compatible = "fsl,ls1043a-dspi", "fsl,ls1021a-v1.0-dspi";
 			#address-cells = <1>;
-- 
1.9.1
