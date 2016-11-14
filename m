From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 01/11] ARM: shmobile: Document DT bindings for Product Register
Date: Mon, 14 Nov 2016 19:37:07 +0100
Message-ID: <1479148637-5399-2-git-send-email-geert+renesas@glider.be>
References: <1479148637-5399-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1479148637-5399-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dirk Behme <dirk.behme@de.bosch.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add device tree binding documentation for the Product Register (PRR),
which provides product and revision information on most Renesas ARM
SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
---
v3:
  - Add Acked-by,
  - Drop "renesas,cccr", as the CCCR is not a lone register, but part of
    the HPB/APB block, which will need its own set of bindings,

v2:
  - New.
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index a1e94da0e322c8f4..1be9e8a7e2c43dfc 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -81,3 +81,21 @@ Boards:
     compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
   - Wheat
     compatible = "renesas,wheat", "renesas,r8a7792"
+
+
+Most Renesas ARM SoCs have a Product Register that allows to retrieve SoC
+product and revision information.  If present, a device node for this register
+should be added.
+
+Required properties:
+  - compatible: Must be "renesas,prr".
+  - reg: Base address and length of the register block.
+
+
+Examples
+--------
+
+	prr: chipid@ff000044 {
+		compatible = "renesas,prr";
+		reg = <0 0xff000044 0 4>;
+	};
-- 
1.9.1
