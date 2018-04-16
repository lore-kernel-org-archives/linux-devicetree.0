From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ARM: dts: renesas: replace toshiba,
 mmc-wrprotect-disable with disable-wp
Date: Tue, 17 Apr 2018 00:02:32 +0900
Message-ID: <1523890952-20866-1-git-send-email-yamada.masahiro@socionext.com>
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
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Follow up commit 788778b0d21a ("mmc: tmio: deprecate "toshiba,
mmc-wrprotect-disable" DT property").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/dts/r8a73a4-ape6evm.dts | 4 ++--
 arch/arm/boot/dts/sh73a0.dtsi         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
index ec7c86e..125c39c 100644
--- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
@@ -234,7 +234,7 @@
 &sdhi0 {
 	vmmc-supply = <&vcc_sdhi0>;
 	bus-width = <4>;
-	toshiba,mmc-wrprotect-disable;
+	disable-wp;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdhi0_pins>;
 	status = "okay";
@@ -244,7 +244,7 @@
 	vmmc-supply = <&ape6evm_fixed_3v3>;
 	bus-width = <4>;
 	broken-cd;
-	toshiba,mmc-wrprotect-disable;
+	disable-wp;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdhi1_pins>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index 914a7c2..39cc586 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -336,7 +336,7 @@
 			      GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_SDHI1>;
 		power-domains = <&pd_a3sp>;
-		toshiba,mmc-wrprotect-disable;
+		disable-wp;
 		cap-sd-highspeed;
 		status = "disabled";
 	};
@@ -348,7 +348,7 @@
 			      GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks SH73A0_CLK_SDHI2>;
 		power-domains = <&pd_a3sp>;
-		toshiba,mmc-wrprotect-disable;
+		disable-wp;
 		cap-sd-highspeed;
 		status = "disabled";
 	};
-- 
2.7.4
