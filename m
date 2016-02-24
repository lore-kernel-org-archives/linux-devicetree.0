From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH] dt-bindings: interrupt-controller: add SoC-specific compatible string to Marvell ODMI
Date: Wed, 24 Feb 2016 16:24:54 +0100
Message-ID: <1456327494-31358-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

As requested by Rob Herring, this commit adds a SoC-specific
compatible string to the Marvell ODMI DT binding.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
This commit applies on top of the Marvell ODMI driver patch, which has
already been merged.
---
 .../bindings/interrupt-controller/marvell,odmi-controller.txt      | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.txt
index 252d5c9..8af0a8e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,odmi-controller.txt
@@ -6,7 +6,9 @@ which can be used by on-board peripheral for MSI interrupts.
 
 Required properties:
 
-- compatible           : The value here should contain "marvell,odmi-controller".
+- compatible           : The value here should contain:
+
+    "marvell,ap806-odmi-controller", "marvell,odmi-controller".
 
 - interrupt,controller : Identifies the node as an interrupt controller.
 
@@ -29,7 +31,8 @@ Required properties:
 Example:
 
 	odmi: odmi@300000 {
-		compatible = "marvell,odmi-controller";
+		compatible = "marvell,ap806-odm-controller",
+			     "marvell,odmi-controller";
 		interrupt-controller;
 		msi-controller;
 		marvell,odmi-frames = <4>;
-- 
2.6.4
