From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/5] dt-bindings: arm: idle-states: Correct references to wake-up delay
Date: Fri, 30 Aug 2019 17:02:59 +0200
Message-ID: <20190830150302.20551-3-geert+renesas@glider.be>
References: <20190830150302.20551-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830150302.20551-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Nicolas Pitre <nico@linaro.org>, Sebastian Capella <sebcape@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The paragraph explains the use of wakup-delay, as defined above.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/idle-states.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
index 610b16c28d99c3ef..6e651b7e62c328be 100644
--- a/Documentation/devicetree/bindings/arm/idle-states.txt
+++ b/Documentation/devicetree/bindings/arm/idle-states.txt
@@ -99,8 +99,8 @@ of an idle state, e.g.:
 wakeup-delay = exit-latency + max(entry-latency - (now - entry-timestamp), 0)
 
 In other words, the scheduler can make its scheduling decision by selecting
-(e.g. waking-up) the CPU with the shortest wake-up latency.
-The wake-up latency must take into account the entry latency if that period
+(e.g. waking-up) the CPU with the shortest wake-up delay.
+The wake-up delay must take into account the entry latency if that period
 has not expired. The abortable nature of the PREP period can be ignored
 if it cannot be relied upon (e.g. the PREP deadline may occur much sooner than
 the worst case since it depends on the CPU operating conditions, i.e. caches
-- 
2.17.1
