Return-Path: <SRS0=1q56=IX=googlemail.com=chf.fritz@kernel.org>
Message-ID: <1528190809.2527.5.camel@googlemail.com>
Subject: [PATCH v2] dt-bindings: mfd: fix documentation of tps65911
From: Christoph Fritz <chf.fritz@googlemail.com>
Reply-To: chf.fritz@googlemail.com
Date: Tue, 05 Jun 2018 11:26:49 +0200
In-Reply-To: <20180605070457.GF21163@dell>
References: <1528146863.2818.23.camel@googlemail.com>
	 <20180605070457.GF21163@dell>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, devicetree <devicetree@vger.kernel.org>, linux-omap@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch fixes documentation of tps65911 because its list of
compatible regulators contains wrongly vdd3 instead of vdd2.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 Documentation/devicetree/bindings/mfd/tps65910.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/tps65910.txt b/Documentation/devicetree/bindings/mfd/tps65910.txt
index 8af1202..4f62143 100644
--- a/Documentation/devicetree/bindings/mfd/tps65910.txt
+++ b/Documentation/devicetree/bindings/mfd/tps65910.txt
@@ -22,7 +22,7 @@ Required properties:
   The valid regulator-compatible values are:
   tps65910: vrtc, vio, vdd1, vdd2, vdd3, vdig1, vdig2, vpll, vdac, vaux1,
             vaux2, vaux33, vmmc, vbb
-  tps65911: vrtc, vio, vdd1, vdd3, vddctrl, ldo1, ldo2, ldo3, ldo4, ldo5,
+  tps65911: vrtc, vio, vdd1, vdd2, vddctrl, ldo1, ldo2, ldo3, ldo4, ldo5,
             ldo6, ldo7, ldo8
 
 - xxx-supply: Input voltage supply regulator.
-- 
2.1.4
