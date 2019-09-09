From: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 5/6] dt-bindings: arm: amlogic: update libretech-cc compatible
Date: Mon,  9 Sep 2019 19:01:26 +0400
Message-ID: <1568041287-7805-6-git-send-email-christianshewitt@gmail.com>
References: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>
List-Id: devicetree@vger.kernel.org

Update the compatible for the Libre Computer aml-s905x-cc to be more
descriptive using the format introduced with the aml-s805x-ac board.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 325c6fd..b3c9dbb 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -95,7 +95,7 @@ properties:
               - amlogic,p212
               - hwacom,amazetv
               - khadas,vim
-              - libretech,cc
+              - libretech,aml-s905x-cc
               - nexbox,a95x
               - seirobotics,sei510
           - const: amlogic,s905x
-- 
2.7.4
