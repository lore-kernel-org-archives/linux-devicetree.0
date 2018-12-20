From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V5 1/4] dt-bindings: fsl: scu: add rtc binding
Date: Thu, 20 Dec 2018 08:56:07 +0000
Message-ID: <1545295872-20169-2-git-send-email-Anson.Huang__14778.9719551385$1545296078$gmane$org@nxp.com>
References: <1545295872-20169-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1545295872-20169-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Aisheng Dong <aisheng.dong@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Andy Gross <andy.gross@linaro.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, devicetree@vger.kerne
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as
system controller, the system controller is in charge of system
power, clock and secure RTC etc. management, Linux kernel
has to communicate with system controller via MU (message unit)
IPC to do RTC operation, this patch adds binding doc for i.MX
system controller RTC driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
No change since V4.
---
 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index c20f38e..3f3d697 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -106,6 +106,12 @@ Required properties for Pinctrl sub nodes:
 [2] Documentation/devicetree/bindings/power/power_domain.txt
 [3] Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt
 
+RTC bindings based on SCU Message Protocol
+------------------------------------------------------------
+
+Required properties:
+- compatible: should be "fsl,imx8qxp-sc-rtc";
+
 Example (imx8qxp):
 -------------
 lsio_mu1: mailbox@5d1c0000 {
@@ -148,6 +154,10 @@ firmware {
 			compatible = "fsl,imx8qxp-scu-pd";
 			#power-domain-cells = <1>;
 		};
+
+		rtc: rtc {
+			compatible = "fsl,imx8qxp-sc-rtc";
+		};
 	};
 };
 
-- 
2.7.4
