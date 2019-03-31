From: Brian Masney <masneyb@onstation.org>
Subject: 'reg: property has invalid length' with new JSON-schema bindings
Date: Sat, 30 Mar 2019 22:26:53 -0400
Message-ID: <20190331022653.GA8727@basecamp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

I'm finishing up a patch series that adds device tree support for a
backlight driver and I made the bindings use the new JSON schema. I'm
running into a problem with the reg property in the examples and I can
reproduce the issue by adding an example to the trivial bindings:

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml
b/Documentation/devicetree/bindings/trivial-devices.yaml
index d79fb22bde39..bdab6a015db4 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -341,4 +341,10 @@ required:
   - compatible
   - reg
 
+examples:
+  - |
+    isl29028@38 {
+        compatible = "isil,isl29028";
+        reg = <0x38>;
+    };
 ...

'make dt_binding_check' fails with the following error:

  Documentation/devicetree/bindings/trivial-devices.example.dts:11.5-18:
    Warning (reg_format): /isl29028@38:reg: property has invalid length
    (4 bytes) (#address-cells == 1, #size-cells == 1)
  ...
  Documentation/devicetree/bindings/trivial-devices.example.dtb:
    Warning (i2c_bus_reg): Failed prerequisite 'reg_format'

I see that dt-extract-example hard codes those two cell values to 1:
https://github.com/robherring/yaml-bindings/blob/master/tools/dt-extract-example

The I2C buses for my board (qcom-msm8974) sets #size-cells to 0. Do you
have any suggestions for how I can correct this issue? I can make the
binding check happy by adding a length (reg = <0x38 0x4>;) but I assume
that we shouldn't do that for I2C addresses like this.

Brian
