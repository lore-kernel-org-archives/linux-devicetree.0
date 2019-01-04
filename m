From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2] dt-bindings: marvell,mmp2: fix typos in bindings doc
Date: Fri,  4 Jan 2019 22:56:56 +0100
Message-ID: <20190104215656.23002-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jiri Kosina <trivial@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

A pair of rather trivial ones.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- s/identifier/identifiers/ as suggested by Rob Herring

 Documentation/devicetree/bindings/clock/marvell,mmp2.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/marvell,mmp2.txt b/D=
ocumentation/devicetree/bindings/clock/marvell,mmp2.txt
index af376a01f2b7..23b52dc02266 100644
--- a/Documentation/devicetree/bindings/clock/marvell,mmp2.txt
+++ b/Documentation/devicetree/bindings/clock/marvell,mmp2.txt
@@ -18,4 +18,4 @@ Required Properties:
 Each clock is assigned an identifier and client nodes use this identifie=
r
 to specify the clock which they consume.
=20
-All these identifier could be found in <dt-bindings/clock/marvell-mmp2.h=
>.
+All these identifiers could be found in <dt-bindings/clock/marvell,mmp2.=
h>.
--=20
2.19.2
