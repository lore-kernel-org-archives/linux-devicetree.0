From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] Documentation: dt: mtd: replace "nor-jedec" binding with "jedec,spi-nor"
Date: Thu, 14 May 2015 10:32:53 -0700
Message-ID: <1431624773-4165-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Marek Vasut <marex@denx.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: devicetree@vger.kernel.org

In commit 8ff16cf77ce3 ("Documentation: devicetree: m25p80: add "nor-je=
dec"
binding"), we added a generic "nor-jedec" binding to catch all
mostly-compatible SPI NOR flash which can be detected via the READ ID
opcode (0x9F). This was discussed and reviewed at the time, however
objections have come up since then as part of this discussion:

  http://lkml.kernel.org/g/20150511224646.GJ32500@ld-irv-0074

It seems the parties involved agree that "jedec,spi-nor" does a better
job of capturing the fact that this is SPI-specific, not just any NOR
flash.

This binding was only merged for v4.1-rc1, so it's still OK to change
the naming.

At the same time, let's move the documentation to a better name.

Next up: prune the m25p_ids[] table to the minimal necessary listing, s=
o
we can stop referring to code (drivers/mtd/devices/m25p80.c) from the
documentation.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org
---
I'd *really* like to get an 'ack' from a DT maintainer for this, those =
those
are apparently very hard to come by. And I'd really not like to have to=
 revisit
this again in a few weeks. We have patches getting queued up for 4.2 th=
at are
using the "nor-jedec" binding, and I'd like to nip those in the bud ASA=
P.

 .../devicetree/bindings/mtd/{m25p80.txt =3D> jedec,spi-nor.txt}       =
| 6 +++---
 drivers/mtd/devices/m25p80.c                                        | =
6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/mtd/{m25p80.txt =3D> jedec,sp=
i-nor.txt} (85%)

diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documen=
tation/devicetree/bindings/mtd/jedec,spi-nor.txt
similarity index 85%
rename from Documentation/devicetree/bindings/mtd/m25p80.txt
rename to Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index f20b111b502a..2bee68103b01 100644
--- a/Documentation/devicetree/bindings/mtd/m25p80.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -8,8 +8,8 @@ Required properties:
                is not Linux-only, but in case of Linux, see the "m25p_=
ids"
                table in drivers/mtd/devices/m25p80.c for the list of s=
upported
                chips.
-               Must also include "nor-jedec" for any SPI NOR flash tha=
t can be
-               identified by the JEDEC READ ID opcode (0x9F).
+               Must also include "jedec,spi-nor" for any SPI NOR flash=
 that can
+               be identified by the JEDEC READ ID opcode (0x9F).
 - reg : Chip-Select number
 - spi-max-frequency : Maximum frequency of the SPI bus the chip can op=
erate at
=20
@@ -25,7 +25,7 @@ Example:
 	flash: m25p80@0 {
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;
-		compatible =3D "spansion,m25p80", "nor-jedec";
+		compatible =3D "spansion,m25p80", "jedec,spi-nor";
 		reg =3D <0>;
 		spi-max-frequency =3D <40000000>;
 		m25p,fast-read;
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.=
c
index 7c8b1694a134..3d59ebc16b6e 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -223,7 +223,7 @@ static int m25p_probe(struct spi_device *spi)
 	 */
 	if (data && data->type)
 		flash_name =3D data->type;
-	else if (!strcmp(spi->modalias, "nor-jedec"))
+	else if (!strcmp(spi->modalias, "jedec,spi-nor"))
 		flash_name =3D NULL; /* auto-detect */
 	else
 		flash_name =3D spi->modalias;
@@ -255,7 +255,7 @@ static int m25p_remove(struct spi_device *spi)
  * since most of these flash are compatible to some extent, and their
  * differences can often be differentiated by the JEDEC read-ID comman=
d, we
  * encourage new users to add support to the spi-nor library, and simp=
ly bind
- * against a generic string here (e.g., "nor-jedec").
+ * against a generic string here (e.g., "jedec,spi-nor").
  *
  * Many flash names are kept here in this list (as well as in spi-nor.=
c) to
  * keep them available as module aliases for existing platforms.
@@ -305,7 +305,7 @@ static const struct spi_device_id m25p_ids[] =3D {
 	 * Generic support for SPI NOR that can be identified by the JEDEC RE=
AD
 	 * ID opcode (0x9F). Use this, if possible.
 	 */
-	{"nor-jedec"},
+	{"jedec,spi-nor"},
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, m25p_ids);
--=20
1.9.1
