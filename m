From: Chen Feng <puck.chen@hisilicon.com>
Subject: [PATCH V2 3/3] Add dts node for smmu on hi6220 SoC
Date: Tue, 20 Oct 2015 16:45:24 +0800
Message-ID: <1445330724-129401-3-git-send-email-puck.chen@hisilicon.com>
References: <1445330724-129401-1-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1445330724-129401-1-git-send-email-puck.chen@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: puck.chen@hisilicon.com, yudongbin@hisilicon.com, saberlily.xia@hisilicon.com, suzhuangluan@hisilicon.com, kong.kongxinwei@hisilicon.com, xuyiping@hisilicon.com, z.liuxinliang@hisilicon.com, puck.chen@aliyun.com, weidong2@hisilicon.com, w.f@huawei.com, joro@8bytes.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, xuwei5@hisilicon.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: dan.zhao@hisilicon.com, peter.panshilin@hisilicon.com, qijiwen@hisilicon.com, linuxarm@huawei.com
List-Id: devicetree@vger.kernel.org

arm64: dts: Add dts node for hi6220 smmu driver

Signed-off-by: Chen Feng <puck.chen@hisilicon.com>
Signed-off-by: Yu Dongbin <yudongbin@hisilicon.com>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 3f03380..3ef33b4 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/hi6220-clock.h>
 
 / {
 	compatible = "hisilicon,hi6220";
@@ -167,5 +168,19 @@
 			clocks = <&ao_ctrl 36>, <&ao_ctrl 36>;
 			clock-names = "uartclk", "apb_pclk";
 		};
+
+		smmu@f4210000 {
+			compatible = "hisilicon,hi6220-smmu";
+			reg = <0x0 0xf4210000 0x0 0x1000>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sys_ctrl HI6220_MMU_CLK>,
+				 <&media_ctrl HI6220_MED_MMU>,
+				 <&sys_ctrl HI6220_MEDIA_PLL_SRC>;
+			clock-names = "smmu_clk",
+				      "media_sc_clk",
+				      "smmu_peri_clk";
+			#iommu-cells = <1>;
+		};
+
 	};
 };
-- 
1.9.1
