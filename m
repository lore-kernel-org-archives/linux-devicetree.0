From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH v2 1/4] ARM: dts: stm32: add DMA memory pool on MCU which
 embed a cortex-M7
Date: Wed, 28 Feb 2018 14:10:55 +0100
Message-ID: <1519823458-27734-2-git-send-email-alexandre.torgue@st.com>
References: <1519823458-27734-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519823458-27734-1-git-send-email-alexandre.torgue@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, patrice.chotard@st.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, vladimir.murzin@arm.com, Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On cortex-M7 MCU, DMA have to use a non cache-able memory area. For this
reason a dedicated memory pool is created for DMA.
This patch creates a DMA memory pool of 1MB of each STM32 MCU which
embeds a cortex-M7 except stm32f746-disco. Indeed, as stm32f746-disco has
only a 8MB SDRAM and it's tricky to reduce memory used by Kernel.

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32746g-eval.dts b/arch/arm/boot/dts/stm32746g-eval.dts
index e3f5a83..92651c3 100644
--- a/arch/arm/boot/dts/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/stm32746g-eval.dts
@@ -58,6 +58,19 @@
 		reg = <0xc0000000 0x2000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,dma {
+			compatible = "shared-dma-pool";
+			linux,dma-default;
+			no-map;
+			reg = <0xc1f00000 0x100000>;
+		};
+	};
+
 	aliases {
 		serial0 = &usart1;
 	};
diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
index d712260..c526853 100644
--- a/arch/arm/boot/dts/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/stm32f769-disco.dts
@@ -59,6 +59,19 @@
 		reg = <0xC0000000 0x1000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,dma {
+			compatible = "shared-dma-pool";
+			linux,dma-default;
+			no-map;
+			reg = <0xc0f00000 0x100000>;
+		};
+	};
+
 	aliases {
 		serial0 = &usart1;
 	};
diff --git a/arch/arm/boot/dts/stm32h743i-disco.dts b/arch/arm/boot/dts/stm32h743i-disco.dts
index 45e088c..3689e70 100644
--- a/arch/arm/boot/dts/stm32h743i-disco.dts
+++ b/arch/arm/boot/dts/stm32h743i-disco.dts
@@ -57,6 +57,19 @@
 		reg = <0xd0000000 0x2000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,dma {
+			compatible = "shared-dma-pool";
+			linux,dma-default;
+			no-map;
+			reg = <0xc1f00000 0x100000>;
+		};
+	};
+
 	aliases {
 		serial0 = &usart2;
 	};
diff --git a/arch/arm/boot/dts/stm32h743i-eval.dts b/arch/arm/boot/dts/stm32h743i-eval.dts
index c7187e1..b9af696 100644
--- a/arch/arm/boot/dts/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/stm32h743i-eval.dts
@@ -57,6 +57,19 @@
 		reg = <0xd0000000 0x2000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,dma {
+			compatible = "shared-dma-pool";
+			linux,dma-default;
+			no-map;
+			reg = <0xc1f00000 0x100000>;
+		};
+	};
+
 	aliases {
 		serial0 = &usart1;
 	};
-- 
2.7.4
