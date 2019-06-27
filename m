Return-Path: <SRS0=uAkK=U2=opensource.cirrus.com=ckeepax@kernel.org>
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH] clk: lochnagar: Update DT binding doc to include the primary SPDIF MCLK
Date: Thu, 27 Jun 2019 09:55:17 +0100
Message-ID: <20190627085517.17587-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
To: sboyd@kernel.org, mturquette@baylibre.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

This clock was missed when the binding was initially merged but is
supported by the driver, so add it to the binding document.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
index b8d8ef3bdc5f3..52a064c789eec 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
+++ b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
@@ -40,6 +40,7 @@ Optional properties:
        input audio clocks from host system.
      - ln-psia1-mclk, ln-psia2-mclk : Optional input audio clocks from
        external connector.
+     - ln-spdif-mclk : Optional input audio clock from SPDIF.
      - ln-spdif-clkout : Optional input audio clock from SPDIF.
      - ln-adat-mclk : Optional input audio clock from ADAT.
      - ln-pmic-32k : On board fixed clock.
-- 
2.11.0
