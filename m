From: Lars Poeschel <larsi@wh2.tu-dresden.de>
Subject: [PATCH V3 2/2] of: add vendor prefix for Microchip Technology Inc
Date: Wed, 28 Aug 2013 10:38:51 +0200
Message-ID: <1377679131-32082-2-git-send-email-larsi@wh2.tu-dresden.de>
References: <1377679131-32082-1-git-send-email-larsi@wh2.tu-dresden.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377679131-32082-1-git-send-email-larsi@wh2.tu-dresden.de>
Sender: linux-kernel-owner@vger.kernel.org
To: poeschel@lemonage.de, grant.likely@linaro.org, linus.walleij@linaro.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, rob@landley.net, arnd@arndb.de, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Lars Poeschel <poeschel@lemonage.de>

Trivial patch to add Microchip Technology Inc. to the list
of devicetree vendor prefixes.

Acked-by: Mark Rutland <mark.rutland@arm.com>
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
