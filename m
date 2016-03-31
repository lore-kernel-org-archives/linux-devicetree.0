From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv3 3/5] ARM: dts: imx6-tx6: enable support for rtscts on UARTs
Date: Thu, 31 Mar 2016 14:33:43 +0200
Message-ID: <1459427625-15568-4-git-send-email-LW@KARO-electronics.de>
References: <1459427625-15568-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459427625-15568-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Add missing pinctrl for the RTS/CTS lines to uart1 and set the
fsl,uart-has-rtscts property on all UARTs to enable support for HW
handshake.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6qdl-tx6.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/imx=
6qdl-tx6.dtsi
index d96dba2..24101c1 100644
--- a/arch/arm/boot/dts/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-tx6.dtsi
@@ -684,19 +684,22 @@
=20
 &uart1 {
 	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pinctrl_uart1>;
+	pinctrl-0 =3D <&pinctrl_uart1 &pinctrl_uart1_rtscts>;
+	fsl,uart-has-rtscts;
 	status =3D "okay";
 };
=20
 &uart2 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&pinctrl_uart2 &pinctrl_uart2_rtscts>;
+	fsl,uart-has-rtscts;
 	status =3D "okay";
 };
=20
 &uart3 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&pinctrl_uart3 &pinctrl_uart3_rtscts>;
+	fsl,uart-has-rtscts;
 	status =3D "okay";
 };
=20
--=20
2.1.4
