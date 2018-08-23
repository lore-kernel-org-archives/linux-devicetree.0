From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 2/4] dt-bindings: clock: ingenic: Explicitly list compatible strings
Date: Thu, 23 Aug 2018 15:17:42 +0200
Message-ID: <20180823131744.744-2-paul@crapouillou.net>
References: <20180823131744.744-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180823131744.744-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

This is better than letting the other developers wondering what are the
supported strings.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    New patch

 Documentation/devicetree/bindings/clock/ingenic,cgu.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.txt b/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
index f8d4134ae409..ba5a442026b7 100644
--- a/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
+++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
@@ -6,8 +6,11 @@ to provide many different clock signals derived from only 2 external source
 clocks.
 
 Required properties:
-- compatible : Should be "ingenic,<soctype>-cgu".
-  For example "ingenic,jz4740-cgu" or "ingenic,jz4780-cgu".
+- compatible : Should be one of:
+  * ingenic,jz4740-cgu
+  * ingenic,jz4725b-cgu
+  * ingenic,jz4770-cgu
+  * ingenic,jz4780-cgu
 - reg : The address & length of the CGU registers.
 - clocks : List of phandle & clock specifiers for clocks external to the CGU.
   Two such external clocks should be specified - first the external crystal
-- 
2.11.0
