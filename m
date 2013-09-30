From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCHv5 3/4] ARM: dts: Enables FTM PWM device for Vybrid VF610 TOWER
 board.
Date: Mon, 30 Sep 2013 14:13:30 +0800
Message-ID: <1380521611-2764-4-git-send-email-Li.Xiubo@freescale.com>
References: <1380521611-2764-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1380521611-2764-1-git-send-email-Li.Xiubo@freescale.com>
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

Selecting system clock as the counter source clock by default.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 arch/arm/boot/dts/vf610-twr.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/vf610-twr.dts b/arch/arm/boot/dts/vf610-twr.dts
index 1a58678..4257054 100644
--- a/arch/arm/boot/dts/vf610-twr.dts
+++ b/arch/arm/boot/dts/vf610-twr.dts
@@ -57,6 +57,13 @@
 	status = "okay";
 };
 
+&pwm0 {
+	fsl,pwm-counter-clk = "ftm0";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_1>;
+	status = "okay";
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1_1>;
-- 
1.8.0
