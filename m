From: Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH 2/4] ARM: dts: stm32: add DCMI camera interface support on
 stm32mp157c
Date: Thu, 28 Feb 2019 15:25:43 +0100
Message-ID: <1551363945-19497-3-git-send-email-hugues.fruchet@st.com>
References: <1551363945-19497-1-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1551363945-19497-1-git-send-email-hugues.fruchet@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Add DCMI camera interface support on stm32mp157c.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 10bf338..1ff331c 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -886,6 +886,18 @@
 			status = "disabled";
 		};
 
+		dcmi: dcmi@4c006000 {
+			compatible = "st,stm32-dcmi";
+			reg = <0x4c006000 0x400>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc CAMITF_R>;
+			clocks = <&rcc DCMI>;
+			clock-names = "mclk";
+			dmas = <&dmamux1 75 0x400 0x0d>;
+			dma-names = "tx";
+			status = "disabled";
+		};
+
 		rcc: rcc@50000000 {
 			compatible = "st,stm32mp1-rcc", "syscon";
 			reg = <0x50000000 0x1000>;
-- 
2.7.4
