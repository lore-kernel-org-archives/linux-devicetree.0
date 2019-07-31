From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: arm-boards: Update pointer to ARM CPU bindings
Date: Wed, 31 Jul 2019 13:42:01 +0200
Message-ID: <20190731114201.7884-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The ARM CPU DT bindings were converted from plain text to YAML, but not
all referrers were updated.

Fixes: 672951cbd1b70a9e ("dt-bindings: arm: Convert cpu binding to json-schema")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
v2:
  - Add Acked-by.
---
 Documentation/devicetree/bindings/arm/arm-boards | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arm-boards b/Documentation/devicetree/bindings/arm/arm-boards
index 6758ece324b1c259..b2a9f9f8430bacf4 100644
--- a/Documentation/devicetree/bindings/arm/arm-boards
+++ b/Documentation/devicetree/bindings/arm/arm-boards
@@ -199,7 +199,7 @@ The description for the board must include:
      A detailed description of the bindings used for "psci" nodes is present
      in the psci.yaml file.
    - a "cpus" node describing the available cores and their associated
-     "enable-method"s. For more details see cpus.txt file.
+     "enable-method"s. For more details see cpus.yaml file.
 
 Example:
 
-- 
2.17.1
