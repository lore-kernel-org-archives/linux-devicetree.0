From: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: [patch v2 0/2] Add support for Maxim MAX6621 temperature sensor device
Date: Wed, 30 Aug 2017 21:55:55 +0000
Message-ID: <1504130157-108257-1-git-send-email-vadimp@mellanox.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset:
- support for MAX6621 temperature sensor;
- binding documentation for this device;

Vadim Pasternak (2):
  hwmon: Driver for Maxim MAX6621 temperature sensor
  dt-bindings: hwmon: add binding documentation for max6621 device

 .../devicetree/bindings/hwmon/max6621.txt          |  14 +
 drivers/hwmon/Kconfig                              |  14 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/max6621.c                            | 484 +++++++++++++++++++++
 4 files changed, 513 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max6621.txt
 create mode 100644 drivers/hwmon/max6621.c

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
