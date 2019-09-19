From: Thara Gopinath <thara.gopinath@linaro.org>
Subject: [PATCH 1/4] dt-bindings: thermal: Introduce monitor-falling parameter to thermal trip point binding
Date: Wed, 18 Sep 2019 22:18:20 -0400
Message-ID: <1568859503-19725-2-git-send-email-thara.gopinath@linaro.org>
References: <1568859503-19725-1-git-send-email-thara.gopinath@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568859503-19725-1-git-send-email-thara.gopinath@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: amit.kucheria@verdurent.com, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Introduce a new binding parameter to thermal trip point description
to indicate whether the temperature level specified by the trip point
is monitored for a rise or fall in temperature.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 Documentation/devicetree/bindings/thermal/thermal.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/thermal.txt b/Documentation/devicetree/bindings/thermal/thermal.txt
index ca14ba9..849a2a9 100644
--- a/Documentation/devicetree/bindings/thermal/thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/thermal.txt
@@ -90,6 +90,14 @@ Required properties:
 	"critical":	Hardware not reliable.
   Type: string
 
+Optional property:
+- monitor-falling: 	Indicate whether the system action is kick
+  Type: boolean		started when the temperature falls below or rises
+			above the trip temperature level indicated in
+			"temperature".If true, the trip point is monitored
+			for falling temperature else the trip point is
+			monitored for rising temperature.
+
 * Cooling device maps
 
 The cooling device maps node is a node to describe how cooling devices
-- 
2.1.4
