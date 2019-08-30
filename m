From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] dt-bindings: arm: idle-states: Add punctuation to improve readability
Date: Fri, 30 Aug 2019 17:03:01 +0200
Message-ID: <20190830150302.20551-5-geert+renesas@glider.be>
References: <20190830150302.20551-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830150302.20551-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Nicolas Pitre <nico@linaro.org>, Sebastian Capella <sebcape@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/idle-states.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
index 4ef0de5c0c7f5990..eb9d725be7a93f4a 100644
--- a/Documentation/devicetree/bindings/arm/idle-states.txt
+++ b/Documentation/devicetree/bindings/arm/idle-states.txt
@@ -214,8 +214,8 @@ processor idle states, defined as device tree nodes, are listed.
 
 	Usage: Optional - On ARM systems, it is a container of processor idle
 			  states nodes. If the system does not provide CPU
-			  power management capabilities or the processor just
-			  supports idle_standby an idle-states node is not
+			  power management capabilities, or the processor just
+			  supports idle_standby, an idle-states node is not
 			  required.
 
 	Description: idle-states node is a container node, where its
@@ -342,8 +342,8 @@ follows:
 			    state.
 
 	In addition to the properties listed above, a state node may require
-	additional properties specifics to the entry-method defined in the
-	idle-states node, please refer to the entry-method bindings
+	additional properties specific to the entry-method defined in the
+	idle-states node. Please refer to the entry-method bindings
 	documentation for properties definitions.
 
 ===========================================
-- 
2.17.1
