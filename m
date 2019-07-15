From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH v3 5/8] dt-bindings: interrupt-controller: Add X1000 and X1000E bindings.
Date: Mon, 15 Jul 2019 20:09:52 +0800
Message-ID: <1563192595-53546-6-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, paul.burton@mips.com, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
List-Id: devicetree@vger.kernel.org

Add the interrupt-controller bindings for the X1000 Soc and
the X1000E Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
index fa1ad54..4f91bda 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
@@ -10,6 +10,8 @@ Required properties:
     ingenic,jz4770-intc
     ingenic,jz4775-intc
     ingenic,jz4780-intc
+    ingenic,x1000-intc
+    ingenic,x1000e-intc
 - reg : Specifies base physical address and size of the registers.
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Specifies the number of cells needed to encode an
-- 
2.7.4
