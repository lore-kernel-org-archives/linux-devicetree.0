From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 1/2] dt-bindings: clk: Introduce 'protected-clocks' property
Date: Mon,  5 Nov 2018 11:40:10 -0800
Message-ID: <20181105194011.43770-2-swboyd@chromium.org>
References: <20181105194011.43770-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105194011.43770-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add a generic clk property for clks which are not intended to be used by
the OS due to security restrictions put in place by firmware. For
example, on some Qualcomm firmwares reading or writing certain clk
registers causes the entire system to reboot, but on other firmwares
reading and writing those same registers is required to make devices
like QSPI work. Rather than adding one-off properties each time a new
set of clks appears to be protected, let's add a generic clk property to
describe any set of clks that shouldn't be touched by the OS. This way
we never need to register the clks or use them in certain firmware
configurations.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../devicetree/bindings/clock/clock-bindings.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index 2ec489eebe72..b646bbcf7f92 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -168,3 +168,19 @@ a shared clock is forbidden.
 
 Configuration of common clocks, which affect multiple consumer devices can
 be similarly specified in the clock provider node.
+
+==Protected clocks==
+
+Some platforms or firmwares may not fully expose all the clocks to the OS, such
+as in situations where those clks are used by drivers running in ARM secure
+execution levels. Such a configuration can be specified in device tree with the
+protected-clocks property in the form of a clock specifier list. This property should
+only be specified in the node that is providing the clocks being protected:
+
+   clock-controller@a000f000 {
+        compatible = "vendor,clk95;
+        reg = <0xa000f000 0x1000>
+        #clocks-cells = <1>;
+        ...
+        protected-clocks = <UART3_CLK>, <SPI5_CLK>;
+   };
-- 
Sent by a computer through tubes
