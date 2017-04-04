From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] arm64: dts: uniphier: add cdns,
 phy-dll-delay-sdclk(-hsmmc) for eMMC
Date: Tue,  4 Apr 2017 11:04:37 +0900
Message-ID: <1491271477-19806-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Adjust the PHY parameters for more stable access to the eMMC device.
Set the SDCLK output delay value to 21 (including HS200/400 modes).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 2 ++
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 42f1803..25a525c 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -313,6 +313,8 @@
 			cdns,phy-input-delay-legacy = <4>;
 			cdns,phy-input-delay-mmc-highspeed = <2>;
 			cdns,phy-input-delay-mmc-ddr = <3>;
+			cdns,phy-dll-delay-sdclk = <21>;
+			cdns,phy-dll-delay-sdclk-hsmmc = <21>;
 		};
 
 		usb0: usb@5a800100 {
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index e4499ff..c85e6e2 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -387,6 +387,8 @@
 			cdns,phy-input-delay-legacy = <4>;
 			cdns,phy-input-delay-mmc-highspeed = <2>;
 			cdns,phy-input-delay-mmc-ddr = <3>;
+			cdns,phy-dll-delay-sdclk = <21>;
+			cdns,phy-dll-delay-sdclk-hsmmc = <21>;
 		};
 
 		soc-glue@5f800000 {
-- 
2.7.4
