From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 03/19] dt-bindings: mrvl,intc: Add a MMP3 interrupt controller
Date: Fri,  9 Aug 2019 11:31:42 +0200
Message-ID: <20190809093158.7969-4-lkundrak@v3.sk>
References: <20190809093158.7969-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809093158.7969-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

Similar to MMP2 one, but has an extra range for the other core. The
muxes stay the same.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../interrupt-controller/mrvl,intc.txt        | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mrvl,=
intc.txt b/Documentation/devicetree/bindings/interrupt-controller/mrvl,in=
tc.txt
index 608fee15a4cfc..41c131d026f94 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.tx=
t
+++ b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.tx=
t
@@ -1,13 +1,15 @@
 * Marvell MMP Interrupt controller
=20
 Required properties:
-- compatible : Should be "mrvl,mmp-intc", "mrvl,mmp2-intc" or
-  "mrvl,mmp2-mux-intc"
+- compatible : Should be "mrvl,mmp-intc", "mrvl,mmp2-intc",
+  "marvell,mmp3-intc", "mrvl,mmp2-mux-intc"
 - reg : Address and length of the register set of the interrupt controll=
er.
   If the interrupt controller is intc, address and length means the rang=
e
-  of the whole interrupt controller. If the interrupt controller is mux-=
intc,
-  address and length means one register. Since address of mux-intc is in=
 the
-  range of intc. mux-intc is secondary interrupt controller.
+  of the whole interrupt controller. The "marvell,mmp3-intc" controller
+  also has a secondary range for the second CPU core.  If the interrupt
+  controller is mux-intc, address and length means one register. Since
+  address of mux-intc is in the range of intc. mux-intc is secondary
+  interrupt controller.
 - reg-names : Name of the register set of the interrupt controller. It's
   only required in mux-intc interrupt controller.
 - interrupts : Should be the port interrupt shared by mux interrupts. It=
's
@@ -20,7 +22,7 @@ Required properties:
 - mrvl,clr-mfp-irq : Specifies the interrupt that needs to clear MFP edg=
e
   detection first.
=20
-Example:
+Examples:
 	intc: interrupt-controller@d4282000 {
 		compatible =3D "mrvl,mmp2-intc";
 		interrupt-controller;
@@ -29,6 +31,15 @@ Example:
 		mrvl,intc-nr-irqs =3D <64>;
 	};
=20
+	intc: interrupt-controller@d4282000 {
+		compatible =3D "marvell,mmp3-intc";
+		interrupt-controller;
+		#interrupt-cells =3D <1>;
+		reg =3D <0xd4282000 0x1000>,
+		      <0xd4284000 0x100>;
+		mrvl,intc-nr-irqs =3D <64>;
+	};
+
 	intcmux4@d4282150 {
 		compatible =3D "mrvl,mmp2-mux-intc";
 		interrupts =3D <4>;
--=20
2.21.0
