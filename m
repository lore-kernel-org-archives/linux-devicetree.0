From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart@free-electrons.com>
Subject: [PATCH 4/5] Documentation: add the Marvell Berlin pinctrl documentation
Date: Thu, 10 Apr 2014 14:47:42 +0200
Message-ID: <1397134063-10503-5-git-send-email-antoine.tenart@free-electrons.com>
References: <1397134063-10503-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397134063-10503-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, alexandre.belloni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@list.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
---
 .../bindings/pinctrl/marvell,berlin-pinctrl.txt    | 43 ++++++++++++++=
++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,b=
erlin-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,berlin-p=
inctrl.txt b/Documentation/devicetree/bindings/pinctrl/marvell,berlin-p=
inctrl.txt
new file mode 100644
index 000000000000..e21538a37734
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,berlin-pinctrl.=
txt
@@ -0,0 +1,43 @@
+* Pinctrl driver for the Marvell Berlin SoCs
+
+The pins controlled by the Marvell Berlin controller are organized in =
groups.
+Configuration is done by group, so no actual pin information is needed=
=2E
+
+Required properties:
+- compatible:	"marvell-berlin2cd-pinctrl",
+		"marvell-berlin2-pinctrl",
+		"marvell-berlin2q-pinctrl"
+- reg: registers physical addresses and lengths of the pin controller.
+- reg-names: name of the register regions.
+
+Please refer to pinctrl-bindings.txt in this directory for details of =
the
+common pinctrl bindings used by client devices.
+
+A pinctrl should contains subnodes representing the pinctrl pin group
+configurations, one per group. Each subnode has the group name and the=
 muxing
+function used.
+
+Required subnode-properties:
+- berlin,group: a string describing the group's name.
+- berlin,function: the function used to mux the group.
+	0: function 0
+	1: function 1
+	...
+
+Example:
+
+pinctrl: pinctrl@0 {
+	compatible =3D "marvell,berlin2q-pinctrl";
+	reg =3D <0xea0000 0x08>, <0xfc0000 0x44>;
+	reg-names =3D "global_base", "sm_base";
+
+	uart0_pmux: uart0-pmux {
+		berlin,group =3D "GSM12";
+		berlin,function =3D <0>;
+	};
+}
+
+&uart0 {
+	pinctrl-0 =3D <&uart0_pmux>;
+	pinctrl-names =3D "default";
+};
--=20
1.8.3.2
