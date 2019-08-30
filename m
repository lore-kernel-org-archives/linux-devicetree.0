From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] dt-bindings: arm: idle-states: Correct "constraint guarantees"
Date: Fri, 30 Aug 2019 17:03:00 +0200
Message-ID: <20190830150302.20551-4-geert+renesas@glider.be>
References: <20190830150302.20551-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830150302.20551-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Nicolas Pitre <nico@linaro.org>, Sebastian Capella <sebcape@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Correct "constraints guarantees" to "constraint guarantees".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/idle-states.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
index 6e651b7e62c328be..4ef0de5c0c7f5990 100644
--- a/Documentation/devicetree/bindings/arm/idle-states.txt
+++ b/Documentation/devicetree/bindings/arm/idle-states.txt
@@ -107,7 +107,7 @@ the worst case since it depends on the CPU operating conditions, i.e. caches
 state).
 
 An OS has to reliably probe the wakeup-latency since some devices can enforce
-latency constraints guarantees to work properly, so the OS has to detect the
+latency constraint guarantees to work properly, so the OS has to detect the
 worst case wake-up latency it can incur if a CPU is allowed to enter an
 idle state, and possibly to prevent that to guarantee reliable device
 functioning.
-- 
2.17.1
