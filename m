Return-Path: <SRS0=ntIc=P5=gmail.com=robertshearman@kernel.org>
From: Robert Shearman <robertshearman@gmail.com>
Subject: [PATCH 2/2] dt-bindings: i2c-mux-pca954x: Invert i2c-mux-idle-disconnect property
Date: Mon, 21 Jan 2019 16:47:42 +0000
Message-Id: <20190121164742.35718-2-robertshearman@gmail.com>
In-Reply-To: <20190121164742.35718-1-robertshearman@gmail.com>
References: <20190121164742.35718-1-robertshearman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Robert Shearman <robert.shearman@att.com>
List-ID: <devicetree@vger.kernel.org>

From: Robert Shearman <robert.shearman@att.com>

Update the binding docs for i2c-mux-pca954x to reflect that the driver
now defaults to idle-disconnect behaviour by removing the documentation
of the previous i2c-mux-idle-disconnect property and introducing a new
inverse i2c-mux-no-idle-disconnect property.

Signed-off-by: Robert Shearman <robert.shearman@att.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
index 30ac6a60f041..c3a94de8b3ef 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
@@ -25,9 +25,11 @@ Required Properties:
 Optional Properties:
 
   - reset-gpios: Reference to the GPIO connected to the reset input.
-  - i2c-mux-idle-disconnect: Boolean; if defined, forces mux to disconnect all
-    children in idle state. This is necessary for example, if there are several
-    multiplexers on the bus and the devices behind them use same I2C addresses.
+  - i2c-mux-no-idle-disconnect: Boolean; if defined, asks mux to not
+    disconnect children in idle state. This optimises I2C parent
+    operations and is useful if it is guaranteed that there are no
+    multiplexers on the bus with devices behind them using the same
+    I2C address.
   - interrupts: Interrupt mapping for IRQ.
   - interrupt-controller: Marks the device node as an interrupt controller.
   - #interrupt-cells : Should be two.
-- 
2.20.1
