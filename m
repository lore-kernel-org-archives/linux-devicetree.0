From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] hwmon: binding: Fix "#cooling-cells" property's name
Date: Fri, 25 May 2018 10:49:57 +0530
Message-ID: <9754c25e8459685d4919017dd7c8709cee7b89ce.1527224960.git.viresh.kumar@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

It should be "#cooling-cells" instead of "cooling-cells". Fix it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 Documentation/devicetree/bindings/hwmon/gpio-fan.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/gpio-fan.txt b/Documentation/devicetree/bindings/hwmon/gpio-fan.txt
index 439a7430fc68..2becdcfdc840 100644
--- a/Documentation/devicetree/bindings/hwmon/gpio-fan.txt
+++ b/Documentation/devicetree/bindings/hwmon/gpio-fan.txt
@@ -11,7 +11,7 @@ Bindings for fan connected to GPIO lines
   must have the RPM values in ascending order.
 - alarm-gpios: This pin going active indicates something is wrong with
   the fan, and a udev event will be fired.
-- cooling-cells: If used as a cooling device, must be <2>
+- #cooling-cells: If used as a cooling device, must be <2>
   Also see: Documentation/devicetree/bindings/thermal/thermal.txt
   min and max states are derived from the speed-map of the fan.
 
-- 
2.15.0.194.g9af6a3dea062
