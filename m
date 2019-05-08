Return-Path: <SRS0=DUED=TI=pengutronix.de=mkl@kernel.org>
References: <20190507093437.26025-1-sean@geanix.com>
From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH 1/2] can: mcp251x: add support for mcp25625
Message-ID: <18a26b2f-5166-2142-4b8d-59818ac6fd8b@pengutronix.de>
Date: Wed, 8 May 2019 14:45:08 +0200
MIME-Version: 1.0
In-Reply-To: <20190507093437.26025-1-sean@geanix.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="49w0JpKSlrlzf082by62WVKvJBzNDxFdI"
To: Sean Nyekjaer <sean@geanix.com>, linux-can@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--49w0JpKSlrlzf082by62WVKvJBzNDxFdI
Content-Type: multipart/mixed; boundary="tj9JHD050yMPssaoTy9KffCRZ3PWecbo4";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Sean Nyekjaer <sean@geanix.com>, linux-can@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: robh+dt@kernel.org
Message-ID: <18a26b2f-5166-2142-4b8d-59818ac6fd8b@pengutronix.de>
Subject: Re: [PATCH 1/2] can: mcp251x: add support for mcp25625
References: <20190507093437.26025-1-sean@geanix.com>
In-Reply-To: <20190507093437.26025-1-sean@geanix.com>

--tj9JHD050yMPssaoTy9KffCRZ3PWecbo4
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 5/7/19 11:34 AM, Sean Nyekjaer wrote:
> Fully compatible with mcp2515, the mcp25625 have
> integrated transceiver.
>=20
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>

I've mentioned the mcp25625 to the .in file and properly introduced the
mcp25625 as a new model in the driver itself. This way the debug output
is formated properly:

> 	netdev_info(net, "MCP%x successfully initialized.\n", priv->model);

This is how the patch looks like now:

=46rom b1a45a5837c3501b75a9c542af809f80fe3dc0da Mon Sep 17 00:00:00 2001
From: Sean Nyekjaer <sean@geanix.com>
Date: Tue, 7 May 2019 11:34:36 +0200
Subject: [PATCH] can: mcp251x: add support for mcp25625

Fully compatible with mcp2515, the mcp25625 have integrated transceiver.

This patch adds support for the mcp25625 to the existing mcp251x driver.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/can/spi/Kconfig   |  5 +++--
 drivers/net/can/spi/mcp251x.c | 25 ++++++++++++++++---------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/net/can/spi/Kconfig b/drivers/net/can/spi/Kconfig
index 8f2e0dd7b756..792e9c6c4a2f 100644
--- a/drivers/net/can/spi/Kconfig
+++ b/drivers/net/can/spi/Kconfig
@@ -8,9 +8,10 @@ config CAN_HI311X
 	  Driver for the Holt HI311x SPI CAN controllers.
=20
 config CAN_MCP251X
-	tristate "Microchip MCP251x SPI CAN controllers"
+	tristate "Microchip MCP251x and MCP25625 SPI CAN controllers"
 	depends on HAS_DMA
 	---help---
-	  Driver for the Microchip MCP251x SPI CAN controllers.
+	  Driver for the Microchip MCP251x and MCP25625 SPI CAN
+	  controllers.
=20
 endmenu
diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251x.=
c
index e90817608645..da64e71a62ee 100644
--- a/drivers/net/can/spi/mcp251x.c
+++ b/drivers/net/can/spi/mcp251x.c
@@ -1,5 +1,5 @@
 /*
- * CAN bus driver for Microchip 251x CAN Controller with SPI Interface
+ * CAN bus driver for Microchip 251x/25625 CAN Controller with SPI Inter=
face
  *
  * MCP2510 support and bug fixes by Christian Pellegrin
  * <chripell@evolware.org>
@@ -41,7 +41,7 @@
  * static struct spi_board_info spi_board_info[] =3D {
  *         {
  *                 .modalias =3D "mcp2510",
- *			// or "mcp2515" depending on your controller
+ *			// "mcp2515" or "mcp25625" depending on your controller
  *                 .platform_data =3D &mcp251x_info,
  *                 .irq =3D IRQ_EINT13,
  *                 .max_speed_hz =3D 2*1000*1000,
@@ -238,6 +238,7 @@ static const struct can_bittiming_const mcp251x_bitti=
ming_const =3D {
 enum mcp251x_model {
 	CAN_MCP251X_MCP2510	=3D 0x2510,
 	CAN_MCP251X_MCP2515	=3D 0x2515,
+	CAN_MCP251X_MCP25625	=3D 0x25625,
 };
=20
 struct mcp251x_priv {
@@ -280,7 +281,6 @@ static inline int mcp251x_is_##_model(struct spi_devi=
ce *spi) \
 }
=20
 MCP251X_IS(2510);
-MCP251X_IS(2515);
=20
 static void mcp251x_clean(struct net_device *net)
 {
@@ -639,7 +639,7 @@ static int mcp251x_hw_reset(struct spi_device *spi)
=20
 	/* Wait for oscillator startup timer after reset */
 	mdelay(MCP251X_OST_DELAY_MS);
