From: Juergen Borleis <jbe@pengutronix.de>
Subject: [PATCH] DTS/TX25: add missing indention
Date: Mon, 30 Mar 2015 15:21:15 +0200
Message-ID: <201503301521.15583.jbe@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Juergen Borleis <jbe@pengutronix.de>
---
 arch/arm/boot/dts/imx25-karo-tx25.dts |   84 +++++++++++++++++------------=
----
 1 file changed, 43 insertions(+), 41 deletions(-)

diff --git a/arch/arm/boot/dts/imx25-karo-tx25.dts b/arch/arm/boot/dts/imx2=
5-karo-tx25.dts
index 9b31faa96377..801c29e9c37c 100644
--- a/arch/arm/boot/dts/imx25-karo-tx25.dts
+++ b/arch/arm/boot/dts/imx25-karo-tx25.dts
@@ -42,49 +42,51 @@
 };
 =

 &iomuxc {
-	pinctrl_uart1: uart1grp {
-		fsl,pins =3D <
-			MX25_PAD_UART1_TXD__UART1_TXD 0x80000000
-			MX25_PAD_UART1_RXD__UART1_RXD 0x80000000
-			MX25_PAD_UART1_CTS__UART1_CTS 0x80000000
-			MX25_PAD_UART1_RTS__UART1_RTS 0x80000000
-		>;
-	};
+	imx25-karo-stk5 {
+		pinctrl_uart1: uart1grp {
+			fsl,pins =3D <
+				MX25_PAD_UART1_TXD__UART1_TXD 0x80000000
+				MX25_PAD_UART1_RXD__UART1_RXD 0x80000000
+				MX25_PAD_UART1_CTS__UART1_CTS 0x80000000
+				MX25_PAD_UART1_RTS__UART1_RTS 0x80000000
+			>;
+		};
 =

-	pinctrl_fec: fecgrp {
-		fsl,pins =3D <
-			MX25_PAD_D11__GPIO_4_9		0x80000000 /* FEC PHY power on pin */
-			MX25_PAD_D13__GPIO_4_7		0x80000000 /* FEC reset */
-			MX25_PAD_FEC_MDC__FEC_MDC	0x80000000
-			MX25_PAD_FEC_MDIO__FEC_MDIO	0x80000000
-			MX25_PAD_FEC_TDATA0__FEC_TDATA0	0x80000000
-			MX25_PAD_FEC_TDATA1__FEC_TDATA1	0x80000000
-			MX25_PAD_FEC_TX_EN__FEC_TX_EN	0x80000000
-			MX25_PAD_FEC_RDATA0__FEC_RDATA0	0x80000000
-			MX25_PAD_FEC_RDATA1__FEC_RDATA1	0x80000000
-			MX25_PAD_FEC_RX_DV__FEC_RX_DV	0x80000000
-			MX25_PAD_FEC_TX_CLK__FEC_TX_CLK	0x80000000
-		>;
-	};
+		pinctrl_fec: fecgrp {
+			fsl,pins =3D <
+				MX25_PAD_D11__GPIO_4_9		0x80000000 /* FEC PHY power on pin */
+				MX25_PAD_D13__GPIO_4_7		0x80000000 /* FEC reset */
+				MX25_PAD_FEC_MDC__FEC_MDC	0x80000000
+				MX25_PAD_FEC_MDIO__FEC_MDIO	0x80000000
+				MX25_PAD_FEC_TDATA0__FEC_TDATA0	0x80000000
+				MX25_PAD_FEC_TDATA1__FEC_TDATA1	0x80000000
+				MX25_PAD_FEC_TX_EN__FEC_TX_EN	0x80000000
+				MX25_PAD_FEC_RDATA0__FEC_RDATA0	0x80000000
+				MX25_PAD_FEC_RDATA1__FEC_RDATA1	0x80000000
+				MX25_PAD_FEC_RX_DV__FEC_RX_DV	0x80000000
+				MX25_PAD_FEC_TX_CLK__FEC_TX_CLK	0x80000000
+			>;
+		};
 =

-	pinctrl_nfc: nfcgrp {
-		fsl,pins =3D <
-			MX25_PAD_NF_CE0__NF_CE0		0x80000000
-			MX25_PAD_NFWE_B__NFWE_B		0x80000000
-			MX25_PAD_NFRE_B__NFRE_B		0x80000000
-			MX25_PAD_NFALE__NFALE		0x80000000
-			MX25_PAD_NFCLE__NFCLE		0x80000000
-			MX25_PAD_NFWP_B__NFWP_B		0x80000000
-			MX25_PAD_NFRB__NFRB		0x80000000
-			MX25_PAD_D7__D7			0x80000000
-			MX25_PAD_D6__D6			0x80000000
-			MX25_PAD_D5__D5			0x80000000
-			MX25_PAD_D4__D4			0x80000000
-			MX25_PAD_D3__D3			0x80000000
-			MX25_PAD_D2__D2			0x80000000
-			MX25_PAD_D1__D1			0x80000000
-			MX25_PAD_D0__D0			0x80000000
-		>;
+		pinctrl_nfc: nfcgrp {
+			fsl,pins =3D <
+				MX25_PAD_NF_CE0__NF_CE0		0x80000000
+				MX25_PAD_NFWE_B__NFWE_B		0x80000000
+				MX25_PAD_NFRE_B__NFRE_B		0x80000000
+				MX25_PAD_NFALE__NFALE		0x80000000
+				MX25_PAD_NFCLE__NFCLE		0x80000000
+				MX25_PAD_NFWP_B__NFWP_B		0x80000000
+				MX25_PAD_NFRB__NFRB		0x80000000
+				MX25_PAD_D7__D7			0x80000000
+				MX25_PAD_D6__D6			0x80000000
+				MX25_PAD_D5__D5			0x80000000
+				MX25_PAD_D4__D4			0x80000000
+				MX25_PAD_D3__D3			0x80000000
+				MX25_PAD_D2__D2			0x80000000
+				MX25_PAD_D1__D1			0x80000000
+				MX25_PAD_D0__D0			0x80000000
+			>;
+		};
 	};
 };
 =

-- =

1.7.10.4

-- =

Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| Juergen Borleis =A0 =A0 =A0 =A0 =A0 =A0 |
Industrial Linux Solutions               =A0 =A0 =A0| http://www.pengutroni=
x.de/  |
