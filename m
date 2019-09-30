From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 1/2] arm64: dts: juno: add GPU subsystem
Date: Mon, 30 Sep 2019 16:24:58 +0100
Message-ID: <88dc6386929b3dcd7a65ba8063628c62b66b330c.1569856049.git.robin.murphy@arm.com>
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
To: robh@kernel.org, tomeu.vizoso@collabora.com, sudeep.holla@arm.com
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org, steven.price@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Since we now have bindings for Mali Midgard GPUs, let's use them to
describe Juno's GPU subsystem, if only because we can. Juno sports a
Mali-T624 integrated behind an MMU-400 (as a gesture towards
virtualisation), in their own dedicated power domain with DVFS
controlled by the SCP.

CC: Liviu Dudau <liviu.dudau@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 .../bindings/gpu/arm,mali-midgard.yaml        |  5 +++-
 arch/arm64/boot/dts/arm/juno-base.dtsi        | 27 +++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index 47bc1ac36426..018f3ae4b43c 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -22,6 +22,10 @@ properties:
           - enum:
              - amlogic,meson-gxm-mali
           - const: arm,mali-t820
+      - items:
+          - enum:
+             - arm,juno-mali
+          - const: arm,mali-t624
       - items:
           - enum:
              - rockchip,rk3288-mali
@@ -39,7 +43,6 @@ properties:
              - samsung,exynos5433-mali
           - const: arm,mali-t760
 
-          # "arm,mali-t624"
           # "arm,mali-t628"
           # "arm,mali-t830"
           # "arm,mali-t880"
diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 26a039a028b8..9e3e8ce6adfe 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -35,6 +35,18 @@
 		clock-names = "apb_pclk";
 	};
 
+	smmu_gpu: iommu@2b400000 {
+		compatible = "arm,mmu-400", "arm,smmu-v1";
+		reg = <0x0 0x2b400000 0x0 0x10000>;
+		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		#global-interrupts = <1>;
+		power-domains = <&scpi_devpd 1>;
+		dma-coherent;
+		status = "disabled";
+	};
+
 	smmu_pcie: iommu@2b500000 {
 		compatible = "arm,mmu-401", "arm,smmu-v1";
 		reg = <0x0 0x2b500000 0x0 0x10000>;
@@ -487,6 +499,21 @@
 		};
 	};
 
+	gpu: gpu@2d000000 {
+		compatible = "arm,juno-mali", "arm,mali-t624";
+		reg = <0 0x2d000000 0 0x10000>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "gpu", "job", "mmu";
+		clocks = <&scpi_dvfs 2>;
+		power-domains = <&scpi_devpd 1>;
+		dma-coherent;
+		/* The SMMU is only really of interest to bare-metal hypervisors */
+		/* iommus = <&smmu_gpu 0>; */
+		status = "disabled";
+	};
+
 	sram: sram@2e000000 {
 		compatible = "arm,juno-sram-ns", "mmio-sram";
 		reg = <0x0 0x2e000000 0x0 0x8000>;
-- 
2.21.0.dirty
