From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 3/3] arm64: dts: freescale: imx8qxp: enable scu general irq
 channel
Date: Wed, 23 Jan 2019 08:01:21 +0000
Message-ID: <1548230179-26076-3-git-send-email-Anson.Huang@nxp.com>
References: <1548230179-26076-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548230179-26076-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On i.MX8QXP, SCU uses MU1 general interrupt channel #3 to notify
user for IRQs of RTC alarm, thermal alarm and WDOG etc., mailbox
RX doorbell mode is used for this function, this patch adds
support for it.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/d=
ts/freescale/imx8qxp.dtsi
index 4c3dd95..4021f25 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -87,7 +87,8 @@
 	scu {
 		compatible =3D "fsl,imx-scu";
 		mbox-names =3D "tx0", "tx1", "tx2", "tx3",
-			     "rx0", "rx1", "rx2", "rx3";
+			     "rx0", "rx1", "rx2", "rx3",
+			     "gi3";
 		mboxes =3D <&lsio_mu1 0 0
 			  &lsio_mu1 0 1
 			  &lsio_mu1 0 2
@@ -95,7 +96,8 @@
 			  &lsio_mu1 1 0
 			  &lsio_mu1 1 1
 			  &lsio_mu1 1 2
-			  &lsio_mu1 1 3>;
+			  &lsio_mu1 1 3
+			  &lsio_mu1 3 3>;
=20
 		clk: clock-controller {
 			compatible =3D "fsl,imx8qxp-clk";
--=20
2.7.4
