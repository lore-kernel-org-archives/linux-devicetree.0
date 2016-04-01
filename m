From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/2] dt-bindings: timer: sp804: add new compatible for OX810SE SoC
Date: Fri,  1 Apr 2016 16:22:39 +0200
Message-ID: <1459520559-13110-3-git-send-email-narmstrong@baylibre.com>
References: <1459520559-13110-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459520559-13110-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, daniel.lezcano@linaro.org, tglx@linutronix.de, rmk+kernel@arm.linux.org.uk, sudeep.holla@arm.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add new oxsemi,ox810se-rps-timer compatible string to support the
Oxford Semiconductor OX810SE SoC Dual Timers variant.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/timer/arm,sp804.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/arm,sp804.txt b/Documentation/devicetree/bindings/timer/arm,sp804.txt
index 5cd8eee7..ebe8753 100644
--- a/Documentation/devicetree/bindings/timer/arm,sp804.txt
+++ b/Documentation/devicetree/bindings/timer/arm,sp804.txt
@@ -2,7 +2,7 @@ ARM sp804 Dual Timers
 ---------------------------------------
 
 Required properties:
-- compatible: Should be "arm,sp804" & "arm,primecell"
+- compatible: Should be "arm,sp804" & "arm,primecell", or "oxsemi,ox810se-rps-timer"
 - interrupts: Should contain the list of Dual Timer interrupts. This is the
 	interrupt for timer 1 and timer 2. In the case of a single entry, it is
 	the combined interrupt or if "arm,sp804-has-irq" is present that
-- 
1.9.1
