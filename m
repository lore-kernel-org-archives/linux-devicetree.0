From: Jaret Cantu <jaret.cantu@timesys.com>
Subject: [PATCH] ARM: dts: imx: b650v3: Calibrate USB PHY to pass eye diagram
 test
Date: Wed, 14 Sep 2016 17:14:49 -0400
Message-ID: <1473887689-10792-1-git-send-email-jaret.cantu@timesys.com>
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
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Calibrate the USB PHY TX settings to pass the eye diagram signal
integrity test.  The settings are taken from the i.MX6 reference
manual's recommended configuration for USB certification (66.2.6).

Signed-off-by: Jaret Cantu <jaret.cantu@timesys.com>
---
 arch/arm/boot/dts/imx6q-b650v3.dts |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-b650v3.dts b/arch/arm/boot/dts/imx6q-b650v3.dts
index 33cb71a..c266bd2 100644
--- a/arch/arm/boot/dts/imx6q-b650v3.dts
+++ b/arch/arm/boot/dts/imx6q-b650v3.dts
@@ -89,3 +89,9 @@
 		};
 	};
 };
+
+&usbphy1 {
+	fsl,tx-cal-45-dn-ohms = <55>;
+	fsl,tx-cal-45-dp-ohms = <55>;
+	fsl,tx-d-cal = <100>;
+};
-- 
1.7.10.4
