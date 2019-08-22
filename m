From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 04/20] dt-bindings: mrvl,intc: Add a MMP3 interrupt controller
Date: Thu, 22 Aug 2019 11:26:27 +0200
Message-ID: <20190822092643.593488-5-lkundrak@v3.sk>
References: <20190822092643.593488-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822092643.593488-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

Similar to MMP2 one, but has an extra range for the other core. The
muxes stay the same.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- Reformat the compatible property documentation to higlight the valid
  combinations
- Drop an unneeded mmp3-intc example

 .../bindings/interrupt-controller/mrvl,intc.txt    | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mrvl,=
intc.txt b/Documentation/devicetree/bindings/interrupt-controller/mrvl,in=
tc.txt
index 608fee15a4cfc..a0ed02725a9d7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.tx=
t
+++ b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.tx=
t
@@ -1,13 +1,17 @@
 * Marvell MMP Interrupt controller
=20
 Required properties:
-- compatible : Should be "mrvl,mmp-intc", "mrvl,mmp2-intc" or
-  "mrvl,mmp2-mux-intc"
+- compatible : Should be
+               "mrvl,mmp-intc" on Marvel MMP,
+               "mrvl,mmp2-intc" along with "mrvl,mmp2-mux-intc" on MMP2 =
or
+               "marvell,mmp3-intc" with "mrvl,mmp2-mux-intc" on MMP3
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
--=20
2.21.0
