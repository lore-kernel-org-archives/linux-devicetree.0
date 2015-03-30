From: =?UTF-8?q?Vianney=20le=20Cl=C3=A9ment=20de=20Saint-Marcq?=
	<vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>
Subject: [PATCH v3 2/5] iio: mlx90614: Add devicetree bindings documentation
Date: Mon, 30 Mar 2015 10:34:59 +0200
Message-ID: <1427704502-22347-3-git-send-email-vianney.leclement@essensium.com>
References: <1427704502-22347-1-git-send-email-vianney.leclement@essensium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427704502-22347-1-git-send-email-vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Vianney=20le=20Cl=C3=A9ment=20de=20Saint-Marcq?= <vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>, "Arnout Vandecappelle (Essensium/Mind)" <arnout-agwphqFHkxc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Also introduce "melexis" as a vendor prefix for device tree bindings.

Signed-off-by: Vianney le Cl=C3=A9ment de Saint-Marcq <vianney.leclemen=
t@essensium.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout-agwphqFHkxc@public.gmane.org>

---

v3: new patch split out from v2 patch 6 (power management)
---
 .../devicetree/bindings/iio/temperature/mlx90614.txt      | 15 +++++++=
++++++++
 Documentation/devicetree/bindings/vendor-prefixes.txt     |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/m=
lx90614.txt

diff --git a/Documentation/devicetree/bindings/iio/temperature/mlx90614=
=2Etxt b/Documentation/devicetree/bindings/iio/temperature/mlx90614.txt
new file mode 100644
index 0000000..4c959f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/temperature/mlx90614.txt
@@ -0,0 +1,15 @@
+* Melexis MLX90614 contactless IR temperature sensor
+
+http://melexis.com/Infrared-Thermometer-Sensors/Infrared-Thermometer-S=
ensors/MLX90614-615.aspx
+
+Required properties:
+
+  - compatible: should be "melexis,mlx90614"
+  - reg: the I2C address of the sensor
+
+Example:
+
+mlx90614@5a {
+	compatible =3D "melexis,mlx90614";
+	reg =3D <0x5a>;
+};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
index fae26d0..c8db30c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -110,6 +110,7 @@ lltc	Linear Technology Corporation
 marvell	Marvell Technology Group Ltd.
 maxim	Maxim Integrated Products
 mediatek	MediaTek Inc.
+melexis	Melexis N.V.
 merrii	Merrii Technology Co., Ltd.
 micrel	Micrel Inc.
 microchip	Microchip Technology Inc.
--=20
2.3.4
