From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [RFCv2][PATCHv5 2/4] ARM: dts: Add Freescale FTM PWM node for VF610.
Date: Wed, 30 Oct 2013 14:23:22 +0800
Message-ID: <1383114204-17264-3-git-send-email-Li.Xiubo@freescale.com>
References: <1383114204-17264-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1383114204-17264-1-git-send-email-Li.Xiubo@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: r65073@freescale.com, thierry.reding@gmail.com
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, linux@arm.linux.org.uk, ian.campbell@citrix.com, pawel.moll@arm.com, swarren@wwwdotorg.org, s.hauer@pengutronix.de, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, devicetree@vger.kernel.org, rob@landley.net, grant.likely@linaro.org, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds devicetree node for VF610, and there are 8 channels supported
by default.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 arch/arm/boot/dts/vf610.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/vf610.dtsi b/arch/arm/boot/dts/vf610.dtsi
index 67d929c..ec12397 100644
--- a/arch/arm/boot/dts/vf610.dtsi
+++ b/arch/arm/boot/dts/vf610.dtsi
@@ -140,6 +140,16 @@
 				clock-names = "pit";
 			};
 
+			pwm0: pwm@40038000 {
+				compatible = "fsl,vf610-ftm-pwm";
+				#pwm-cells = <3>;
+				reg = <0x40038000 0x1000>;
+				clock-names = "ftm0", "ftm0_counter";
+				clocks = <&clks VF610_CLK_FTM0>,
+					<&clks VF610_CLK_FTM0>;
+				status = "disabled";
+			};
+
 			wdog@4003e000 {
 				compatible = "fsl,vf610-wdt", "fsl,imx21-wdt";
 				reg = <0x4003e000 0x1000>;
-- 
1.8.4
