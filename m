From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] dt-bindings: mrvl,intc: fix a trivial typo
Date: Mon,  3 Dec 2018 12:47:10 +0100
Message-ID: <20181203114710.636840-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <trivial@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

s/whold/whole/.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../devicetree/bindings/interrupt-controller/mrvl,intc.txt      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mrvl,=
intc.txt b/Documentation/devicetree/bindings/interrupt-controller/mrvl,in=
tc.txt
index 8b53273cb22f..608fee15a4cf 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.tx=
t
+++ b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.tx=
t
@@ -5,7 +5,7 @@ Required properties:
   "mrvl,mmp2-mux-intc"
 - reg : Address and length of the register set of the interrupt controll=
er.
   If the interrupt controller is intc, address and length means the rang=
e
-  of the whold interrupt controller. If the interrupt controller is mux-=
intc,
+  of the whole interrupt controller. If the interrupt controller is mux-=
intc,
   address and length means one register. Since address of mux-intc is in=
 the
   range of intc. mux-intc is secondary interrupt controller.
 - reg-names : Name of the register set of the interrupt controller. It's
--=20
2.19.1
