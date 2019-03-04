From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 4/5] dt-bindings: display: armada: Add more compatible strings
Date: Mon,  4 Mar 2019 21:20:05 +0100
Message-ID: <20190304202006.3863-5-lkundrak@v3.sk>
References: <20190304202006.3863-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304202006.3863-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

There's a generic compatible string and the driver will work on a MMP2 as
well, using the same binding.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- Added marvell,armada-lcdc compatible string.

 .../devicetree/bindings/display/marvell,armada-lcdc.txt       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/marvell,armada-lcd=
c.txt b/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
index 2606a8efc956..4ef66bc2845c 100644
--- a/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
+++ b/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
@@ -3,7 +3,9 @@ Marvell Armada LCD controller
=20
 Required properties:
=20
- - compatible: value should be "marvell,dove-lcd".
+ - compatible: value should be "marvell,armada-lcdc" along with
+   "marvell,dove-lcd" or "marvell,mmp2-lcd", depending on the
+   exact SoC model.
  - reg: base address and size of the LCD controller
  - interrupts: single interrupt number for the LCD controller
=20
--=20
2.20.1
