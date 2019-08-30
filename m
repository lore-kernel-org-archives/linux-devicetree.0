From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] dt-bindings: arm: idle-states: Use "e.g." and "i.e." consistently
Date: Fri, 30 Aug 2019 17:02:58 +0200
Message-ID: <20190830150302.20551-2-geert+renesas@glider.be>
References: <20190830150302.20551-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830150302.20551-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Nicolas Pitre <nico@linaro.org>, Sebastian Capella <sebcape@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Replace abbreviations "eg" and "ie" by "e.g." resp. "i.e." for
consistency.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/arm/idle-states.txt      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
index 2d325bed37e53c1c..610b16c28d99c3ef 100644
--- a/Documentation/devicetree/bindings/arm/idle-states.txt
+++ b/Documentation/devicetree/bindings/arm/idle-states.txt
@@ -28,7 +28,7 @@ PM implementation to put the processor in different idle states (which include
 states listed above; "off" state is not an idle state since it does not have
 wake-up capabilities, hence it is not considered in this document).
 
-Idle state parameters (eg entry latency) are platform specific and need to be
+Idle state parameters (e.g. entry latency) are platform specific and need to be
 characterized with bindings that provide the required information to OS PM
 code so that it can build the required tables and use them at runtime.
 
@@ -90,20 +90,20 @@ These timing parameters can be used by an OS in different circumstances.
 
 An idle CPU requires the expected min-residency time to select the most
 appropriate idle state based on the expected expiry time of the next IRQ
-(ie wake-up) that causes the CPU to return to the EXEC phase.
+(i.e. wake-up) that causes the CPU to return to the EXEC phase.
 
 An operating system scheduler may need to compute the shortest wake-up delay
 for CPUs in the system by detecting how long will it take to get a CPU out
-of an idle state, eg:
+of an idle state, e.g.:
 
 wakeup-delay = exit-latency + max(entry-latency - (now - entry-timestamp), 0)
 
 In other words, the scheduler can make its scheduling decision by selecting
-(eg waking-up) the CPU with the shortest wake-up latency.
+(e.g. waking-up) the CPU with the shortest wake-up latency.
 The wake-up latency must take into account the entry latency if that period
 has not expired. The abortable nature of the PREP period can be ignored
 if it cannot be relied upon (e.g. the PREP deadline may occur much sooner than
-the worst case since it depends on the CPU operating conditions, ie caches
+the worst case since it depends on the CPU operating conditions, i.e. caches
 state).
 
 An OS has to reliably probe the wakeup-latency since some devices can enforce
@@ -183,15 +183,15 @@ and IDLE2:
 		Graph 2: idle states min-residency example
 
 In graph 2 above, that takes into account idle states entry/exit energy
-costs, it is clear that if the idle state residency time (ie time till next
+costs, it is clear that if the idle state residency time (i.e. time till next
 wake-up IRQ) is less than IDLE2-min-residency, IDLE1 is the better idle state
 choice energywise.
 
 This is mainly down to the fact that IDLE1 entry/exit energy costs are lower
 than IDLE2.
 
-However, the lower power consumption (ie shallower energy curve slope) of idle
-state IDLE2 implies that after a suitable time, IDLE2 becomes more energy
+However, the lower power consumption (i.e. shallower energy curve slope) of
+idle state IDLE2 implies that after a suitable time, IDLE2 becomes more energy
 efficient.
 
 The time at which IDLE2 becomes more energy efficient than IDLE1 (and other
-- 
2.17.1
