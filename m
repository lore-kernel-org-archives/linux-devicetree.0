From: Flora Fu <flora.fu@mediatek.com>
Subject: [PATCH v2 7/8] ARM: dts: mt8135: Add support for PMIC MT6397 MFD
Date: Fri, 28 Nov 2014 11:54:33 +0800
Message-ID: <1417146874-5232-8-git-send-email-flora.fu@mediatek.com>
References: <1417146874-5232-1-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1417146874-5232-1-git-send-email-flora.fu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@arm.linux.org.uk>, Dongdong Cheng <dongdong.cheng@mediatek.com>, Sandeep Nair <sandeep_n@ti.com>, Flora Fu <flora.fu@mediatek.com>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@nvidia.com>, Eddie Huang <eddie.huang@mediatek.com>, srv_heupstream@mediatek.com, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org


Add device tree for MT6397 MFD and its PMIC wrapper in mt8135.dtsi.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 arch/arm/boot/dts/mt8135.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
index 90a56ad..14a8aad 100644
--- a/arch/arm/boot/dts/mt8135.dtsi
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -102,6 +102,25 @@
 			clock-names = "system-clk", "rtc-clk";
 		};
 
+
+		pwrap: pwrap@1000f000 {
+			compatible = "mediatek,mt8135-pwrap";
+			reg = <0 0x1000f000 0 0x1000>,
+				<0 0x11017000 0 0x1000>;
+			reg-names = "pwrap-base", "pwrap-bridge-base";
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&infrarst MT8135_INFRA_PMIC_WRAP_RST>,
+					<&perirst MT8135_PERI_PWRAP_BRIDGE_SW_RST>;
+			reset-names = "infra-pwrap-rst",
+					"peri-pwrap-bridge-rst";
+			clocks = <&pmicspi_sel>, <&clk26m> ;
+			clock-names = "pmicspi-sel", "pmicspi-parent";
+
+			pmic {
+				compatible = "mediatek,mt6397";
+			};
+		};
+
 		gic: interrupt-controller@10211000 {
 			compatible = "arm,cortex-a15-gic";
 			interrupt-controller;
-- 
1.8.1.1.dirty
