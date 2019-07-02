Return-Path: <SRS0=jObF=U7=nxp.com=ping.bai@kernel.org>
From: Jacky Bai <ping.bai@nxp.com>
Subject: [RESEND PATCH 1/3] dt-bindings: power: Add power domain binding for
 i.mx8m family
Date: Tue, 2 Jul 2019 10:03:41 +0000
Message-ID: <20190702100832.29718-2-ping.bai@nxp.com>
References: <20190702100832.29718-1-ping.bai@nxp.com>
In-Reply-To: <20190702100832.29718-1-ping.bai@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5A679ABD1CCC154EAABE4A65791B8EB1@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Add the binding doc of power domain for i.MX8M SOC family.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 .../bindings/power/fsl,imx8m-genpd.txt        | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/fsl,imx8m-genpd=
.txt

diff --git a/Documentation/devicetree/bindings/power/fsl,imx8m-genpd.txt b/=
Documentation/devicetree/bindings/power/fsl,imx8m-genpd.txt
new file mode 100644
index 000000000000..a92a7103de38
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/fsl,imx8m-genpd.txt
@@ -0,0 +1,46 @@
+Device Tree Bindings for Freescale i.MX8M Generic Power Domain
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+The binding for the i.MX8M Generic power Domain[1].
+
+[1] Documentation/devicetree/bindings/power/power_domain.txt
+
+Required properties:
+
+ - compatible: should be of:
+	- "fsl,imx8m-power-domain"
+ - #power-domain-cells: Number of cells in a PM domain Specifier, must be =
0
+ - domain-index: should be the domain index number need to pass to TF-A
+ - domain-name: the name of this pm domain
+
+Optional properties:
+ - clocks: a number of phandles to clocks that need to be enabled during
+   domain power-up sequence to ensure reset propagation into devices
+   located inside this power domain
+ - power-supply: Power supply used to power the domain
+ - parent-domains: the phandle to the parent power domain
+
+example:
+	vpu_g1_pd: vpug1-pd {
+		compatible =3D "fsl,imx8mm-pm-domain";
+		#power-domain-cells =3D <0>;
+		domain-index =3D <6>;
+		domain-name =3D "vpu_g1";
+		parent-domains =3D <&vpumix_pd>;
+		clocks =3D <&clk IMX8MM_CLK_VPU_G1_ROOT>;
+	};
+
+
+Specifying Power domain for IP modules
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+IP cores belonging to a power domain should contain a 'power-domains'
+property that is a phandle for PGC node representing the domain.
+
+Example of a device that is part of the vpu_g1 power domain:
+	vpu_g1: vpu_g1@38300000 {
+		/* ... */
+		interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names =3D "irq_hantro";
+		/* ... */
+		power-domains =3D <&vpu_g1_pd>;
+	};
--=20
2.21.0
