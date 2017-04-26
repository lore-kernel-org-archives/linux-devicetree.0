From: <sean.wang@mediatek.com>
Subject: [PATCH v2 14/30] arm: dts: mt7623: add pwm nodes to the mt7623.dtsi
 file
Date: Wed, 26 Apr 2017 17:25:58 +0800
Message-ID: <1493198774-4478-15-git-send-email-sean.wang@mediatek.com>
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

From: Sean Wang <sean.wang@mediatek.com>

Add PWM nodes to the mt7623.dtsi file.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 arch/arm/boot/dts/mt7623.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 56da5ba..cfafaea 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -243,6 +243,22 @@
 		status = "disabled";
 	};
 
+	pwm: pwm@11006000 {
+		compatible = "mediatek,mt7623-pwm";
+		reg = <0 0x11006000 0 0x1000>;
+		#pwm-cells = <2>;
+		clocks = <&topckgen CLK_TOP_PWM_SEL>,
+			 <&pericfg CLK_PERI_PWM>,
+			 <&pericfg CLK_PERI_PWM1>,
+			 <&pericfg CLK_PERI_PWM2>,
+			 <&pericfg CLK_PERI_PWM3>,
+			 <&pericfg CLK_PERI_PWM4>,
+			 <&pericfg CLK_PERI_PWM5>;
+		clock-names = "top", "main", "pwm1", "pwm2",
+			      "pwm3", "pwm4", "pwm5";
+		status = "disabled";
+	};
+
 	i2c0: i2c@11007000 {
 		compatible = "mediatek,mt7623-i2c",
 			     "mediatek,mt6577-i2c";
-- 
1.9.1
