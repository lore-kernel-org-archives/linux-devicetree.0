From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH 7/7] MAINTAINERS: nfc: trf7970a: Add Mark Greer as maintainer
Date: Tue, 20 Dec 2016 11:06:08 -0700
Message-ID: <20161220180608.29997-8-mgreer@animalcreek.com>
References: <20161220180608.29997-1-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161220180608.29997-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add Mark Greer as the maintainer of the trf7970a NFC driver.

Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f6eb97b35e0f..3a9420055bd7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10871,6 +10871,13 @@ F:	include/linux/power/bq27xxx_battery.h
 F:	drivers/power/supply/bq27xxx_battery.c
 F:	drivers/power/supply/bq27xxx_battery_i2c.c
 
+TI TRF7970A NFC DRIVER
+M:	Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
+L:	linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org (moderated for non-subscribers)
+S:	Supported
+F:	drivers/nfc/trf7970a.c
+F:	Documentation/devicetree/bindings/net/nfc/trf7970a.txt
+
 TIMEKEEPING, CLOCKSOURCE CORE, NTP, ALARMTIMER
 M:	John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
 M:	Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
