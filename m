From: Aleix Roca Nonell <kernelrocks@gmail.com>
Subject: [PATCH 5/6] dt-bindings: arm: Document RTD1296
Date: Sun, 7 Jul 2019 15:23:39 +0200
Message-ID: <20190707132339.GF13340@arks.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add bindings for Relatek RTD1296 SoC. And the Bannana Pi BPI-W2 board.

Signed-off-by: Aleix Roca Nonell <kernelrocks@gmail.com>
---
 Documentation/devicetree/bindings/arm/realtek.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/realtek.txt b/Documentation/devicetree/bindings/arm/realtek.txt
index 95839e19ae92..78da1004d38c 100644
--- a/Documentation/devicetree/bindings/arm/realtek.txt
+++ b/Documentation/devicetree/bindings/arm/realtek.txt
@@ -20,3 +20,16 @@ Root node property compatible must contain, depending on board:
 Example:
 
     compatible = "zidoo,x9s", "realtek,rtd1295";
+
+
+RTD1296 SoC
+===========
+
+Required root node properties:
+
+ - compatible :  must contain "realtek,rtd1296"
+
+
+Root node property compatible must contain, depending on board:
+
+ - Bannana Pi BPI-W2: "bananapi,bpi-w2"
-- 
2.21.0
