From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/2] mtd: maps: physmap: Store gpio_values correctly
Date: Thu, 28 Mar 2019 17:02:15 +1300
Message-ID: <20190328040217.1895-2-chris.packham@alliedtelesis.co.nz>
References: <20190328040217.1895-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328040217.1895-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: bbrezillon@kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

When the gpio-addr-flash.c driver was merged with physmap-core.c the
code to store the current gpio_values was lost. This meant that once a
gpio was asserted it was never de-asserted. Fix this by storing the
current offset in gpio_values like the old driver used to.

Fixes: commit ba32ce95cbd9 ("mtd: maps: Merge gpio-addr-flash.c into phys=
map-core.c")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/mtd/maps/physmap-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-c=
ore.c
index d9a3e4bebe5d..21b556afc305 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -132,6 +132,8 @@ static void physmap_set_addr_gpios(struct physmap_fla=
sh_info *info,
=20
 		gpiod_set_value(info->gpios->desc[i], !!(BIT(i) & ofs));
 	}
+
+	info->gpio_values =3D ofs;
 }
=20
 #define win_mask(order)		(BIT(order) - 1)
--=20
2.21.0
