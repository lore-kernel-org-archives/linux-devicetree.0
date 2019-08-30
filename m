From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] dt-bindings: arm: idle-states: Move exit-latency-us explanation
Date: Fri, 30 Aug 2019 17:03:02 +0200
Message-ID: <20190830150302.20551-6-geert+renesas@glider.be>
References: <20190830150302.20551-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830150302.20551-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Nicolas Pitre <nico@linaro.org>, Sebastian Capella <sebcape@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Move exit-latency-us explanation to exit-latency-us section.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/idle-states.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
index eb9d725be7a93f4a..771f5d20ae18768c 100644
--- a/Documentation/devicetree/bindings/arm/idle-states.txt
+++ b/Documentation/devicetree/bindings/arm/idle-states.txt
@@ -287,14 +287,14 @@ follows:
 		Value type: <prop-encoded-array>
 		Definition: u32 value representing worst case latency in
 			    microseconds required to enter the idle state.
-			    The exit-latency-us duration may be guaranteed
-			    only after entry-latency-us has passed.
 
 	- exit-latency-us
 		Usage: Required
 		Value type: <prop-encoded-array>
 		Definition: u32 value representing worst case latency
 			    in microseconds required to exit the idle state.
+			    The exit-latency-us duration may be guaranteed
+			    only after entry-latency-us has passed.
 
 	- min-residency-us
 		Usage: Required
-- 
2.17.1
