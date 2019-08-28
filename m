From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH v2 8/8] regulator: sy8824x: add SY20278 support
Date: Wed, 28 Aug 2019 06:13:49 +0000
Message-ID: <20190828140225.3875b868@xhacker.debian>
References: <20190828135646.52457ac3@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828135646.52457ac3@xhacker.debian>
Content-Language: en-US
Content-ID: <70E73BCDEEC9A14EB36EEBCE74780CC3@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The differences between SY8824C and SY20278 are different regs
for mode/enable.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/sy8824x.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/regulator/sy8824x.c b/drivers/regulator/sy8824x.c
index 10d9180a0d77..f74ee7f36d74 100644
--- a/drivers/regulator/sy8824x.c
+++ b/drivers/regulator/sy8824x.c
@@ -180,6 +180,15 @@ static const struct sy8824_config sy20276_cfg =3D {
 	.vsel_count =3D 128,
 };
=20
+static const struct sy8824_config sy20278_cfg =3D {
+	.vol_reg =3D 0x00,
+	.mode_reg =3D 0x01,
+	.enable_reg =3D 0x01,
+	.vsel_min =3D 762500,
+	.vsel_step =3D 12500,
+	.vsel_count =3D 64,
+};
+
 static const struct of_device_id sy8824_dt_ids[] =3D {
 	{
 		.compatible =3D "silergy,sy8824c",
@@ -193,6 +202,10 @@ static const struct of_device_id sy8824_dt_ids[] =3D {
 		.compatible =3D "silergy,sy20276",
 		.data =3D &sy20276_cfg
 	},
+	{
+		.compatible =3D "silergy,sy20278",
+		.data =3D &sy20278_cfg
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sy8824_dt_ids);
--=20
2.23.0.rc1
