From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec" binding
Date: Wed, 11 Mar 2015 14:57:25 -0700
Message-ID: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Almost all flash that are "compatible" with m25p80 support the JEDEC
READ ID opcode (0x95), and in fact, that is often the only thing that i=
s
used to differentiate them. Let's add a compatible string that
represents this lowest common denominator of compatibility.

Device trees can still specify manufacturer/device names in addition,
but (until some reason is found to differentiate between them through
device tree) software will likely want to bind just against the generic
name, and avoid unnecessarily growing its device ID binding tables.

This is related to the work of commit a5b7616c55e1 ("mtd:
m25p80,spi-nor: Fix module aliases for m25p80"), which showed that
maintaining these device tables as stable device-tree/modalias binding
tables is not a worthwhile burden for mostly-comptatible flash.

At the same time, let's update the binding doc to point to the
m25p_ids[] ID list instead of spi_nor_ids[]. The former can be used for
device tree bindings, but the latter cannot. In the future, we should
pare down the m25p_ids[] list to only those IDs which are actually used
in device trees.

Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/m25p80.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documen=
tation/devicetree/bindings/mtd/m25p80.txt
index 4611aa83531b..1b2997d4cee4 100644
--- a/Documentation/devicetree/bindings/mtd/m25p80.txt
+++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
@@ -3,9 +3,12 @@
 Required properties:
 - #address-cells, #size-cells : Must be present if the device has sub-=
nodes
   representing partitions.
-- compatible : Should be the manufacturer and the name of the chip. Be=
ar in mind
+- compatible : Should be "nor-jedec" for any SPI NOR flash that can be
+               identified by the JEDEC READ ID opcode (0x95).
+               Additionally, may include a device-specific string cons=
isting of
+               the manufacturer and name of the chip. Bear in mind
                the DT binding is not Linux-only, but in case of Linux,=
 see the
-               "spi_nor_ids" table in drivers/mtd/spi-nor/spi-nor.c fo=
r the list
+               "m25p_ids" table in drivers/mtd/devices/m25p80.c for th=
e list
                of supported chips.
 - reg : Chip-Select number
 - spi-max-frequency : Maximum frequency of the SPI bus the chip can op=
erate at
@@ -22,7 +25,7 @@ Example:
 	flash: m25p80@0 {
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;
-		compatible =3D "spansion,m25p80";
+		compatible =3D "spansion,m25p80", "nor-jedec";
 		reg =3D <0>;
 		spi-max-frequency =3D <40000000>;
 		m25p,fast-read;
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
