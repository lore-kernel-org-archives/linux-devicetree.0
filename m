From: Luis Araneda <luaraneda@gmail.com>
Subject: [PATCH] dt-bindings: Add vendor prefix for AsusTek Computer Inc.
Date: Wed, 27 Jun 2018 16:33:15 -0400
Message-ID: <20180627203315.348-1-luaraneda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jani Nikula <jani.nikula@intel.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Luis Araneda <luaraneda@gmail.com>
List-Id: devicetree@vger.kernel.org

"AsusTek Computer Inc. is a Taiwanese multinational computer
and phone hardware and electronics company headquartered
in Beitou District, Taipei, Taiwan." - Wikipedia.org

Website: https://www.asus.com

The prefix is already in use by at least 5 ARM boards

Signed-off-by: Luis Araneda <luaraneda@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 7cad06619..09101914a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -41,6 +41,7 @@ arrow	Arrow Electronics
 artesyn	Artesyn Embedded Technologies Inc.
 asahi-kasei	Asahi Kasei Corp.
 aspeed	ASPEED Technology Inc.
+asus	AsusTek Computer Inc.
 atlas	Atlas Scientific LLC
 atmel	Atmel Corporation
 auo	AU Optronics Corporation
-- 
2.18.0
