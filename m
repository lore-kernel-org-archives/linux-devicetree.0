From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH v2 6/8] regulator: sy8824x: add SY20276 support
Date: Wed, 28 Aug 2019 06:12:05 +0000
Message-ID: <20190828140048.71df2899@xhacker.debian>
References: <20190828135646.52457ac3@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828135646.52457ac3@xhacker.debian>
Content-Language: en-US
Content-ID: <CA5BD6946FB20045B13B2AD032857C30@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The differences between SY8824C and SY20276 are different vsel_min,
vsel_step, vsel_count and regs for mode/enable.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/sy8824x.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/regulator/sy8824x.c b/drivers/regulator/sy8824x.c
index c93c49e64315..10d9180a0d77 100644
--- a/drivers/regulator/sy8824x.c
+++ b/drivers/regulator/sy8824x.c
@@ -171,6 +171,15 @@ static const struct sy8824_config sy8824e_cfg =3D {
 	.vsel_count =3D 64,
 };
=20
+static const struct sy8824_config sy20276_cfg =3D {
+	.vol_reg =3D 0x00,
+	.mode_reg =3D 0x01,
+	.enable_reg =3D 0x01,
+	.vsel_min =3D 600000,
+	.vsel_step =3D 10000,
+	.vsel_count =3D 128,
+};
+
 static const struct of_device_id sy8824_dt_ids[] =3D {
 	{
 		.compatible =3D "silergy,sy8824c",
@@ -180,6 +189,10 @@ static const struct of_device_id sy8824_dt_ids[] =3D {
 		.compatible =3D "silergy,sy8824e",
 		.data =3D &sy8824e_cfg
 	},
+	{
+		.compatible =3D "silergy,sy20276",
+		.data =3D &sy20276_cfg
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sy8824_dt_ids);
--=20
2.23.0.rc1
