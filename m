From: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2,2/3] dt-bindings: arm: amlogic: Add support for the Ugoos AM6
Date: Sat, 24 Aug 2019 12:04:09 +0400
Message-ID: <1566633850-9421-3-git-send-email-christianshewitt@gmail.com>
References: <1566633850-9421-1-git-send-email-christianshewitt@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566633850-9421-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>, Oleg Ivanov <balbes-150@yandex.ru>
List-Id: devicetree@vger.kernel.org

The Ugoos AM6 is based on the Amlogic W400 (G12B) reference design using the
S922X chipset.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 325c6fd..2ded61d 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -139,6 +139,7 @@ properties:
         items:
           - enum:
               - hardkernel,odroid-n2
+              - ugoos,am6
           - const: amlogic,g12b
 
 ...
-- 
2.7.4
