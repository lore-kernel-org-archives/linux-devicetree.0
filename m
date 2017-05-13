From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] arm64: dts: uniphier: fix simple-bus unit address format
 error
Date: Sun, 14 May 2017 02:20:50 +0900
Message-ID: <1494696050-4615-2-git-send-email-yamada.masahiro@socionext.com>
References: <1494696050-4615-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1494696050-4615-1-git-send-email-yamada.masahiro@socionext.com>
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

Compiling the UniPhier DT files with W=1, DTC warns like follows:

Warning (simple_bus_reg): Node /soc/smpctrl@59800000 simple-bus unit address format error, expected "59801000"

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 2 +-
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index dc0cd94..20bea49 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -268,7 +268,7 @@
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59800000 {
+		smpctrl@59801000 {
 			compatible = "socionext,uniphier-smpctrl";
 			reg = <0x59801000 0x400>;
 		};
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index c7bd006..4b856af 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -337,7 +337,7 @@
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59800000 {
+		smpctrl@59801000 {
 			compatible = "socionext,uniphier-smpctrl";
 			reg = <0x59801000 0x400>;
 		};
-- 
2.7.4
