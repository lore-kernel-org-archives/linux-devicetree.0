From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v2 3/7] mfd: dt bindings: add BD71847 device-tree binding
 documentation
Date: Wed, 12 Sep 2018 14:49:18 +0300
Message-ID: <8800d9c24dd98669c6ecf2270355be528901e685.1536750863.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1536750863.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1536750863.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Add ROHM BD71847 Power Management IC MFD binding information to
device-tree binding documents.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 .../devicetree/bindings/mfd/rohm,bd71837-pmic.txt       | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
index 3ca56fdb5ffe..a4b056761eaa 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
@@ -1,16 +1,17 @@
-* ROHM BD71837 Power Management Integrated Circuit bindings
+* ROHM BD71837 and BD71847 Power Management Integrated Circuit bindings
 
-BD71837MWV is a programmable Power Management IC for powering single-core,
-dual-core, and quad-core SoCs such as NXP-i.MX 8M. It is optimized for
-low BOM cost and compact solution footprint. It integrates 8 Buck
-egulators and 7 LDOs to provide all the power rails required by the SoC and
-the commonly used peripherals.
+BD71837MWV and BD71847MWV are programmable Power Management ICs for powering
+single-core, dual-core, and quad-core SoCs such as NXP-i.MX 8M. They are
+optimized for low BOM cost and compact solution footprint. BD71837MWV
+integrates 8 Buck regulators and 7 LDOs. BD71847MWV contains 6 Buck regulators
+and 6 LDOs.
 
-Datasheet for PMIC is available at:
+Datasheet for BD71837 is available at:
 https://www.rohm.com/datasheet/BD71837MWV/bd71837mwv-e
 
 Required properties:
- - compatible		: Should be "rohm,bd71837".
+ - compatible		: Should be "rohm,bd71837" for bd71837
+				    "rohm,bd71847" for bd71847.
  - reg			: I2C slave address.
  - interrupt-parent	: Phandle to the parent interrupt controller.
  - interrupts		: The interrupt line the device is connected to.
-- 
2.14.3
