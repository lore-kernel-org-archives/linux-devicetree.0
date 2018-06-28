From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 4/4] ARM: dts: imx6qdl-zii-rdu2: Populate RAVE SP power button node
Date: Wed, 27 Jun 2018 21:24:24 -0700
Message-ID: <20180628042424.12664-5-andrew.smirnov@gmail.com>
References: <20180628042424.12664-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180628042424.12664-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Lucas Stach <l.stach@pengutronix.de>, cphealy@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

RAVE SP found on RDU2 implements power button control compatible with
the rave-sp-pwrbutton driver. Add a node to make it availible.

Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: cphealy@gmail.com
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi b/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
index 48da4b15da09..869dfd8431a1 100644
--- a/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
@@ -331,6 +331,10 @@
 			compatible = "zii,rave-sp-backlight";
 		};
 
+		pwrbutton {
+			compatible = "zii,rave-sp-pwrbutton";
+		};
+
 		eeprom@a3 {
 			compatible = "zii,rave-sp-eeprom";
 			reg = <0xa3 0x4000>;
-- 
2.17.1
