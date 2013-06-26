From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH 4/4] arm: mxs: Add mxs internal temp sensor to cfa-10036
Date: Wed, 26 Jun 2013 10:51:13 +0200
Message-ID: <1372236673-20725-5-git-send-email-alexandre.belloni@free-electrons.com>
References: <1372236673-20725-1-git-send-email-alexandre.belloni@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372236673-20725-1-git-send-email-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>, Jean Delvare <khali@linux-fr.org>
Cc: jimwall@q.com, brian@crystalfontz.com, Maxime Ripard <maxime.ripard@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Guenter Roeck <linux@roeck-us.net>, Russell King <linux@arm.linux.org.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org, linux-arm-kernel@lists.infradead.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 arch/arm/boot/dts/imx28-cfa10036.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx28-cfa10036.dts b/arch/arm/boot/dts/imx28-cfa10036.dts
index 802e0e9..5afb945 100644
--- a/arch/arm/boot/dts/imx28-cfa10036.dts
+++ b/arch/arm/boot/dts/imx28-cfa10036.dts
@@ -95,7 +95,7 @@
 				status = "okay";
 			};
 
-			lradc@80050000 {
+			lradc: lradc@80050000 {
 				status = "okay";
 			};
 		};
@@ -121,4 +121,10 @@
 			default-state = "on";
 		};
 	};
+
+	temp {
+		compatible = "fsl,mxs-internal-temp";
+		io-channels = <&lradc 8>, <&lradc 9>;
+		io-channel-names = "min", "max";
+	};
 };
-- 
1.8.1.2
