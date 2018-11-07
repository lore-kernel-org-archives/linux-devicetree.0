From: <Andrei.Stefanescu@microchip.com>
Subject: [PATCH 2/3] MAINTAINERS: add maintainer for sama5d2 PIOBU GPIO driver
Date: Wed, 7 Nov 2018 15:12:36 +0000
Message-ID: <1541603580-17448-3-git-send-email-andrei.stefanescu@microchip.com>
References: <1541603580-17448-1-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541603580-17448-1-git-send-email-andrei.stefanescu@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Ludovic.Desroches@microchip.com, Cristian.Birsan@microchip.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrei.Stefanescu@microchip.com
List-Id: devicetree@vger.kernel.org

This patch adds a maintainer for the sama5d2 GPIO controller
driver.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@microchip.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f485597..88369f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9760,6 +9760,13 @@ M:	Nicolas Ferre <nicolas.ferre@microchip.com>
 S:	Supported
 F:	drivers/power/reset/at91-sama5d2_shdwc.c
=20
+MICROCHIP SAMA5D2-COMPATIBLE PIOBU GPIO
+M:	Andrei Stefanescu <andrei.stefanescu@microchip.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-gpio@vger.kernel.org
+F:	drivers/gpio/gpio-sama5d2-piobu.c
+F:	Documentation/devicetree/bindings/gpio/gpio-sama5d2-piobu.txt
+
 MICROCHIP SPI DRIVER
 M:	Nicolas Ferre <nicolas.ferre@microchip.com>
 S:	Supported
--=20
2.7.4
