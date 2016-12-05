From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v3 1/3] ARM: dts: vf610-zii-dev-rev-b: Remove leftover PWM
 pingroup
Date: Mon,  5 Dec 2016 06:38:34 -0800
Message-ID: <1480948716-17744-1-git-send-email-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, andrew@lunn.ch, Andrey Smirnov <andrew.smirnov@gmail.com>, Russell King <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, cphealy@gmail.com
List-Id: devicetree@vger.kernel.org

Remove pwm0grp since it is:

	a) Not referenced anywhere in the DTS file (unlike Tower board it
	is based on, this board does not use/expose FTM0)

	b) Configures PTB2 and PTB3 in a way that contradicts
	pinctrl-mdio-mux

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Changes since v2:

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
