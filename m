From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH 1/4] arm: mxs: Add #io-channel-cells property to lradc
Date: Wed, 26 Jun 2013 10:51:10 +0200
Message-ID: <1372236673-20725-2-git-send-email-alexandre.belloni@free-electrons.com>
References: <1372236673-20725-1-git-send-email-alexandre.belloni@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372236673-20725-1-git-send-email-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>, Jean Delvare <khali@linux-fr.org>
Cc: jimwall@q.com, brian@crystalfontz.com, Maxime Ripard <maxime.ripard@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Guenter Roeck <linux@roeck-us.net>, Russell King <linux@arm.linux.org.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org, linux-arm-kernel@lists.infradead.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Adding #io-channel-cells property to lradc allows us to use the lradc as an iio
provider.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 arch/arm/boot/dts/imx28.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index 600f7cb..9a7feeb 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -829,6 +829,7 @@
 				interrupts = <10 14 15 16 17 18 19
 						20 21 22 23 24 25>;
 				status = "disabled";
+				#io-channel-cells = <1>;
 			};
 
 			spdif@80054000 {
-- 
1.8.1.2
