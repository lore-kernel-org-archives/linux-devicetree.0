From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH v3 3/8] dt-bindings: interrupt-controller: Add JZ4760 and JZ4760B bindings.
Date: Mon, 15 Jul 2019 20:09:50 +0800
Message-ID: <1563192595-53546-4-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, paul.burton@mips.com, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
List-Id: devicetree@vger.kernel.org

Add the interrupt-controller bindings for the JZ4760 Soc and
the JZ4760B Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
index d4373d0..fa1ad54 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
@@ -5,6 +5,8 @@ Required properties:
 - compatible : should be "ingenic,<socname>-intc". Valid strings are:
     ingenic,jz4740-intc
     ingenic,jz4725b-intc
+    ingenic,jz4760-intc
+    ingenic,jz4760b-intc
     ingenic,jz4770-intc
     ingenic,jz4775-intc
     ingenic,jz4780-intc
-- 
2.7.4
