From: Richard Genoud <richard.genoud@gmail.com>
Subject: [PATCH 2/2] dt-bindings: display: atmel: Fix path to atmel-hlcdc.txt
Date: Fri,  3 Mar 2017 15:41:47 +0100
Message-ID: <20170303144147.22246-2-richard.genoud@gmail.com>
References: <20170303144147.22246-1-richard.genoud@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170303144147.22246-1-richard.genoud@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>
List-Id: devicetree@vger.kernel.org

The relative path pointed to
Documentation/devicetree/bindings/display/mfd/atmel-hlcdc.txt
instead of
Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
index ebc1a914bda3..ec94468b35be 100644
--- a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
+++ b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
@@ -1,7 +1,7 @@
 Device-Tree bindings for Atmel's HLCDC (High LCD Controller) DRM driver
 
 The Atmel HLCDC Display Controller is subdevice of the HLCDC MFD device.
-See ../mfd/atmel-hlcdc.txt for more details.
+See ../../mfd/atmel-hlcdc.txt for more details.
 
 Required properties:
  - compatible: value should be "atmel,hlcdc-display-controller"
