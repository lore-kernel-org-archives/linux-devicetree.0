From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH 4/5] arm64: Juno: Add GICv2m support in device tree.
Date: Wed, 13 May 2015 18:11:31 +0100
Message-ID: <1431537092-19597-5-git-send-email-Liviu.Dudau@arm.com>
References: <1431537092-19597-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431537092-19597-1-git-send-email-Liviu.Dudau@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, devicetree <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Juno contains a GICv2m extension for handling PCIe MSI messages.
Add a node declaring the first frame of the extension.

Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 35 ++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 78f8a07..e6a4e99 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -23,10 +23,17 @@
 		      <0x0 0x2c02f000 0 0x2000>,
 		      <0x0 0x2c04f000 0 0x2000>,
 		      <0x0 0x2c06f000 0 0x2000>;
-		#address-cells = <0>;
+		#address-cells = <2>;
 		#interrupt-cells = <3>;
+		#size-cells = <2>;
 		interrupt-controller;
 		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
+		ranges = <0 0 0 0x2c1c0000 0 0x40000>;
+		v2m_0: v2m@0 {
+			compatible = "arm,gic-v2m-frame";
+			msi-controller;
+			reg = <0 0 0 0x1000>;
+		};
 	};
 
 	timer {
@@ -122,19 +129,19 @@
 
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 15>;
-		interrupt-map = <0 0  0 &gic 0  68 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  1 &gic 0  69 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  2 &gic 0  70 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  3 &gic 0 160 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  4 &gic 0 161 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  5 &gic 0 162 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  6 &gic 0 163 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  7 &gic 0 164 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  8 &gic 0 165 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  9 &gic 0 166 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 10 &gic 0 167 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 11 &gic 0 168 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 12 &gic 0 169 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-map = <0 0  0 &gic 0 0 0  68 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  1 &gic 0 0 0  69 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  2 &gic 0 0 0  70 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  3 &gic 0 0 0 160 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  4 &gic 0 0 0 161 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  5 &gic 0 0 0 162 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  6 &gic 0 0 0 163 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  7 &gic 0 0 0 164 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  8 &gic 0 0 0 165 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  9 &gic 0 0 0 166 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 10 &gic 0 0 0 167 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 11 &gic 0 0 0 168 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 12 &gic 0 0 0 169 IRQ_TYPE_LEVEL_HIGH>;
 
 		/include/ "juno-motherboard.dtsi"
 	};
-- 
2.3.6
