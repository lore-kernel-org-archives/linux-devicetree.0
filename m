From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V12 RESEND 2/3] ARM: dts: imx7ulp: Add tpm pwm support
Date: Sun, 12 May 2019 08:51:21 +0000
Message-ID: <1557650772-11973-2-git-send-email-Anson.Huang@nxp.com>
References: <1557650772-11973-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1557650772-11973-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <0549FFB5F6AB5A45A54FC867FA70D6B5@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "otavio@ossystems.com.br" <otavio@ossystems.com.br>, Leonard Crestez <leonard.crestez@nxp.com>, "schnitzeltony@gmail.com" <schnitzeltony@gmail.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "jan.tuerk@emtrion.com" <jan.tuerk@emtrion.com>, Robin Gong <yibin.gong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add i.MX7ULP EVK board PWM support.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change change, just resend the patch with correct encoding for patch series:
https://patchwork.kernel.org/patch/10937147/
---
 arch/arm/boot/dts/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index d6b7110..8fb9559 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -124,6 +124,16 @@
 			status = "disabled";
 		};
 
+		tpm4: pwm@40250000 {
+			compatible = "fsl,imx7ulp-pwm";
+			reg = <0x40250000 0x1000>;
+			assigned-clocks = <&pcc2 IMX7ULP_CLK_LPTPM4>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
+			clocks = <&pcc2 IMX7ULP_CLK_LPTPM4>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		tpm5: tpm@40260000 {
 			compatible = "fsl,imx7ulp-tpm";
 			reg = <0x40260000 0x1000>;
-- 
2.7.4
