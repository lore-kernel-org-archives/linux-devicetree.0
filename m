From: Jacob Chen <jacob-chen@iotwrt.com>
Subject: [PATCH v6 12/17] ARM: dts: rockchip: add isp node for rk3288
Date: Thu,  8 Mar 2018 17:48:02 +0800
Message-ID: <20180308094807.9443-13-jacob-chen@iotwrt.com>
References: <20180308094807.9443-1-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180308094807.9443-1-jacob-chen@iotwrt.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, eddie.cai.linux@gmail.com, heiko@sntech.de, Jacob Chen <jacob2.chen@rock-chips.com>, jeffy.chen@rock-chips.com, zyc@rock-chips.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, mchehab@kernel.org, zhengsq@rock-chips.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jacob Chen <jacob2.chen@rock-chips.com>

rk3288 have a Embedded 13M ISP

Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
---
 arch/arm/boot/dts/rk3288.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index ad6bda85c85a..6c122aaf06a7 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -962,6 +962,23 @@
 		status = "disabled";
 	};
 
+	isp: isp@ff910000 {
+		compatible = "rockchip,rk3288-cif-isp";
+		reg = <0x0 0xff910000 0x0 0x4000>;
+		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_ISP>, <&cru ACLK_ISP>,
+			 <&cru HCLK_ISP>, <&cru PCLK_ISP_IN>,
+			 <&cru SCLK_ISP_JPE>;
+		clock-names = "clk_isp", "aclk_isp",
+			      "hclk_isp", "pclk_isp_in",
+			      "sclk_isp_jpe";
+		assigned-clocks = <&cru SCLK_ISP>, <&cru SCLK_ISP_JPE>;
+		assigned-clock-rates = <400000000>, <400000000>;
+		power-domains = <&power RK3288_PD_VIO>;
+		iommus = <&isp_mmu>;
+		status = "disabled";
+	};
+
 	isp_mmu: iommu@ff914000 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff914000 0x0 0x100>, <0x0 0xff915000 0x0 0x100>;
-- 
2.16.1
