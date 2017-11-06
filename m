From: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v3 3/9] dt-bindings: interrupt-controllers: add compatible string for stm32h7
Date: Mon, 6 Nov 2017 18:03:33 +0100
Message-ID: <1509987819-29599-4-git-send-email-ludovic.Barre@st.com>
References: <1509987819-29599-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509987819-29599-1-git-send-email-ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>

This patch updates stm32-exti documentation with stm32h7-exti
compatible string.

Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/interrupt-controller/st,stm32-exti.txt        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
index 6e7703d..edf03f0 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
@@ -2,7 +2,9 @@ STM32 External Interrupt Controller
 
 Required properties:
 
-- compatible: Should be "st,stm32-exti"
+- compatible: Should be:
+    "st,stm32-exti"
+    "st,stm32h7-exti"
 - reg: Specifies base physical address and size of the registers
 - interrupt-controller: Indentifies the node as an interrupt controller
 - #interrupt-cells: Specifies the number of cells to encode an interrupt
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
