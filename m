From: Niklas Cassel <niklas.cassel@axis.com>
Subject: [PATCH v2 8/8] ARM: dts: artpec: add node for hardware crypto
 accelerator
Date: Wed, 21 Feb 2018 10:00:00 +0100
Message-ID: <20180221090000.18091-9-niklas.cassel@axis.com>
References: <20180221090000.18091-1-niklas.cassel@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180221090000.18091-1-niklas.cassel@axis.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-kernel@axis.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add node for the hardware crypto acceleration used in the artpec6 SoC.

Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>
---
 arch/arm/boot/dts/artpec6.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6.dtsi
index b7720be8afb1..3e4115c2cd75 100644
--- a/arch/arm/boot/dts/artpec6.dtsi
+++ b/arch/arm/boot/dts/artpec6.dtsi
@@ -232,6 +232,12 @@
 		ranges;
 		dma-ranges;
 
+		crypto@f4264000 {
+			compatible = "axis,artpec6-crypto";
+			reg = <0xf4264000 0x4000>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		dma0: dma@f8019000 {
 			compatible = "renesas,nbpfaxi64dmac8b16";
 			reg = <0xf8019000 0x400>;
-- 
2.14.2
