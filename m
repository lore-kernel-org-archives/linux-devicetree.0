From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 1/2] nvmem: imx-ocotp: add i.MX7ULP support
Date: Fri, 14 Dec 2018 08:51:35 +0000
Message-ID: <1544777136-9195-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX7ULP is a new SoC of i.MX family which has 8 kbit eFuse OTP,
enable ocotp driver support for this SoC.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/nvmem/imx-ocotp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index afb429a..90a3982 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -433,6 +433,11 @@ static const struct ocotp_params imx7d_params =3D {
 	.set_timing =3D imx_ocotp_set_imx7_timing,
 };
=20
+static const struct ocotp_params imx7ulp_params =3D {
+	.nregs =3D 256,
+	.bank_address_words =3D 0,
+};
+
 static const struct of_device_id imx_ocotp_dt_ids[] =3D {
 	{ .compatible =3D "fsl,imx6q-ocotp",  .data =3D &imx6q_params },
 	{ .compatible =3D "fsl,imx6sl-ocotp", .data =3D &imx6sl_params },
@@ -440,6 +445,7 @@ static const struct of_device_id imx_ocotp_dt_ids[] =3D=
 {
 	{ .compatible =3D "fsl,imx6ul-ocotp", .data =3D &imx6ul_params },
 	{ .compatible =3D "fsl,imx7d-ocotp",  .data =3D &imx7d_params },
 	{ .compatible =3D "fsl,imx6sll-ocotp", .data =3D &imx6sll_params },
+	{ .compatible =3D "fsl,imx7ulp-ocotp", .data =3D &imx7ulp_params },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, imx_ocotp_dt_ids);
--=20
2.7.4
