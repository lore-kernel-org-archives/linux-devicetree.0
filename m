From: Anson.Huang@nxp.com
Subject: [PATCH V4 RESEND 2/3] arm64: dts: imx8qxp: Move watchdog node into scu node
Date: Mon, 27 May 2019 15:03:16 +0800
Message-ID: <20190527070317.16904-2-Anson.Huang@nxp.com>
References: <20190527070317.16904-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527070317.16904-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com, ulf.hansson@linaro.org, peng.fan@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

i.MX system controller watchdog has pretimeout function which
depends on i.MX SCU driver, so it should be a subnode of SCU.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change, just rebase the patch to top of linux-next.
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index fbfae90..9f52da6 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -157,6 +157,11 @@
 		rtc: rtc {
 			compatible = "fsl,imx8qxp-sc-rtc";
 		};
+
+		watchdog {
+			compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
+			timeout-sec = <60>;
+		};
 	};
 
 	timer {
@@ -525,9 +530,4 @@
 			power-domains = <&pd IMX_SC_R_GPIO_7>;
 		};
 	};
-
-	watchdog {
-		compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
-		timeout-sec = <60>;
-	};
 };
-- 
2.7.4
