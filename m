From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 02/19] dt-bindings: arm: mrvl: Document MMP3 compatible string
Date: Fri,  9 Aug 2019 11:31:41 +0200
Message-ID: <20190809093158.7969-3-lkundrak@v3.sk>
References: <20190809093158.7969-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809093158.7969-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

Marvel MMP3 is a successor to MMP2, containing similar peripherals with t=
wo
PJ4B cores.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 Documentation/devicetree/bindings/arm/mrvl/mrvl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt b/Docume=
ntation/devicetree/bindings/arm/mrvl/mrvl.txt
index 951687528efb0..66e1e1414245b 100644
--- a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
+++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
@@ -12,3 +12,7 @@ Required root node properties:
 MMP2 Brownstone Board
 Required root node properties:
 	- compatible =3D "mrvl,mmp2-brownstone", "mrvl,mmp2";
+
+MMP3 SoC
+Required root node properties:
+	- compatible =3D "marvell,mmp3";
--=20
2.21.0
