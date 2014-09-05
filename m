From: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
Subject: [PATCH 1/2] adv7604: Add support for i2c_new_secondary_device
Date: Fri,  5 Sep 2014 16:19:32 +0200
Message-ID: <1409926773-30696-1-git-send-email-jean-michel.hautbois@vodalys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: m.chehab@samsung.com, hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com, mark.rutland@arm.com, lars@metafoo.de, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
List-Id: devicetree@vger.kernel.org

The ADV7604 has thirteen 256-byte maps that can be accessed via the mai=
n
I=C2=B2C ports. Each map has it own I=C2=B2C address and acts
as a standard slave device on the I=C2=B2C bus.

If nothing is defined, it uses default addresses.
The main purpose is using two adv76xx on the same i2c bus.

Signed-off-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
---
 .../devicetree/bindings/media/i2c/adv7604.txt      | 17 ++++++-
 drivers/media/i2c/adv7604.c                        | 53 ++++++++++++++=
--------
 2 files changed, 48 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.txt b/=
Documentation/devicetree/bindings/media/i2c/adv7604.txt
index c27cede..8486b5c 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
+++ b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
@@ -10,8 +10,12 @@ Required Properties:
=20
   - compatible: Must contain one of the following
     - "adi,adv7611" for the ADV7611
+    - "adi,adv7604" for the ADV7604
=20
-  - reg: I2C slave address
+  - reg: I2C slave addresses
+    The ADV7604 has thirteen 256-byte maps that can be accessed via th=
e main
+    I=C2=B2C ports. Each map has it own I=C2=B2C address and acts
+    as a standard slave device on the I=C2=B2C bus.
=20
   - hpd-gpios: References to the GPIOs that control the HDMI hot-plug
     detection pins, one per HDMI input. The active flag indicates the =
GPIO
@@ -32,6 +36,12 @@ The digital output port node must contain at least o=
ne endpoint.
 Optional Properties:
=20
   - reset-gpios: Reference to the GPIO connected to the device's reset=
 pin.
+  - reg-names : Names of maps with programmable addresses.
+		It can contain any map needing another address than default one.
+		Possible maps names are :
+ADV7604 : "main", "avlink", "cec", "infoframe", "esdp", "dpp", "afe", =
"rep",
+		"edid", "hdmi", "test", "cp", "vdp"
+ADV7611 : "main", "cec", "infoframe", "afe", "rep", "edid", "hdmi", "c=
p"
=20
 Optional Endpoint Properties:
=20
@@ -50,7 +60,10 @@ Example:
=20
 	hdmi_receiver@4c {
 		compatible =3D "adi,adv7611";
-		reg =3D <0x4c>;
+		/* edid page will be accessible @ 0x66 on i2c bus */
+		/* other maps keep their default addresses */
+		reg =3D <0x4c 0x66>;
+		reg-names =3D "main", "edid";
=20
 		reset-gpios =3D <&ioexp 0 GPIO_ACTIVE_LOW>;
 		hpd-gpios =3D <&ioexp 2 GPIO_ACTIVE_HIGH>;
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index d4fa213..8336c02 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -326,6 +326,22 @@ static const struct adv7604_video_standards adv760=
4_prim_mode_hdmi_gr[] =3D {
 	{ },
 };
=20
+static const char const *adv7604_secondary_names[] =3D {
+	[ADV7604_PAGE_IO] =3D "main",
+	[ADV7604_PAGE_AVLINK] =3D "avlink",
+	[ADV7604_PAGE_CEC] =3D "cec",
+	[ADV7604_PAGE_INFOFRAME] =3D "infoframe",
+	[ADV7604_PAGE_ESDP] =3D "esdp",
+	[ADV7604_PAGE_DPP] =3D "dpp",
+	[ADV7604_PAGE_AFE] =3D "afe",
+	[ADV7604_PAGE_REP] =3D "rep",
+	[ADV7604_PAGE_EDID] =3D "edid",
+	[ADV7604_PAGE_HDMI] =3D "hdmi",
+	[ADV7604_PAGE_TEST] =3D "test",
+	[ADV7604_PAGE_CP] =3D "cp",
+	[ADV7604_PAGE_VDP] =3D "vdp"
+};
+
 /* -------------------------------------------------------------------=
---- */
=20
 static inline struct adv7604_state *to_state(struct v4l2_subdev *sd)
@@ -2528,13 +2544,25 @@ static void adv7604_unregister_clients(struct a=
dv7604_state *state)
 }
