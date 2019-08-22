From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 03/20] dt-bindings: arm: mrvl: Document MMP3 compatible string
Date: Thu, 22 Aug 2019 11:26:26 +0200
Message-ID: <20190822092643.593488-4-lkundrak@v3.sk>
References: <20190822092643.593488-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822092643.593488-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

Marvel MMP3 is a successor to MMP2, containing similar peripherals with t=
wo
PJ4B cores.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- Rebased on top of mrvl.txt->mrvl.yaml conversion

 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml b/Docum=
entation/devicetree/bindings/arm/mrvl/mrvl.yaml
index dc9de506ac6e3..b872702f04dc0 100644
--- a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
+++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
@@ -28,4 +28,7 @@ properties:
           - enum:
               - mrvl,mmp2-brownstone
           - const: mrvl,mmp2
+      - description: MMP3 SoC
+        items:
+          - const: mrvl,mmp3
 ...
--=20
2.21.0
