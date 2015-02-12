From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 3/5] ARM: dts: zynq: Add LED for Parallella
Date: Thu, 12 Feb 2015 01:55:11 +0100
Message-ID: <1423702513-4032-4-git-send-email-afaerber@suse.de>
References: <1423702513-4032-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423702513-4032-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Olof Johansson <olof@lixom.net>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, linux-arm-kernel@lists.infradead.org, Andreas Olofsson <andreas@adapteva.com>, Ola Jeppsson <ola@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This is the green LED CR10.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm/boot/dts/zynq-parallella1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-parallella1.dtsi b/arch/arm/boot/dt=
s/zynq-parallella1.dtsi
index e77a4968fe17..8b2895c06c8e 100644
--- a/arch/arm/boot/dts/zynq-parallella1.dtsi
+++ b/arch/arm/boot/dts/zynq-parallella1.dtsi
@@ -18,6 +18,7 @@
  * GNU General Public License for more details.
  */
 /include/ "zynq-7000.dtsi"
+#include <dt-bindings/gpio/gpio.h>
=20
 / {
 	compatible =3D "adapteva,parallella", "xlnx,zynq-7000";
@@ -36,6 +37,16 @@
 		bootargs =3D "console=3DttyPS0,115200 earlyprintk root=3D/dev/mmcblk=
0p2 rootfstype=3Dext4 rw rootwait";
 		linux,stdout-path =3D "/amba/serial@e0001000";
 	};
+
+	leds {
+		compatible =3D "gpio-leds";
+
+		cr10 {
+			label =3D "parallella:cr10:usr";
+			gpios =3D <&gpio0 7 GPIO_ACTIVE_HIGH>;
+			default-state =3D "on";
+		};
+	};
 };
=20
 &clkc {
--=20
2.2.2
