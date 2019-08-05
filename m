Return-Path: <SRS0=xLqw=WB=bootlin.com=miquel.raynal@kernel.org>
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/8] dt-bindings: ap806: Document AP807 clock compatible
Date: Mon,  5 Aug 2019 12:03:04 +0200
Message-Id: <20190805100310.29048-3-miquel.raynal@bootlin.com>
In-Reply-To: <20190805100310.29048-1-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Marcin Wojtas <mw@semihalf.com>, Stefan Chulski <stefanc@marvell.com>, Yan Markman <ymarkman@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Add AP807 clock compatible to the bindings.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/arm/marvell/ap806-system-controller.txt      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
index 59b6b992fbc9..26410fbb85be 100644
--- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
@@ -18,8 +18,8 @@ Clocks:
 -------
 
 
-The Device Tree node representing the AP806 system controller provides
-a number of clocks:
+The Device Tree node representing the AP806/AP807 system controller
+provides a number of clocks:
 
  - 0: reference clock of CPU cluster 0
  - 1: reference clock of CPU cluster 1
@@ -28,7 +28,9 @@ a number of clocks:
 
 Required properties:
 
- - compatible: must be: "marvell,ap806-clock"
+ - compatible: must be one of:
+   * "marvell,ap806-clock"
+   * "marvell,ap807-clock"
  - #clock-cells: must be set to 1
 
 Pinctrl:
-- 
2.20.1
