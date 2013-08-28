From: "Markus Mayer" <markus.mayer@linaro.org>
Subject: [PATCH v5 3/3] ARM: bcm281xx: Add device node for the GPIO controller
Date: Wed, 28 Aug 2013 15:16:13 -0700
Message-ID: <1377728173-30711-4-git-send-email-markus.mayer@linaro.org>
References: <1377728173-30711-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1377728173-30711-1-git-send-email-markus.mayer@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linaro Patches <patches@linaro.org>, Christian Daudt <csd@broadcom.com>, Tim Kryger <tim.kryger@linaro.org>, Matt Porter <matt.porter@linaro.org>, Markus Mayer <markus.mayer@linaro.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Add the GPIO controller device node for the Broadcom bcm281xx family of
chips

Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
Reviewed-by: Matt Porter <matt.porter@linaro.org>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/bcm11351.dtsi |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
index c0cdf66..a3945e3 100644
--- a/arch/arm/boot/dts/bcm11351.dtsi
+++ b/arch/arm/boot/dts/bcm11351.dtsi
@@ -63,6 +63,22 @@
 		clock-frequency = <32768>;
 	};
 
+	gpio: gpio@35003000 {
+		compatible = "brcm,bcm11351-gpio", "brcm,kona-gpio";
+		reg = <0x35003000 0x800>;
+		interrupts =
+		       <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH
+			GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH
+			GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH
+			GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
+			GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH
+			GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		interrupt-controller;
+	};
+
 	sdio0: sdio@0x3f180000 {
 		compatible = "bcm,kona-sdhci";
 		reg = <0x3f180000 0x10000>;
-- 
1.7.9.5
