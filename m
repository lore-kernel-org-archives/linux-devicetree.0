From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v4 4/5] dt-bindings: display: armada: Add more compatible strings
Date: Wed, 28 Aug 2019 09:59:37 +0200
Message-ID: <20190828075938.318028-5-lkundrak@v3.sk>
References: <20190828075938.318028-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828075938.318028-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

There's a generic compatible string and the driver will work on a MMP2 as
well, using the same binding.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Changes since v3:
- Collected Rob's Reviewed-by tag

Changes since v2:
- Order marvell,armada-lcdc after the model-specific strings.

Changes since v1:
- Added marvell,armada-lcdc compatible string.

 .../devicetree/bindings/display/marvell,armada-lcdc.txt        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/marvell,armada-lcd=
c.txt b/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
index 2606a8efc9568..0ea4cbe5a32ee 100644
--- a/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
+++ b/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
@@ -3,7 +3,8 @@ Marvell Armada LCD controller
=20
 Required properties:
=20
- - compatible: value should be "marvell,dove-lcd".
+ - compatible: value should be "marvell,dove-lcd" or "marvell,mmp2-lcd",
+   depending on the exact SoC model, along with "marvell,armada-lcdc"
  - reg: base address and size of the LCD controller
  - interrupts: single interrupt number for the LCD controller
=20
--=20
2.21.0
