From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 3/5] ARM: dts: lpc32xx: disable MAC controller by default
Date: Fri, 19 Apr 2019 23:54:45 +0300
Message-ID: <20190419205447.6357-4-vz@mleia.com>
References: <20190419205447.6357-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190419205447.6357-1-vz@mleia.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>
List-Id: devicetree@vger.kernel.org

NXP LPC3220 and LPC3230 SoCs do NOT contain a MAC controller, so,
since for now there is just one dtsi file for all variants of
NXP LPC32xx SoCs, it is reasonable to disable the controller
by default and enable it in device tree files of particular boards.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/lpc3250-ea3250.dts  | 1 +
 arch/arm/boot/dts/lpc3250-phy3250.dts | 1 +
 arch/arm/boot/dts/lpc32xx.dtsi        | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/lpc3250-ea3250.dts b/arch/arm/boot/dts/lpc3250-ea3250.dts
index f46a11827ef6..4adf4c96f798 100644
--- a/arch/arm/boot/dts/lpc3250-ea3250.dts
+++ b/arch/arm/boot/dts/lpc3250-ea3250.dts
@@ -201,6 +201,7 @@
 &mac {
 	phy-mode = "rmii";
 	use-iram;
+	status = "okay";
 };
 
 /* Here, choose exactly one from: ohci, usbd */
diff --git a/arch/arm/boot/dts/lpc3250-phy3250.dts b/arch/arm/boot/dts/lpc3250-phy3250.dts
index ebd19258e22b..b99726d278f6 100644
--- a/arch/arm/boot/dts/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/lpc3250-phy3250.dts
@@ -134,6 +134,7 @@
 &mac {
 	phy-mode = "rmii";
 	use-iram;
+	status = "okay";
 };
 
 /* Here, choose exactly one from: ohci, usbd */
diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index aa1d9dd248fd..a0fedab579b4 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -153,6 +153,7 @@
 			reg = <0x31060000 0x1000>;
 			interrupts = <29 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_MAC>;
+			status = "disabled";
 		};
 
 		emc: memory-controller@31080000 {
-- 
2.20.1
