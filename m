From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH Resend 1/1] Documentation/watchdog: Add binding example in samsung-wdt
Date: Wed, 30 Oct 2013 10:56:37 +0530
Message-ID: <1383110797-26225-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-watchdog@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, wim@iguana.be, linux@roeck-us.net, sachin.kamat@linaro.org
List-Id: devicetree@vger.kernel.org

Added an example for reference.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.txt   |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
index 2aa486c..7ddf461 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
@@ -12,3 +12,12 @@ Required properties:
 
 Optional properties:
 - timeout-sec : contains the watchdog timeout in seconds.
+
+Example:
+
+watchdog@101D0000 {
+	compatible = "samsung,s3c2410-wdt";
+	reg = <0x101D0000 0x100>;
+	interrupts = <0 42 0>;
+	status = "disabled";
+};
-- 
1.7.9.5
