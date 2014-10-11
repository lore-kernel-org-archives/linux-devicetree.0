From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH 2/5] phy: berlin-sata: Add support for BG2 SATA PHY
Date: Sat, 11 Oct 2014 17:41:10 +0200
Message-ID: <1413042073-14253-3-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1413042073-14253-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413042073-14253-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Berlin BG2 also has a SATA PHY compatible with the current driver
except different PHY_BASE. Add a new compatible to the driver
reflecting the different PHY_BASE.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
---
Cc: Kishon Vijay Abraham I <kishon@ti.com>=20
Cc: "Antoine T=C3=A9nart" <antoine.tenart@free-electrons.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org=20
---
 drivers/phy/phy-berlin-sata.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/phy/phy-berlin-sata.c b/drivers/phy/phy-berlin-sat=
a.c
index 9682b0f66177..71568f5444ac 100644
--- a/drivers/phy/phy-berlin-sata.c
+++ b/drivers/phy/phy-berlin-sata.c
@@ -30,6 +30,7 @@
 #define MBUS_WRITE_REQUEST_SIZE_128	(BIT(2) << 16)
 #define MBUS_READ_REQUEST_SIZE_128	(BIT(2) << 19)
=20
+#define BG2_PHY_BASE		0x080
 #define BG2Q_PHY_BASE		0x200
=20
 /* register 0x01 */
@@ -186,10 +187,15 @@ static u32 phy_berlin_power_down_bits[] =3D {
 	POWER_DOWN_PHY1,
 };
=20
+static u32 bg2_sata_phy_base =3D BG2_PHY_BASE;
 static u32 bg2q_sata_phy_base =3D BG2Q_PHY_BASE;
=20
 static const struct of_device_id phy_berlin_sata_of_match[] =3D {
 	{
+		.compatible =3D "marvell,berlin2-sata-phy",
+		.data =3D &bg2_sata_phy_base,
+	},
+	{
 		.compatible =3D "marvell,berlin2q-sata-phy",
 		.data =3D &bg2q_sata_phy_base,
 	},
--=20
2.1.1
