From: Flora Fu <flora.fu@mediatek.com>
Subject: [PATCH 6/7] ARM: dts: mt8135: Add support for PMIC MT6397 MFD
Date: Mon, 17 Nov 2014 15:40:26 +0800
Message-ID: <1416210027-5562-7-git-send-email-flora.fu@mediatek.com>
References: <1416210027-5562-1-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1416210027-5562-1-git-send-email-flora.fu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ashwin Chaugule <ashwin.chaugule@linaro.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, srv_heupstream@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Flora Fu <flora.fu@mediatek.com>, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, Dongdong Cheng <dongdong.cheng@mediatek.com>
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
