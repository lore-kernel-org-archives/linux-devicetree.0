From: Olivier Moysan <olivier.moysan@st.com>
Subject: [Linux-stm32][PATCH 3/4] ARM: dts: stm32: add i2s support on
 stm32mp157c
Date: Thu, 25 Apr 2019 16:10:39 +0200
Message-ID: <1556201440-5540-4-git-send-email-olivier.moysan@st.com>
References: <1556201440-5540-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1556201440-5540-1-git-send-email-olivier.moysan@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, olivier.moysan@st.com
List-Id: devicetree@vger.kernel.org

This patch adds support of STM32 I2S on stm32mp157c.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 9ae40240f635..ec2d6475caa2 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -365,6 +365,17 @@
 			status = "disabled";
 		};
 
+		i2s2: audio-controller@4000b000 {
+			compatible = "st,stm32h7-i2s";
+			#sound-dai-cells = <0>;
+			reg = <0x4000b000 0x400>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 39 0x400 0x01>,
+			       <&dmamux1 40 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		spi3: spi@4000c000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -379,6 +390,17 @@
 			status = "disabled";
 		};
 
+		i2s3: audio-controller@4000c000 {
+			compatible = "st,stm32h7-i2s";
+			#sound-dai-cells = <0>;
+			reg = <0x4000c000 0x400>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 61 0x400 0x01>,
+			       <&dmamux1 62 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		spdifrx: audio-controller@4000d000 {
 			compatible = "st,stm32h7-spdifrx";
 			#sound-dai-cells = <0>;
@@ -607,6 +629,17 @@
 			status = "disabled";
 		};
 
+		i2s1: audio-controller@44004000 {
+			compatible = "st,stm32h7-i2s";
+			#sound-dai-cells = <0>;
+			reg = <0x44004000 0x400>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 37 0x400 0x01>,
+			       <&dmamux1 38 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		spi4: spi@44005000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.7.4
