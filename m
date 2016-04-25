From: Eric Engestrom <eric@engestrom.ch>
Subject: [PATCH 13/41] Documentation: dt: interrupt-controller: fix spelling mistakes
Date: Mon, 25 Apr 2016 01:24:10 +0100
Message-ID: <1461543878-3639-14-git-send-email-eric@engestrom.ch>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Eric Engestrom <eric@engestrom.ch>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Eric Engestrom <eric@engestrom.ch>
---
 .../devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu b/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu
index 43effa0..18d4f40 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu
@@ -4,7 +4,7 @@ All TI OMAP4/5 (and their derivatives) an interrupt controller that
 routes interrupts to the GIC, and also serves as a wakeup source. It
 is also referred to as "WUGEN-MPU", hence the name of the binding.
 
-Reguired properties:
+Required properties:
 
 - compatible : should contain at least "ti,omap4-wugen-mpu" or
   "ti,omap5-wugen-mpu"
@@ -20,7 +20,7 @@ Notes:
 - Because this HW ultimately routes interrupts to the GIC, the
   interrupt specifier must be that of the GIC.
 - Only SPIs can use the WUGEN as an interrupt parent. SGIs and PPIs
-  are explicitly forbiden.
+  are explicitly forbidden.
 
 Example:
 
-- 
2.8.0
