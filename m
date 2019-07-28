From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH 3/4 v4] dt-bindings: interrupt-controller: Add new Ingenic Socs bindings.
Date: Mon, 29 Jul 2019 01:34:32 +0800
Message-ID: <1564335273-22931-4-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, paul.burton@mips.com, tglx@linutronix.de, mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
List-Id: devicetree@vger.kernel.org

Add the interrupt-controller bindings for the JZ4760/JZ4760B and
the X1000/X1000E and the X1500 Socs from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 .../devicetree/bindings/interrupt-controller/ingenic,intc.txt        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
index d4373d0..a96e120 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
@@ -5,9 +5,14 @@ Required properties:
 - compatible : should be "ingenic,<socname>-intc". Valid strings are:
     ingenic,jz4740-intc
     ingenic,jz4725b-intc
+    ingenic,jz4760-intc
+    ingenic,jz4760b-intc
     ingenic,jz4770-intc
     ingenic,jz4775-intc
     ingenic,jz4780-intc
+    ingenic,x1000-intc
+    ingenic,x1000e-intc
+    ingenic,x1500-intc
 - reg : Specifies base physical address and size of the registers.
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Specifies the number of cells needed to encode an
-- 
2.7.4
