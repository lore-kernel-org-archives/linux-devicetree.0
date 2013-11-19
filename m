From: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v2] itg3200: add dt support.
Date: Tue, 19 Nov 2013 11:30:13 +1100
Message-ID: <20131119113013.39dae3cd@notabene.brown>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/cPIpWNvpMxBh2XGpcbknpf0"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Manuel Stahl <manuel.stahl-GeUHRtUQU7nSyEMIgutvibNAH6kLmebB@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/cPIpWNvpMxBh2XGpcbknpf0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable



No new configuration, just a 'compatible' string and documentation.

Signed-off-by: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>

diff --git a/Documentation/devicetree/bindings/iio/gyro/itg3200.txt
b/Documentation/devicetree/bindings/iio/gyro/itg3200.txt new file mode 1006=
44
index 000000000000..4581620632df
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/gyro/itg3200.txt
@@ -0,0 +1,20 @@
+* InvenSense ITG3200 3-axis gyroscope
+
+Required properties:
+
+  - compatible : "invensense,itg3200"
+  - reg : I2C address, typically 0x68
+
+Optional properties:
+
+  - interrupt-parent : should be the phandle for the interrupt controller
+  - interrupts : interrupt mapping for IRQ
+
+Example:
+
+itg3200@68 {
+	compatible =3D "invensense,itg3200";
+	reg =3D <0x68>;
+	interrupt-parent =3D <&gpio2>;
+	interrupts =3D <24 IRQ_TYPE_EDGE_RISING>;
+};
diff --git a/drivers/iio/gyro/itg3200_core.c b/drivers/iio/gyro/itg3200_cor=
e.c
index 4d3f3b92b361..1ed3003ef41a 100644
--- a/drivers/iio/gyro/itg3200_core.c
+++ b/drivers/iio/gyro/itg3200_core.c
@@ -374,10 +374,17 @@ static const struct i2c_device_id itg3200_id[] =3D {
 };
 MODULE_DEVICE_TABLE(i2c, itg3200_id);
=20
+static const struct of_device_id itg3200_of_match[] =3D {
+	{ .compatible =3D "invensense,itg3200", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, itg3200_of_match);
+
 static struct i2c_driver itg3200_driver =3D {
 	.driver =3D {
 		.owner  =3D THIS_MODULE,
 		.name	=3D "itg3200",
+		.of_match_table =3D of_match_ptr(itg3200_of_match),
 	},
 	.id_table	=3D itg3200_id,
 	.probe		=3D itg3200_probe,

--Sig_/cPIpWNvpMxBh2XGpcbknpf0
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIVAwUBUoqxFTnsnt1WYoG5AQKdPBAAoP05W/2BJzs++/WDOwUXBSUW+wziobx2
FdX3pW4pQ4iC0OKzxW9GqJYPLp6G2pqMP3yp6J5NYvxkLUf2sxPEDD4Fi6ZMyNLJ
cdFdt2+GBdFMyKnw2SH9zaQTydgT8t5DPumBuWcQTONljYnJOmtxwYRdMxzdE9Gn
QBa7yn4epf3u3BTqfexuuefoho2jWsQUSRntqXXb769GsRA14kVRyBz8MKZmnIpa
Vdpw0uOTn+7ozmg6gUQkny/OWGPwtvaAYhifORlLqHQ6sE8hmZoCqIrmwId4vfA5
wCbtAbMRc9nUcmpNtjFEzXwPtF1LQavbLKMFLa0obNQqQF4gSoliF7TOcKm8hEke
6hQW2Bx/wzhLtqCD8unWmPMwsWAXFgC6aHkUdfXOMdiOw9KW0mdKTe1HoB56o2ke
Vcm/qpUv+J1tToHZ0RA51wFvyF1ct6tQB7bkrxM7h91VfHkLNxLFjx5cFH9tLIQ4
aK8T2sV3HcsDRDwTmuc9srm8hnh5/VkHZ/GnEQ7ocQXi84QRo+r2iMp5oAIED90u
LAd7mMo6WWMf1aX7Uc/HSsflf5os+azbnTQIzdgZztW0L1AoNT6zqJKtdAuhDEqX
knM6Iq4Td9EkAspqvzQaw5atHBkdamj95b6ZTmFmdJuSxE+rYs8mqkwlat0nGl7Z
jH1PtXUPhg4=
=RZI0
-----END PGP SIGNATURE-----

--Sig_/cPIpWNvpMxBh2XGpcbknpf0--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
