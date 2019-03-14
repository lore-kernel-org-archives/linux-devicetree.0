From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 3/5] MAINTAINERS: change section name to be more generic
Date: Thu, 14 Mar 2019 16:26:42 +0000
Message-ID: <1552580772-8499-4-git-send-email-claudiu.beznea@microchip.com>
References: <1552580772-8499-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552580772-8499-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com, daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Change Microchip timers section name to be more generic.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d04cebb4a71..0948d6592ea5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10016,7 +10016,7 @@ S:	Supported
 F:	drivers/misc/atmel-ssc.c
 F:	include/linux/atmel-ssc.h
=20
-MICROCHIP TIMER COUNTER (TC) AND CLOCKSOURCE DRIVERS
+MICROCHIP TIMERS AND CLOCKSOURCE DRIVERS
 M:	Nicolas Ferre <nicolas.ferre@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
--=20
2.7.4