-=09
+
 	reg =3D mcp251x_read_reg(spi, CANSTAT);
 	if ((reg & CANCTRL_REQOP_MASK) !=3D CANCTRL_REQOP_CONF)
 		return -ENODEV;
@@ -820,9 +820,8 @@ static irqreturn_t mcp251x_can_ist(int irq, void *dev=
_id)
 		/* receive buffer 0 */
 		if (intf & CANINTF_RX0IF) {
 			mcp251x_hw_rx(spi, 0);
-			/*
-			 * Free one buffer ASAP
-			 * (The MCP2515 does this automatically.)
+			/* Free one buffer ASAP
+			 * (The MCP2515/25625 does this automatically.)
 			 */
 			if (mcp251x_is_2510(spi))
 				mcp251x_write_bits(spi, CANINTF, CANINTF_RX0IF, 0x00);
@@ -831,7 +830,7 @@ static irqreturn_t mcp251x_can_ist(int irq, void *dev=
_id)
 		/* receive buffer 1 */
 		if (intf & CANINTF_RX1IF) {
 			mcp251x_hw_rx(spi, 1);
-			/* the MCP2515 does this automatically */
+			/* The MCP2515/25625 does this automatically. */
 			if (mcp251x_is_2510(spi))
 				clear_intf |=3D CANINTF_RX1IF;
 		}
@@ -1006,6 +1005,10 @@ static const struct of_device_id mcp251x_of_match[=
] =3D {
 		.compatible	=3D "microchip,mcp2515",
 		.data		=3D (void *)CAN_MCP251X_MCP2515,
 	},
+	{
+		.compatible	=3D "microchip,mcp25625",
+		.data		=3D (void *)CAN_MCP251X_MCP25625,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mcp251x_of_match);
@@ -1019,6 +1022,10 @@ static const struct spi_device_id mcp251x_id_table=
[] =3D {
 		.name		=3D "mcp2515",
 		.driver_data	=3D (kernel_ulong_t)CAN_MCP251X_MCP2515,
 	},
+	{
+		.name		=3D "mcp25625",
+		.driver_data	=3D (kernel_ulong_t)CAN_MCP251X_MCP25625,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, mcp251x_id_table);
@@ -1259,5 +1266,5 @@ module_spi_driver(mcp251x_can_driver);
=20
 MODULE_AUTHOR("Chris Elston <celston@katalix.com>, "
 	      "Christian Pellegrin <chripell@evolware.org>");
-MODULE_DESCRIPTION("Microchip 251x CAN driver");
+MODULE_DESCRIPTION("Microchip 251x/25625 CAN driver");
 MODULE_LICENSE("GPL v2");
--=20
2.20.1

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--tj9JHD050yMPssaoTy9KffCRZ3PWecbo4--

--49w0JpKSlrlzf082by62WVKvJBzNDxFdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEmvEkXzgOfc881GuFWsYho5HknSAFAlzSz1UACgkQWsYho5Hk
nSBuEQf+KK4wNFjq0UkeOVUyu4Q+H/jrYJDNl3mmS3zXhShb+LNR7ZhzunTA1e4V
kiRCnLdSXmGoc1QymZjveYJq5wC5u6IElH/OwHD8YY13V8NyThWXKPeziHiIPM55
KQDnLPbjsy2V3gyEY4npX8LOJSJmTtQq5TeZeMsFvqiU8OdrxMaSw3z05sZeM0u0
+HKBTQODW2Iq/FNLMIyK2NH6OQCpCU2NI+YtFafi2MUHBR540hSoGikutFkPm54f
SAzmbwLJQW0KOjXGUA9wHPmay9OGTrXUhsfBhEm3Esssw9VdMEkp//foQD+97nJx
+8XiT70vrbomMn0/k/Ygt1rNgVEi4g==
=60FF
-----END PGP SIGNATURE-----

--49w0JpKSlrlzf082by62WVKvJBzNDxFdI--
