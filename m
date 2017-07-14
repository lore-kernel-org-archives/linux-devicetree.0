From: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v5 8/8] ARM: dts: TS-4600: add watchdog support
Date: Fri, 14 Jul 2017 16:32:18 -0400
Message-ID: <20170714203218.14409-9-sebastien.bourdelin@savoirfairelinux.com>
References: <20170714203218.14409-1-sebastien.bourdelin@savoirfairelinux.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170714203218.14409-1-sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, mark-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, kris-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This enables support for the watchdog located in the FPGA.

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
---
Changes v4 -> v5:
  - fix missing signed off
---
 arch/arm/boot/dts/imx28-ts4600-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx28-ts4600-common.dtsi b/arch/arm/boot/dts/imx28-ts4600-common.dtsi
index a90bd934e4a3..9e177d33ba9c 100644
--- a/arch/arm/boot/dts/imx28-ts4600-common.dtsi
+++ b/arch/arm/boot/dts/imx28-ts4600-common.dtsi
@@ -116,6 +116,11 @@
 		ts,strobe-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
 		ts,ale-gpios    = <&gpio0 26 GPIO_ACTIVE_HIGH>;
 		ts,rdy-gpios    = <&gpio0 21 GPIO_ACTIVE_HIGH>;
+
+		watchdog@2a {
+			compatible = "technologic,ts4600-wdt";
+			reg = <0x2a>;
+		};
 	};
 
 };
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
