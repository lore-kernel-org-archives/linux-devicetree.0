From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 2/4] dt-bindings: add devicetree bindings for Fairchild FAN53555 regulators
Date: Tue, 16 Sep 2014 17:54:02 +0200
Message-ID: <1410882844-10349-3-git-send-email-heiko@sntech.de>
References: <1410882844-10349-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410882844-10349-1-git-send-email-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Document the regulator and add a fairchild vendor-prefix.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
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
index 0000000..4917564
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/fan53555.txt
@@ -0,0 +1,23 @@
+Binding for Fairchild FAN53555 regulators
+
+Required properties:
+  - compatible: "fairchild,fan53555"
+  - reg: I2C address
+
+Optional properties:
+  - fairchild,suspend-voltage-selector: declare which of the two avail=
able
+		voltage selector registers should be used for the suspend
+		voltage. The other one is used for the runtime voltage setting
+		Possible values are either <0> or <1>
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
+		fairchild,suspend-voltage-selector =3D <1>;
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
