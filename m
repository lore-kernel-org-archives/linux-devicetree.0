From: <Eugen.Hristev@microchip.com>
Subject: [PATCH 3/3] MAINTAINERS: add sam9x60_wdt
Date: Wed, 2 Oct 2019 07:35:28 +0000
Message-ID: <1570001371-8174-3-git-send-email-eugen.hristev@microchip.com>
References: <1570001371-8174-1-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570001371-8174-1-git-send-email-eugen.hristev@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.or
Cc: Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Eugen.Hristev@microchip.com
List-Id: devicetree@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Add sam9x60_wdt watchdog driver to at91 soc support.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 296de2b..109b030 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1972,6 +1972,7 @@ F:	arch/arm/boot/dts/sama*.dtsi
 F:	arch/arm/include/debug/at91.S
 F:	drivers/memory/atmel*
 F:	drivers/watchdog/sama5d4_wdt.c
+F:	drivers/watchdog/sam9x60_wdt.c
 X:	drivers/input/touchscreen/atmel_mxt_ts.c
 X:	drivers/net/wireless/atmel/
=20
--=20
2.7.4
