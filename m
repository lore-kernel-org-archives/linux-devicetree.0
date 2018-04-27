From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] arm64: dts: uniphier: stabilize ethernet of LD20 reference
 boar
Date: Fri, 27 Apr 2018 13:25:18 +0900
Message-ID: <1524803118-32570-1-git-send-email-yamada.masahiro@socionext.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
List-Id: devicetree@vger.kernel.org

Currently, the ethernet RGMII mode on the LD20 reference board is
unstable.

The default drive-strength of ethernet TX pins is too strong because
there is no dumping resistor on the TX lines on the board.

Weaken the drive-strength to make the ethernet more stable.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
index 2c1a92f..440c2e6 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
@@ -67,3 +67,11 @@
 		reg = <0>;
 	};
 };
+
+&pinctrl_ether_rgmii {
+	tx {
+		pins = "RGMII_TXCLK", "RGMII_TXD0", "RGMII_TXD1",
+		       "RGMII_TXD2", "RGMII_TXD3", "RGMII_TXCTL";
+		drive-strength = <9>;
+	};
+};
-- 
2.7.4
