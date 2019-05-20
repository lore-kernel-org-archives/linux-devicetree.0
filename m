From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/5] dt-bindings: pinctrl: Document pinconf bindings for BM1880 SoC
Date: Mon, 20 May 2019 14:01:00 +0530
Message-ID: <20190520083101.10229-5-manivannan.sadhasivam@linaro.org>
References: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520083101.10229-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, linux-gpio@vger.kernel.org, alec.lin@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Document pinconf bindings for Bitmain BM1880 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../pinctrl/bitmain,bm1880-pinctrl.txt        | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
index cc9a89aa4170..4eb089bcb5f3 100644
--- a/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
@@ -14,7 +14,8 @@ phrase "pin configuration node".
 The pin configuration nodes act as a container for an arbitrary number of
 subnodes. Each of these subnodes represents some desired configuration for a
 pin, a group, or a list of pins or groups. This configuration for BM1880 SoC
-includes only pinmux as there is no pinconf support available in SoC.
+includes pinmux and various pin configuration parameters, such as pull-up,
+slew rate etc...
 
 Each configuration node can consist of multiple nodes describing the pinmux
 options. The name of each subnode is not important; all subnodes should be
@@ -84,6 +85,22 @@ Required Properties:
                   gpio66, gpio67, eth1, i2s0, i2s0_mclkin, i2s1, i2s1_mclkin,
                   spi0
 
+Optional Properties:
+
+- bias-disable:  No arguments. Disable pin bias.
+- bias-pull-down: No arguments. The specified pins should be configured as
+                  pull down.
+- bias-pull-up:   No arguments. The specified pins should be configured as
+                  pull up.
+- input-schmitt-enable: No arguments: Enable schmitt trigger for the specified
+                  pins
+- input-schmitt-disable: No arguments: Disable schmitt trigger for the specified
+                  pins
+- slew-rate:      Integer. Sets slew rate for the specified pins.
+                  Valid values are:
+                  <0>  - Slow
+                  <1>  - Fast
+
 Example:
         pinctrl: pinctrl@400 {
                 compatible = "bitmain,bm1880-pinctrl";
-- 
2.17.1
