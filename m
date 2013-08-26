From: Lars Poeschel <larsi@wh2.tu-dresden.de>
Subject: [PATCH V2 2/2] of: add vendor prefix for Microchip Technology Inc
Date: Mon, 26 Aug 2013 11:46:25 +0200
Message-ID: <1377510385-8149-2-git-send-email-larsi@wh2.tu-dresden.de>
References: <1377510385-8149-1-git-send-email-larsi@wh2.tu-dresden.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1377510385-8149-1-git-send-email-larsi@wh2.tu-dresden.de>
Sender: linux-gpio-owner@vger.kernel.org
To: poeschel@lemonage.de, grant.likely@linaro.org, linus.walleij@linaro.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, rob@landley.net, arnd@arndb.de, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Lars Poeschel <poeschel@lemonage.de>

Trivial patch to add Microchip Technology Inc. to the list
of devicetree vendor prefixes.

Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 366ce9b..4cdfbe8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -36,6 +36,7 @@ linux	Linux-specific binding
 lsi	LSI Corp. (LSI Logic)
 marvell	Marvell Technology Group Ltd.
 maxim	Maxim Integrated Products
+microchip	Microchip Technology Inc.
 mosaixtech	Mosaix Technologies, Inc.
 national	National Semiconductor
 nintendo	Nintendo
-- 
1.7.10.4

