From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 1/4] phy: miphy365x: Add Device Tree bindings for the
 MiPHY365x
Date: Mon, 10 Mar 2014 16:22:54 +0000
Message-ID: <20140310162254.GG13661@lee--X1>
References: <1392377036-12816-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392377036-12816-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mark.rutland@arm.com
Cc: alexandre.torgue@st.com, devicetree@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@st.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

phy: miphy365x: Add Device Tree bindings for the MiPHY365x

The MiPHY365x is a Generic PHY which can serve various SATA or PCIe
devices. It has 2 ports which it can use for either; both SATA, both
PCIe or one of each in any configuration.

Cc: devicetree@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>

diff --git a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt b/=
Documentation/devicetree/bindings/phy/phy-miphy365x.txt
new file mode 100644
index 0000000..15d105a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
@@ -0,0 +1,62 @@
+STMicroelectronics STi MIPHY365x PHY binding
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+This binding describes a miphy device that is used to control PHY hard=
ware
+for SATA and PCIe.
+
+Required properties:
+- compatible :	Should be "st,miphy365x-phy"
+- #phy-cells :	Should be 2 (See second example)
+		First cell is the port number from:
+			- MIPHY_PORT_0
+			- MIPHY_PORT_1
+		Second cell is device type from:
+			- MIPHY_TYPE_SATA
+			- MIPHY_TYPE_PCI
+- reg       :	Address and length of register sets for each device in
+		"reg-names"
+- reg-names : 	The names of the register addresses corresponding to th=
e
+		registers filled in "reg", from:
+			- sata0: For SATA port 0 registers
+			- sata1: For SATA port 1 registers
+			- pcie0: For PCIE port 0 registers
+			- pcie1: For PCIE port 1 registers
+- st,syscfg : 	Should be a phandle of the system configuration registe=
r group
+		which contain the SATA, PCIe mode setting bits
+
+Optional properties:
+- st,sata-gen	     :	Generation of locally attached SATA IP. Expected =
values
+			are {1,2,3). If not supplied generation 1 hardware will
+			be expected
+- st,pcie-tx-pol-inv :	Bool property to invert the polarity PCIe Tx (T=
xn/Txp)
+- st,sata-tx-pol-inv :	Bool property to invert the polarity SATA Tx (T=
xn/Txp)
+
+Example:
+
+	miphy365x_phy: miphy365x@0 {
+		compatible =3D "st,miphy365x-phy";
+		#phy-cells =3D <2>;
+		reg =3D	<0xfe382000 0x100>,
+			<0xfe38a000 0x100>,
+			<0xfe394000 0x100>,
+			<0xfe804000 0x100>;
+		reg-names =3D "sata0", "sata1", "pcie0", "pcie1";
+		st,syscfg =3D <&syscfg_rear>;
+	};
+
+Specifying phy control of devices
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Device nodes should specify the configuration required in their "phys"
+property, containing a phandle to the miphy device node, a port number
+and a device type.
+
+Example:
+
+#include <dt-bindings/phy/phy-miphy365x.h>
+
+	sata0: sata@fe380000 {
+		...
+		phys	  =3D <&miphy365x_phy MIPHY_PORT_0 MIPHY_TYPE_SATA>;
+		...
+	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
