From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/2] hwmon: (adt7475): add support for inverting the pwm output
Date: Wed,  7 Nov 2018 17:00:10 +1300
Message-ID: <20181107040010.27436-3-chris.packham@alliedtelesis.co.nz>
References: <20181107040010.27436-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107040010.27436-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@roeck-us.net, robh+dt@kernel.org, jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

Add a "invert-pwm" device-tree property to allow hardware designs to use
inverted logic on the PWM output. We intentionally preserve the invert
PWM output bit if the property is not found to allow for
bootloaders/bios which may have configured this earlier.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
=20drivers/hwmon/adt7475.c | 17 +++++++++++++++++
=201 file changed, 17 insertions(+)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index f4c7516eb989..85e4dc674449 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -1536,9 +1536,22 @@ static int adt7475_update_limits(struct i2c_client=
=20*client)
=20	return 0;
=20}
=20
+static int adt7475_invert_pwm(struct i2c_client *client, int index)
+{
+	int ret;
+
+	ret =3D adt7475_read(PWM_CONFIG_REG(index));
+	if (ret < 0)
+		return ret;
+
+	return i2c_smbus_write_byte_data(client, PWM_CONFIG_REG(index),
+					 ret | BIT(4));
+}
+
=20static int adt7475_probe(struct i2c_client *client,
=20			 const struct i2c_device_id *id)
=20{
+	struct device_node *of_node =3D client->dev.of_node;
=20	enum chips chip;
=20	static const char * const names[] =3D {
=20		[adt7473] =3D "ADT7473",
@@ -1638,6 +1651,10 @@ static int adt7475_probe(struct i2c_client *client=
,
=20	for (i =3D 0; i < ADT7475_PWM_COUNT; i++)
=20		adt7475_read_pwm(client, i);
=20
+	if (of_node && of_property_read_bool(of_node, "invert-pwm"))
+		for (i =3D 0; i < ADT7475_PWM_COUNT; i++)
+			adt7475_invert_pwm(client, i);
+
=20	/* Start monitoring */
=20	switch (chip) {
=20	case adt7475:
--=20
2.19.1
