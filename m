From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/2] dt-binding: mtd: physmap: Add example using addr-gpios property
Date: Thu, 28 Mar 2019 17:02:16 +1300
Message-ID: <20190328040217.1895-3-chris.packham@alliedtelesis.co.nz>
References: <20190328040217.1895-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328040217.1895-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: bbrezillon@kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

Add an example showing how to use the addr-gpios property to deal with a
system with limited IO space.

Cc: devicetree@vger.kernel.org
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../devicetree/bindings/mtd/mtd-physmap.txt      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Docu=
mentation/devicetree/bindings/mtd/mtd-physmap.txt
index 7df0dcaccb7d..c69f4f065d23 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
@@ -96,3 +96,19 @@ An example using SRAM:
 		bank-width =3D <2>;
 	};
=20
+An example using gpio-addrs
+
+	flash@20000000 {
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		compatible =3D "cfi-flash", "jedec-flash";
+		reg =3D <0x20000000 0x02000000>;
+		ranges =3D <0 0x00000000 0x02000000
+		          1 0x02000000 0x02000000>;
+		bank-width =3D <2>;
+		addr-gpios =3D <&gpio1 2 GPIO_ACTIVE_HIGH>;
+		partition@0 {
+			label =3D "test-part1";
+			reg =3D <0 0x04000000>;
+		};
+	};
--=20
2.21.0
