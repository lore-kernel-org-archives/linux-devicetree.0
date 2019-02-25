From: Christian Hohnstaedt <Christian.Hohnstaedt@wago.com>
Subject: [PATCH] dt-bindings: regulator: tps65218: rectify units of LS3
Date: Mon, 25 Feb 2019 08:15:03 +0100
Message-ID: <1551078903-14447-1-git-send-email-Christian.Hohnstaedt@wago.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

LS3 has a selectable current limit.
Change units to microamp in the example.

Signed-off-by: Christian Hohnstaedt <Christian.Hohnstaedt@wago.com>
---
 Documentation/devicetree/bindings/regulator/tps65218.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/tps65218.txt b/Documentation/devicetree/bindings/regulator/tps65218.txt
index b28e9bd..54aded3 100644
--- a/Documentation/devicetree/bindings/regulator/tps65218.txt
+++ b/Documentation/devicetree/bindings/regulator/tps65218.txt
@@ -77,7 +77,7 @@ tps65218: tps65218@24 {
 	};
 
 	ls3: regulator-ls3 {
-		regulator-min-microvolt = <100000>;
-		regulator-max-microvolt = <1000000>;
+		regulator-min-microamp = <100000>;
+		regulator-max-microamp = <1000000>;
 	};
 };
-- 
2.7.4
