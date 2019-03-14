From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 5/5] MAINTAINERS: add timer-microchip-pit64c.c
Date: Thu, 14 Mar 2019 16:26:50 +0000
Message-ID: <1552580772-8499-6-git-send-email-claudiu.beznea@microchip.com>
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

Add timer-microchip-pit64b.c as maintained file.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 85bc819867da..5af947c9f350 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10023,6 +10023,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated =
for non-subscribers)
 S:	Supported
 F:	drivers/misc/atmel_tclib.c
 F:	drivers/clocksource/tcb_clksrc.c
+F:	drivers/clocksource/timer-microchip-pit64b.c
=20
 MICROCHIP USBA UDC DRIVER
 M:	Cristian Birsan <cristian.birsan@microchip.com>
--=20
2.7.4
