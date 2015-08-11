From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: [PATCH 3/5] MAINTAINERS: Add an entry for pinctrl-at91-pio4
Date: Tue, 11 Aug 2015 10:28:03 +0200
Message-ID: <1439281685-3020-4-git-send-email-ludovic.desroches@atmel.com>
References: <1439281685-3020-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1439281685-3020-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: s.hauer@pengutronix.de, linus.walleij@linaro.org, nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com, Ludovic Desroches <ludovic.desroches@atmel.com>
List-Id: devicetree@vger.kernel.org

Add an entry for the Atmel PIO4 controller driver.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b37fdf..62c243a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8041,6 +8041,13 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/pinctrl/pinctrl-at91.*
 
+PIN CONTROLLER - ATMEL AT91 PIO4
+M:	Ludovic Desroches <ludovic.desroches@atmel.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-gpio@vger.kernel.org
+S:	Supported
+F:	drivers/pinctrl/pinctrl-at91-pio4.*
+
 PIN CONTROLLER - INTEL
 M:	Mika Westerberg <mika.westerberg@linux.intel.com>
 M:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
-- 
2.5.0

