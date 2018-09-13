From: Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: dts: ste: Fix SPI controller node names
Date: Thu, 13 Sep 2018 13:12:34 -0500
Message-ID: <20180913181245.25484-10-robh@kernel.org>
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
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

SPI controller nodes should be named 'spi' rather than 'ssp'. Fixing the
name enables dtc SPI bus checks.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please apply to the sub-arch tree. The dtc changes haven't landed, but 
will for 4.20.

 arch/arm/boot/dts/ste-dbx5x0.dtsi     | 4 ++--
 arch/arm/boot/dts/ste-hrefprev60.dtsi | 2 +-
 arch/arm/boot/dts/ste-snowball.dts    | 2 +-
 arch/arm/boot/dts/ste-u300.dts        | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index 2310a4e97768..8b5288172085 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -878,7 +878,7 @@
 			power-domains = <&pm_domains DOMAIN_VAPE>;
 		};
 
-		ssp@80002000 {
+		spi@80002000 {
 			compatible = "arm,pl022", "arm,primecell";
 			reg = <0x80002000 0x1000>;
 			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
@@ -892,7 +892,7 @@
 			power-domains = <&pm_domains DOMAIN_VAPE>;
 		};
 
-		ssp@80003000 {
+		spi@80003000 {
 			compatible = "arm,pl022", "arm,primecell";
 			reg = <0x80003000 0x1000>;
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/ste-hrefprev60.dtsi b/arch/arm/boot/dts/ste-hrefprev60.dtsi
index 3f14b4df69b4..94eeb7f1c947 100644
--- a/arch/arm/boot/dts/ste-hrefprev60.dtsi
+++ b/arch/arm/boot/dts/ste-hrefprev60.dtsi
@@ -57,7 +57,7 @@
 			};
 		};
 
-		ssp@80002000 {
+		spi@80002000 {
 			/*
 			 * On the first generation boards, this SSP/SPI port was connected
 			 * to the AB8500.
diff --git a/arch/arm/boot/dts/ste-snowball.dts b/arch/arm/boot/dts/ste-snowball.dts
index b0b94d053098..603890461ae0 100644
--- a/arch/arm/boot/dts/ste-snowball.dts
+++ b/arch/arm/boot/dts/ste-snowball.dts
@@ -376,7 +376,7 @@
 			pinctrl-1 = <&i2c3_sleep_mode>;
 		};
 
-		ssp@80002000 {
+		spi@80002000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&ssp0_snowball_mode>;
 		};
diff --git a/arch/arm/boot/dts/ste-u300.dts b/arch/arm/boot/dts/ste-u300.dts
index 62ecb6a2fa39..1bd1aba3322f 100644
--- a/arch/arm/boot/dts/ste-u300.dts
+++ b/arch/arm/boot/dts/ste-u300.dts
@@ -442,7 +442,7 @@
 			dma-names = "rx";
 		};
 
-		spi: ssp@c0006000 {
+		spi: spi@c0006000 {
 			compatible = "arm,pl022", "arm,primecell";
 			reg = <0xc0006000 0x1000>;
 			interrupt-parent = <&vica>;
-- 
2.17.1
