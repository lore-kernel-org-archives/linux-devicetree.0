From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] arm64: uniphier: dts: add more clocks to Denali NAND
 controller node
Date: Fri, 20 Jul 2018 17:50:45 +0900
Message-ID: <1532076645-10769-2-git-send-email-yamada.masahiro@socionext.com>
References: <1532076645-10769-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1532076645-10769-1-git-send-email-yamada.masahiro@socionext.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

Catch up with the new binding of the Denali IP where three clocks,
"nand", "nand_x", "ecc" are required.

For UniPhier SoCs, the "nand_x" and "ecc" are tied up because they
are both 200MHz.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 3 ++-
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 3 ++-
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index d63b56e..5640dac 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -571,7 +571,8 @@
 			interrupts = <0 65 4>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_nand>;
-			clocks = <&sys_clk 2>;
+			clock-names = "nand", "nand_x", "ecc";
+			clocks = <&sys_clk 2>, <&sys_clk 3>, <&sys_clk 3>;
 			resets = <&sys_rst 2>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index 0298bd0..a8964c0 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -626,7 +626,8 @@
 			interrupts = <0 65 4>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_nand>;
-			clocks = <&sys_clk 2>;
+			clock-names = "nand", "nand_x", "ecc";
+			clocks = <&sys_clk 2>, <&sys_clk 3>, <&sys_clk 3>;
 			resets = <&sys_rst 2>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index 2a4cf42..fd2bcd4 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -455,7 +455,8 @@
 			interrupts = <0 65 4>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_nand>;
-			clocks = <&sys_clk 2>;
+			clock-names = "nand", "nand_x", "ecc";
+			clocks = <&sys_clk 2>, <&sys_clk 3>, <&sys_clk 3>;
 			resets = <&sys_rst 2>;
 		};
 	};
-- 
2.7.4
