From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] dt-bindings: arm: mrvl: amend Browstone compatible string
Date: Sun,  2 Dec 2018 12:40:08 +0100
Message-ID: <20181202114008.2861-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

The Brownstone board is compatible with "mrvl,mmp2". The actual DTS
already contains the string -- add it to the binding doc as well.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 Documentation/devicetree/bindings/arm/mrvl/mrvl.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt b/Docume=
ntation/devicetree/bindings/arm/mrvl/mrvl.txt
index 117d741a2e4f..951687528efb 100644
--- a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
+++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
@@ -11,4 +11,4 @@ Required root node properties:
=20
 MMP2 Brownstone Board
 Required root node properties:
-	- compatible =3D "mrvl,mmp2-brownstone";
+	- compatible =3D "mrvl,mmp2-brownstone", "mrvl,mmp2";
--=20
2.19.1
