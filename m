From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] of: Add vendor prefix for JEDEC Solid State Technology Association
Date: Wed, 20 May 2015 18:07:44 +0200
Message-ID: <1432138064-8121-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Sujit Reddy Thumma <sthumma@codeaurora.org>, Aneesh V <aneesh@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add the "jedec" vendor prefix for the "JEDEC Solid State Technology
Association" (formerly known as the "Joint Electron Device Engineering
Council"), which is already in use in several bindings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index abcd1316b1065b6a..d624de2aa3360da4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -109,6 +109,7 @@ intel	Intel Corporation
 intercontrol	Inter Control Group
 isee	ISEE 2007 S.L.
 isil	Intersil
+jedec	JEDEC Solid State Technology Association
 karo	Ka-Ro electronics GmbH
 keymile	Keymile GmbH
 lacie	LaCie
-- 
1.9.1
