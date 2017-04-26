From: <sean.wang@mediatek.com>
Subject: [PATCH v2 08/30] arm: dts: mt7623: add pmic wrapper nodes to the
 mt7623 dtsi file
Date: Wed, 26 Apr 2017 17:25:52 +0800
Message-ID: <1493198774-4478-9-git-send-email-sean.wang@mediatek.com>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, john@phrozen.org, mark.rutland@arm.com, linux@armlinux.org.uk, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: John Crispin <john@phrozen.org>

Add PMIC wrapper node to the mt7623.dtsi file which
is necessary for the control of PMIC from Mediatek.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 arch/arm/boot/dts/mt7623.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 1942bc7..6adc21d 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -158,6 +158,19 @@
 		clock-names = "system-clk", "rtc-clk";
 	};
 
+	pwrap: pwrap@1000d000 {
+		compatible = "mediatek,mt7623-pwrap",
+			     "mediatek,mt2701-pwrap";
+		reg = <0 0x1000d000 0 0x1000>;
+		reg-names = "pwrap";
+		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+		resets = <&infracfg MT2701_INFRA_PMIC_WRAP_RST>;
+		reset-names = "pwrap";
+		clocks = <&infracfg CLK_INFRA_PMICSPI>,
+			 <&infracfg CLK_INFRA_PMICWRAP>;
+		clock-names = "spi", "wrap";
+	};
+
 	sysirq: interrupt-controller@10200100 {
 		compatible = "mediatek,mt7623-sysirq",
 			     "mediatek,mt6577-sysirq";
-- 
1.9.1
