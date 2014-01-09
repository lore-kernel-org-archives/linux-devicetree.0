From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/3] power_supply: modelgauge_battery: Add Maxim ModelGauge ICs gauge
Date: Thu,  9 Jan 2014 20:49:02 +0400
Message-ID: <1389286145-15375-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mk7.kang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

This adds the folowing:
- Maxim ModelGauge ICs gauge driver for MAX17040/41/43/44/48/49/58/59 chips
- Document DT bindings
- Remove superseded Maxim MAX17040 gauge driver

Vladimir Barinov (3):
 [1/3] power_supply: modelgauge_battery: Maxim ModelGauge ICs gauge
 [2/3] dt: Document ModelGauge gauge bindings
 [3/3] power_supply: modelgauge_battery: Remove Maxim MAX17040 gauge

---
 Documentation/devicetree/bindings/power_supply/modelgauge_battery.txt |   82 
 drivers/power/Kconfig                                                 |   16 
 drivers/power/Makefile                                                |    2 
 drivers/power/max17040_battery.c                                      |  297 ---
 drivers/power/modelgauge_battery.c                                    |  875 ++++++++++
 include/linux/platform_data/battery-modelgauge.h                      |   44 
 6 files changed, 1010 insertions(+), 306 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
