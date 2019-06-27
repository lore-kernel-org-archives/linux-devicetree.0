From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH] ARM: dts: stm32: activate dma for qspi on stm32mp157
Date: Thu, 27 Jun 2019 14:09:05 +0200
Message-ID: <1561637345-31441-1-git-send-email-ludovic.Barre@st.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch activates dma for qspi on stm32mp157.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 2afeee6..205ea1d 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -1074,6 +1074,9 @@
 			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
 			reg-names = "qspi", "qspi_mm";
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&mdma1 22 0x10 0x100002 0x0 0x0>,
+			       <&mdma1 22 0x10 0x100008 0x0 0x0>;
+			dma-names = "tx", "rx";
 			clocks = <&rcc QSPI_K>;
 			resets = <&rcc QSPI_R>;
 			status = "disabled";
-- 
2.7.4
