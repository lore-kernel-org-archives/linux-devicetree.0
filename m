From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 3/5] dt-bindings: add devicetree bindings for Fairchild FAN53555 regulators
Date: Sun, 14 Sep 2014 21:23:03 +0200
Message-ID: <1410722585-13393-4-git-send-email-heiko@sntech.de>
References: <1410722585-13393-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410722585-13393-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the regulator and add a fairchild vendor-prefix.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 .../devicetree/bindings/regulator/fan53555.txt     | 25 ++++++++++++++=
++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/fan5355=
5.txt

diff --git a/Documentation/devicetree/bindings/regulator/fan53555.txt b=
/Documentation/devicetree/bindings/regulator/fan53555.txt
new file mode 100644
index 0000000..2484497
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/fan53555.txt
@@ -0,0 +1,25 @@
+Binding for Fairchild FAN53555 regulators
+
+Required properties:
+  - compatible: "fairchild,fan53555"
+  - reg: I2C address
+
+Optional properties:
+  - fairchild,suspend-regulator: regulator number to use for suspend v=
oltages
+		possible values are either <0> or <1>
+  - fairchild,slew-rate-microvolt: slew rate to use for positive volta=
ge
+		transistions in microvolts per us, possible values are:
+		64000, 32000, 16000, 8000, 4000, 2000, 1000, 500
+  - vin-supply: regulator supplying the vin pin
+
+Example:
+
+	regulator@40 {
+		compatible =3D "fairchild,fan53555";
+		regulator-name =3D "fan53555";
+		regulator-min-microvolt =3D <1000000>;
+		regulator-max-microvolt =3D <1800000>;
+		vin-supply =3D <&parent_reg>;
+		fairchild,suspend-regulator =3D <1>;
+		fairchild,slew-rate-microvolt =3D <64000>;
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
index ac7269f..99da41b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -49,6 +49,7 @@ epson	Seiko Epson Corp.
 est	ESTeem Wireless Modems
 eukrea  Eukr=C3=A9a Electromatique
 excito	Excito
+fairchild	Fairchild Semiconductor
 fsl	Freescale Semiconductor
 GEFanuc	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
 gef	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
--=20
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
