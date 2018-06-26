From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 1/2] ARM: dts: stm32: remove gpio aliases for stm32mp157c
Date: Tue, 26 Jun 2018 18:19:00 +0200
Message-ID: <1530029941-26089-2-git-send-email-alexandre.torgue@st.com>
References: <1530029941-26089-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1530029941-26089-1-git-send-email-alexandre.torgue@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: ludovic.barre@st.com, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

GPIO aliases are not used by stm32 pinctrl driver.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 5183830..9dc4ff0 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -35,20 +35,6 @@
 		cpu_on = <0x84000003>;
 	};
 
-	aliases {
-		gpio0 = &gpioa;
-		gpio1 = &gpiob;
-		gpio2 = &gpioc;
-		gpio3 = &gpiod;
-		gpio4 = &gpioe;
-		gpio5 = &gpiof;
-		gpio6 = &gpiog;
-		gpio7 = &gpioh;
-		gpio8 = &gpioi;
-		gpio9 = &gpioj;
-		gpio10 = &gpiok;
-	};
-
 	intc: interrupt-controller@a0021000 {
 		compatible = "arm,cortex-a7-gic";
 		#interrupt-cells = <3>;
-- 
2.7.4
