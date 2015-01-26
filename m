From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH 2/2] ARM: zynq: DT: Add pinctrl information to USB nodes
Date: Mon, 26 Jan 2015 11:49:56 -0800
Message-ID: <1422301796-22888-2-git-send-email-soren.brinkmann@xilinx.com>
References: <1422301796-22888-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422301796-22888-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
Hi Michal,

This could be squashed into 1643b31658c4 'ARM: zynq: DT: Add USB to
device tree' if you decide to rebuild the zynq/dt branch.

	S=C3=B6ren
---
 arch/arm/boot/dts/zynq-zc702.dts | 26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/zynq-zc706.dts | 26 ++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-=
zc702.dts
index 4f8835be4874..483f69ba2cf5 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -312,6 +312,30 @@
 			bias-disable;
 		};
 	};
+
+	pinctrl_usb0_default: usb0-default {
+		mux {
+			groups =3D "usb0_0_grp";
+			function =3D "usb0";
+		};
+
+		conf {
+			groups =3D "usb0_0_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+
+		conf-rx {
+			pins =3D "MIO29", "MIO31", "MIO36";
+			bias-high-impedance;
+		};
+
+		conf-tx {
+			pins =3D "MIO28", "MIO30", "MIO32", "MIO33", "MIO34",
+			       "MIO35", "MIO37", "MIO38", "MIO39";
+			bias-disable;
+		};
+	};
 };
=20
 &sdhci0 {
@@ -330,4 +354,6 @@
 	status =3D "okay";
 	dr_mode =3D "host";
 	usb-phy =3D <&usb_phy0>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usb0_default>;
 };
diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-=
zc706.dts
index 6979ce23175f..3a6260998116 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -261,6 +261,30 @@
 			bias-disable;
 		};
 	};
+
+	pinctrl_usb0_default: usb0-default {
+		mux {
+			groups =3D "usb0_0_grp";
+			function =3D "usb0";
+		};
+
+		conf {
+			groups =3D "usb0_0_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+
+		conf-rx {
+			pins =3D "MIO29", "MIO31", "MIO36";
+			bias-high-impedance;
+		};
+
+		conf-tx {
+			pins =3D "MIO28", "MIO30", "MIO32", "MIO33", "MIO34",
+			       "MIO35", "MIO37", "MIO38", "MIO39";
+			bias-disable;
+		};
+	};
 };
=20
 &sdhci0 {
@@ -279,4 +303,6 @@
 	status =3D "okay";
 	dr_mode =3D "host";
 	usb-phy =3D <&usb_phy0>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usb0_default>;
 };
--=20
2.2.2.1.g63c5777
