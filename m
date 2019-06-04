From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v4 01/13] dt-bindings: media: sunxi-ir: Add A31 compatible
Date: Tue,  4 Jun 2019 18:29:47 +0200
Message-ID: <20190604162959.29199-2-peron.clem@gmail.com>
References: <20190604162959.29199-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604162959.29199-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>, Sean Young <sean@mess.org>
List-Id: devicetree@vger.kernel.org

Allwinner A31 has introduced a new memory mapping and a
reset line.

The difference in memory mapping are :

- In the configure register there is a new sample bit
  and Allwinner has introduced the active threshold feature.

- In the status register a new STAT bit is present.

Note: CGPO and DRQ_EN bits are removed on A31 but present on A13
and on new SoCs like A64/H6.
This is actually not an issue as these bits are togglable and new
SoCs have a dedicated bindings.

Introduce this bindings to make a difference since this generation.
And declare the reset line required since A31.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Sean Young <sean@mess.org>
---
 Documentation/devicetree/bindings/media/sunxi-ir.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/sunxi-ir.txt
index 278098987edb..2e59a32a7e33 100644
--- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
+++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
@@ -1,16 +1,21 @@
 Device-Tree bindings for SUNXI IR controller found in sunXi SoC family
 
 Required properties:
-- compatible	    : "allwinner,sun4i-a10-ir" or "allwinner,sun5i-a13-ir"
+- compatible	    :
+	"allwinner,sun4i-a10-ir"
+	"allwinner,sun5i-a13-ir"
+	"allwinner,sun6i-a31-ir"
 - clocks	    : list of clock specifiers, corresponding to
 		      entries in clock-names property;
 - clock-names	    : should contain "apb" and "ir" entries;
 - interrupts	    : should contain IR IRQ number;
 - reg		    : should contain IO map address for IR.
 
+Required properties since A31:
+- resets	    : phandle + reset specifier pair
+
 Optional properties:
 - linux,rc-map-name: see rc.txt file in the same directory.
-- resets : phandle + reset specifier pair
 - clock-frequency  : IR Receiver clock frequency, in Hertz. Defaults to 8 MHz
 		     if missing.
 
-- 
2.20.1
