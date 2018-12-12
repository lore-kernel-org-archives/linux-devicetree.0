From: <Andrei.Stefanescu@microchip.com>
Subject: [PATCH] regulator: mcp16502: add support for suspend
Date: Wed, 12 Dec 2018 18:35:59 +0000
Message-ID: <1544639735-17654-1-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, gregkh@linuxfoundation.org
Cc: Cristian.Birsan@microchip.com, Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, andr3i.stefanescu@gmail.com, Andrei.Stefanescu@microchip.com
List-Id: devicetree@vger.kernel.org

This patch adds support for entering/resuming suspend states.
It does this by setting the LPM pin of the PMIC.

When suspending the PMIC will enter the Low-power mode
when the LPM pin will be set to high. If the suspend target state
is suspend-to-mem, the PMIC will transition to Hibernate mode,
otherwise, if it is standby, it will remain in Low-power mode.

This patch depends on
0b60c4deca1d regulator: mcp16502: add regulator driver for MCP16502


Signed-off-by: Andrei Stefanescu <andrei.stefanescu@microchip.com>
---
 drivers/regulator/mcp16502.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/regulator/mcp16502.c b/drivers/regulator/mcp16502.c
index 7cbc96f..bde3172 100644
--- a/drivers/regulator/mcp16502.c
+++ b/drivers/regulator/mcp16502.c
@@ -497,6 +497,36 @@ static int mcp16502_probe(struct i2c_client *client,
 	return 0;
 }
=20
+#ifdef CONFIG_SUSPEND
+static int mcp16502_suspend(struct device *dev)
+{
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct mcp16502 *mcp =3D i2c_get_clientdata(client);
+
+	mcp16502_gpio_set_mode(mcp, MCP16502_OPMODE_LPM);
+
+	return 0;
+}
+
+static int mcp16502_resume(struct device *dev)
+{
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct mcp16502 *mcp =3D i2c_get_clientdata(client);
+
+	mcp16502_gpio_set_mode(mcp, MCP16502_OPMODE_ACTIVE);
+
+	return 0;
+}
+#else /* !CONFIG_SUSPEND */
+#define mcp16502_suspend NULL
+#define mcp16502_resume NULL
+#endif /* !CONFIG_SUSPEND */
+
+#ifdef CONFIG_PM
+static const struct dev_pm_ops mcp16502_pm_ops =3D {
+	SET_SYSTEM_SLEEP_PM_OPS(mcp16502_suspend, mcp16502_resume)
+};
+#endif
 static const struct i2c_device_id mcp16502_i2c_id[] =3D {
 	{ "mcp16502", 0 },
 	{ }
@@ -508,6 +538,9 @@ static struct i2c_driver mcp16502_drv =3D {
 	.driver		=3D {
 		.name	=3D "mcp16502-regulator",
 		.of_match_table	=3D of_match_ptr(mcp16502_ids),
+#ifdef CONFIG_PM
+		.pm =3D &mcp16502_pm_ops,
+#endif
 	},
 	.id_table	=3D mcp16502_i2c_id,
 };
--=20
2.7.4