=20
 static struct i2c_client *adv7604_dummy_client(struct v4l2_subdev *sd,
-							u8 addr, u8 io_reg)
+						unsigned int i)
 {
 	struct i2c_client *client =3D v4l2_get_subdevdata(sd);
+	struct adv7604_platform_data *pdata =3D client->dev.platform_data;
+	unsigned int io_reg =3D 0xf2 + i;
+	unsigned int default_addr =3D io_read(sd, io_reg) >> 1;
+	struct i2c_client *new_client;
+
+	if (pdata && pdata->i2c_addresses[i])
+		new_client =3D i2c_new_dummy(client->adapter,
+					pdata->i2c_addresses[i]);
+	else
+		new_client =3D i2c_new_secondary_device(client,
+			adv7604_secondary_names[i], default_addr);
=20
-	if (addr)
-		io_write(sd, io_reg, addr << 1);
-	return i2c_new_dummy(client->adapter, io_read(sd, io_reg) >> 1);
+	if (new_client)
+		io_write(sd, io_reg, new_client->addr << 1);
+
+	return new_client;
 }
=20
 static const struct adv7604_reg_seq adv7604_recommended_settings_afe[]=
 =3D {
@@ -2717,20 +2745,6 @@ static int adv7604_parse_dt(struct adv7604_state=
 *state)
 	/* Disable the interrupt for now as no DT-based board uses it. */
 	state->pdata.int1_config =3D ADV7604_INT1_CONFIG_DISABLED;
=20
-	/* Use the default I2C addresses. */
-	state->pdata.i2c_addresses[ADV7604_PAGE_AVLINK] =3D 0x42;
-	state->pdata.i2c_addresses[ADV7604_PAGE_CEC] =3D 0x40;
-	state->pdata.i2c_addresses[ADV7604_PAGE_INFOFRAME] =3D 0x3e;
-	state->pdata.i2c_addresses[ADV7604_PAGE_ESDP] =3D 0x38;
-	state->pdata.i2c_addresses[ADV7604_PAGE_DPP] =3D 0x3c;
-	state->pdata.i2c_addresses[ADV7604_PAGE_AFE] =3D 0x26;
-	state->pdata.i2c_addresses[ADV7604_PAGE_REP] =3D 0x32;
-	state->pdata.i2c_addresses[ADV7604_PAGE_EDID] =3D 0x36;
-	state->pdata.i2c_addresses[ADV7604_PAGE_HDMI] =3D 0x34;
-	state->pdata.i2c_addresses[ADV7604_PAGE_TEST] =3D 0x30;
-	state->pdata.i2c_addresses[ADV7604_PAGE_CP] =3D 0x22;
-	state->pdata.i2c_addresses[ADV7604_PAGE_VDP] =3D 0x24;
-
 	/* Hardcode the remaining platform data fields. */
 	state->pdata.disable_pwrdnb =3D 0;
 	state->pdata.disable_cable_det_rst =3D 0;
@@ -2891,8 +2905,7 @@ static int adv7604_probe(struct i2c_client *clien=
t,
 			continue;
=20
 		state->i2c_clients[i] =3D
-			adv7604_dummy_client(sd, state->pdata.i2c_addresses[i],
-					     0xf2 + i);
+			adv7604_dummy_client(sd, i);
 		if (state->i2c_clients[i] =3D=3D NULL) {
 			err =3D -ENOMEM;
 			v4l2_err(sd, "failed to create i2c client %u\n", i);
--=20
2.0.4
