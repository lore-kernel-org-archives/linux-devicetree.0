From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 1/3] dt-bindings: add devicetree bindings for Fairchild FAN53555 regulators
Date: Tue, 16 Sep 2014 21:22:52 +0200
Message-ID: <1410895374-18367-2-git-send-email-heiko@sntech.de>
References: <1410895374-18367-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410895374-18367-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the regulator and add a fairchild vendor-prefix.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 .../devicetree/bindings/regulator/fan53555.txt     | 23 ++++++++++++++=
++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/fan5355=
5.txt

diff --git a/Documentation/devicetree/bindings/regulator/fan53555.txt b=
/Documentation/devicetree/bindings/regulator/fan53555.txt
new file mode 100644
index 0000000..8a51924
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/fan53555.txt
@@ -0,0 +1,23 @@
+Binding for Fairchild FAN53555 regulators
+
+Required properties:
+  - compatible: "fcs,fan53555"
+  - reg: I2C address
+
+Optional properties:
+  - fcs,suspend-voltage-selector: declare which of the two available
+		voltage selector registers should be used for the suspend
+		voltage. The other one is used for the runtime voltage setting
+		Possible values are either <0> or <1>
+  - vin-supply: regulator supplying the vin pin
+
+Example:
+
+	regulator@40 {
+		compatible =3D "fcs,fan53555";
+		regulator-name =3D "fan53555";
+		regulator-min-microvolt =3D <1000000>;
+		regulator-max-microvolt =3D <1800000>;
+		vin-supply =3D <&parent_reg>;
+		fcs,suspend-voltage-selector =3D <1>;
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
index ac7269f..24b92b3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -49,6 +49,7 @@ epson	Seiko Epson Corp.
 est	ESTeem Wireless Modems
 eukrea  Eukr=C3=A9a Electromatique
 excito	Excito
+fcs	Fairchild Semiconductor
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
