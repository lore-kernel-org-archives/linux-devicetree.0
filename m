From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH] ARM: DT: stm32: move dma translation to board files
Date: Tue, 25 Oct 2016 18:16:35 +0200
Message-ID: <1477412195-8124-1-git-send-email-alexandre.torgue@st.com>
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
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, peter.griffin@linaro.org, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

stm32f469-disco and stm32f429-eval boards use SDRAM start address remapping
(to @0) to boost performances. A DMA translation through "dma-ranges"
property was needed for other masters than the M4 CPU.
stm32f429-disco doesn't use remapping so doesn't need this DMA translation.
This patches moves this DMA translation definition from stm32f429 soc file
to board files.

Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index 13c7cd2..a763c15 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -82,6 +82,10 @@
 		};
 	};
 
+	soc {
+		dma-ranges = <0xc0000000 0x0 0x10000000>;
+	};
+
 	usbotg_hs_phy: usbphy {
 		#phy-cells = <0>;
 		compatible = "usb-nop-xceiv";
diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 0596d60..3a1cfdd 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -59,8 +59,6 @@
 	};
 
 	soc {
-		dma-ranges = <0xc0000000 0x0 0x10000000>;
-
 		timer2: timer@40000000 {
 			compatible = "st,stm32-timer";
 			reg = <0x40000000 0x400>;
diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 9e73656..c2213c0 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -64,6 +64,10 @@
 	aliases {
 		serial0 = &usart3;
 	};
+
+	soc {
+		dma-ranges = <0xc0000000 0x0 0x10000000>;
+	};
 };
 
 &clk_hse {
-- 
1.9.1
