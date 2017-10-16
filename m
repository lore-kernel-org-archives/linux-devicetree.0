From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 2/3] dt-bindings: arm: realtek: Document MeLE V9
Date: Mon, 16 Oct 2017 05:01:52 +0200
Message-ID: <20171016030153.11078-3-afaerber@suse.de>
References: <20171016030153.11078-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171016030153.11078-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Bizon <bizongod@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, meleservice@mele.cn, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Define a compatible string for MeLE V9 Media Player.

Cc: meleservice@mele.cn
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 Documentation/devicetree/bindings/arm/realtek.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/realtek.txt b/Documentation/devicetree/bindings/arm/realtek.txt
index 297c15eb81e2..95839e19ae92 100644
--- a/Documentation/devicetree/bindings/arm/realtek.txt
+++ b/Documentation/devicetree/bindings/arm/realtek.txt
@@ -12,6 +12,7 @@ Required root node properties:
 
 Root node property compatible must contain, depending on board:
 
+ - MeLE V9: "mele,v9"
  - ProBox2 AVA: "probox2,ava"
  - Zidoo X9S: "zidoo,x9s"
 
-- 
2.13.6
