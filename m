From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH 3/3] ARM: dts: artpec: set irq affinity on pmu interrupts
Date: Tue, 23 Aug 2016 16:00:52 +0200
Message-ID: <48257590bc198f5b469d041a41c334ef2eb873cc.1471959733.git.larper@axis.com>
References: <cover.1471959733.git.larper@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1471959733.git.larper@axis.com>
In-Reply-To: <cover.1471959733.git.larper@axis.com>
References: <cover.1471959733.git.larper@axis.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>
List-Id: devicetree@vger.kernel.org

The irq affinity is required for pmu interrupts.

Signed-off-by: Lars Persson <larper@axis.com>
---
 arch/arm/boot/dts/artpec6.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6.dtsi
index 4e40d55..3489019c 100644
--- a/arch/arm/boot/dts/artpec6.dtsi
+++ b/arch/arm/boot/dts/artpec6.dtsi
@@ -150,6 +150,7 @@
 		compatible = "arm,cortex-a9-pmu";
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 			<GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
 		interrupt-parent = <&intc>;
 	};
 
-- 
2.1.4
