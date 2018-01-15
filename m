From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: dts: nomadik: add interrupt-parent for clcd
Date: Mon, 15 Jan 2018 17:37:08 +0100
Message-ID: <20180115163719.1736753-1-arnd@arndb.de>
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
To: arm@kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The clcd device is lacking an interrupt-parent property, which makes
the interrupt unusable and shows up as a warning with the latest
dtc version:

arch/arm/boot/dts/ste-nomadik-s8815.dtb: Warning (interrupts_property): Missing interrupt-parent for /amba/clcd@10120000
arch/arm/boot/dts/ste-nomadik-nhk15.dtb: Warning (interrupts_property): Missing interrupt-parent for /amba/clcd@10120000

I looked up the old board files and found that this interrupt has
the same irqchip as all the other on-chip device, it just needs one
extra line.

Fixes: 17470b7da11c ("ARM: dts: add the CLCD LCD display to the NHK15")
Cc: stable@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/ste-nomadik-stn8815.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
index 68aab50a73ab..733678b75b88 100644
--- a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
@@ -750,6 +750,7 @@
 			reg = <0x10120000 0x1000>;
 			interrupt-names = "combined";
 			interrupts = <14>;
+			interrupt-parent = <&vica>;
 			clocks = <&clcdclk>, <&hclkclcd>;
 			clock-names = "clcdclk", "apb_pclk";
 			status = "disabled";
-- 
2.9.0
