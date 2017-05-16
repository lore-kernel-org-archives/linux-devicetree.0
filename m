From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 1/3] gpio: Add new flags to control sleep status of GPIOs
Date: Tue, 16 May 2017 16:31:52 +0100
Message-ID: <1494948714-15203-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gnurou@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Add new flags to allow users to specify that they are not concerned with
the status of GPIOs whilst in a sleep/low power state.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 include/dt-bindings/gpio/gpio.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
index b4f54da..48c28f0 100644
--- a/include/dt-bindings/gpio/gpio.h
+++ b/include/dt-bindings/gpio/gpio.h
@@ -21,6 +21,10 @@
 #define GPIO_LINE_OPEN_SOURCE 0
 #define GPIO_LINE_OPEN_DRAIN 4
 
+/* Bit 3 express GPIO suspend/resume persistence */
+#define GPIO_SLEEP_MAINTAIN_VALUE 0
+#define GPIO_SLEEP_MAY_LOOSE_VALUE 8
+
 /*
  * Open Drain/Collector is the combination of single-ended open drain interface.
  * Open Source/Emitter is the combination of single-ended open source interface.
-- 
2.1.4

