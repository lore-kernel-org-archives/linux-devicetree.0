From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v2 1/5] gpio: of: Reflect decoupling of open collector and active low/high
Date: Tue, 23 May 2017 15:47:28 +0100
Message-ID: <1495550852-3672-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit 4c0facddb7d8 ("gpio: core: Decouple open drain/source flag with
active low/high") decoupled the open collector outputs from active
low/high but did not update the documentation.

Update the device tree documentation to correctly reflect this new
separation between the two concepts.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---

New to the series.

Thanks,
Charles

 Documentation/devicetree/bindings/gpio/gpio.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 2209c16..bccb8623 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -74,11 +74,12 @@ GPIO pin number, and GPIO flags as accepted by the "qe_pio_e" gpio-controller.
 Optional standard bitfield specifiers for the last cell:
 
 - Bit 0: 0 means active high, 1 means active low
-- Bit 1: 1 means single-ended wiring, see:
+- Bit 1: 0 mean push-pull wiring, see:
+           https://en.wikipedia.org/wiki/Push-pull_output
+         1 means single-ended wiring, see:
            https://en.wikipedia.org/wiki/Single-ended_triode
-	   When used with active-low, this means open drain/collector, see:
+- Bit 2: 0 means open-source, 1 means open drain, see:
            https://en.wikipedia.org/wiki/Open_collector
-	   When used with active-high, this means open source/emitter
 
 1.1) GPIO specifier best practices
 ----------------------------------
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
