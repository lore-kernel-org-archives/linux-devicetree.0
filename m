From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] dt-bindings: marvell,mmp2: fix a typo in bindings doc
Date: Mon,  3 Dec 2018 12:47:48 +0100
Message-ID: <20181203114748.637314-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <trivial@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

A trivial one, but it's annoying that copy & paste of the link
doesn't work.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 Documentation/devicetree/bindings/clock/marvell,mmp2.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/marvell,mmp2.txt b/D=
ocumentation/devicetree/bindings/clock/marvell,mmp2.txt
index af376a01f2b7..b0447d9896bc 100644
--- a/Documentation/devicetree/bindings/clock/marvell,mmp2.txt
+++ b/Documentation/devicetree/bindings/clock/marvell,mmp2.txt
@@ -18,4 +18,4 @@ Required Properties:
 Each clock is assigned an identifier and client nodes use this identifie=
r
 to specify the clock which they consume.
=20
-All these identifier could be found in <dt-bindings/clock/marvell-mmp2.h=
>.
+All these identifier could be found in <dt-bindings/clock/marvell,mmp2.h=
>.
--=20
2.19.1
