From: Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2] dt-bindings: iio: avia-hx711: Fix avdd-supply typo in example
Date: Tue, 16 Jul 2019 14:33:23 -0600
Message-ID: <20190716203324.12198-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that examples are validated against the DT schema, a typo in
avia-hx711 example generates a warning:

Documentation/devicetree/bindings/iio/adc/avia-hx711.example.dt.yaml: weight: 'avdd-supply' is a required property

Fix the typo.

Fixes: 5150ec3fe125 ("avia-hx711.yaml: transform DT binding to YAML")
Cc: Andreas Klinger <ak@it-klinger.de>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Jonathan,

I have some other fixes I'm sending to Linus and can take these 2 if 
that's easier.

Rob

 Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 8a4100ceeaf2..d76ece97c76c 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -61,6 +61,6 @@ examples:
         compatible = "avia,hx711";
         sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
         dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
-        avdd-suppy = <&avdd>;
+        avdd-supply = <&avdd>;
         clock-frequency = <100000>;
     };
-- 
2.20.1
