From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v8 08/11] ARM: brcmstb: gic: add compatible string for Broadcom Brahma15
Date: Mon, 21 Jul 2014 14:08:03 -0700
Message-ID: <1405976886-27807-9-git-send-email-computersforpeace@gmail.com>
References: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Matt Porter <mporter@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Marc Carino <marc.ceeeee@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Marc Carino <marc.ceeeee@gmail.com>

Document the Broadcom Brahma B15 GIC implementation as compatible
with the ARM GIC standard.

Signed-off-by: Marc Carino <marc.ceeeee@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 Documentation/devicetree/bindings/arm/gic.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Documentation/devicetree/bindings/arm/gic.txt
index 5573c08d3180..c7d2fa156678 100644
--- a/Documentation/devicetree/bindings/arm/gic.txt
+++ b/Documentation/devicetree/bindings/arm/gic.txt
@@ -16,6 +16,7 @@ Main node required properties:
 	"arm,cortex-a9-gic"
 	"arm,cortex-a7-gic"
 	"arm,arm11mp-gic"
+	"brcm,brahma-b15-gic"
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Specifies the number of cells needed to encode an
   interrupt source.  The type shall be a <u32> and the value shall be 3.
-- 
1.9.1
