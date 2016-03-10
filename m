From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 05/18] ARM: dts: vf610: add modules required for PM
Date: Wed,  9 Mar 2016 18:16:46 -0800
Message-ID: <1457576219-7971-6-git-send-email-stefan@agner.ch>
References: <1457576219-7971-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1457576219-7971-1-git-send-email-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, robh+dt@kernel.org, sergeimir@emcraft.com, kernel@pengutronix.de, galak@codeaurora.org, tglx@linutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vfxxx.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index b038ea4..335f4e5 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -434,6 +434,11 @@
 				reg = <0x40050000 0x400>;
 			};
 
+			scsc: scsc@40052000 {
+				compatible = "fsl,vf610-scsc";
+				reg = <0x40052000 0x1000>;
+			};
+
 			usbphy0: usbphy@40050800 {
 				compatible = "fsl,vf610-usbphy";
 				reg = <0x40050800 0x400>;
@@ -480,6 +485,13 @@
 				status = "disabled";
 			};
 
+			wakeup: wkpu@4006a000 {
+				compatible = "fsl,vf610-wkpu";
+				reg = <0x4006a000 0x1000>;
+				interrupts = <92 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks VF610_CLK_WKPU>;
+			};
+
 			clks: ccm@4006b000 {
 				compatible = "fsl,vf610-ccm";
 				reg = <0x4006b000 0x1000>;
@@ -600,6 +612,13 @@
 				status = "disabled";
 			};
 
+			ddrmc: ddrmc@400ae000 {
+				compatible = "fsl,vf610-ddrmc";
+				reg = <0x400ae000 0x400>;
+				clocks = <&clks VF610_CLK_DDRMC>;
+				clock-names = "ddrc";
+			};
+
 			adc1: adc@400bb000 {
 				compatible = "fsl,vf610-adc";
 				reg = <0x400bb000 0x1000>;
-- 
2.7.2
