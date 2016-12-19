From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v4 1/3] ARM: dts: vf610-zii-dev-rev-b: Remove leftover PWM pingroup
Date: Sun, 18 Dec 2016 23:17:55 -0800
Message-ID: <1482131877-6097-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, cphealy@gmail.com
List-Id: devicetree@vger.kernel.org

Remove pwm0grp since it is:

	a) Not referenced anywhere in the DTS file (unlike Tower board it
	is based on, this board does not use/expose FTM0)

	b) Configures PTB2 and PTB3 in a way that contradicts
	pinctrl-mdio-mux

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Changes since v3:

	- None

 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
index fa19cfd..2210811 100644
--- a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
+++ b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
@@ -677,15 +677,6 @@
 		>;
 	};
 
-	pinctrl_pwm0: pwm0grp {
-		fsl,pins = <
-			VF610_PAD_PTB0__FTM0_CH0	0x1582
-			VF610_PAD_PTB1__FTM0_CH1	0x1582
-			VF610_PAD_PTB2__FTM0_CH2	0x1582
-			VF610_PAD_PTB3__FTM0_CH3	0x1582
-		>;
-	};
-
 	pinctrl_qspi0: qspi0grp {
 		fsl,pins = <
 			VF610_PAD_PTD7__QSPI0_B_QSCK	0x31c3
-- 
2.5.5
