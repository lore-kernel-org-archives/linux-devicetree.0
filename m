From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH 0/2] Add support for cros-ec-extcon driver
Date: Mon, 20 Feb 2017 16:18:52 +0100
Message-ID: <20170220151854.22859-1-enric.balletbo@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear all,

Now that the drm/rockchip cdn-dp driver is in linux-next and ready to land
it's time to review the extcon-cros-ec driver. The cdn-dp driver uses this
extcon driver to get cable status and the presence of display out.

This driver is based on the one available in chromeos-4.4 kernel but removing
all the USB switch role stuff, as this depends on other infrastructures like 
the dwc3 role switch and the Type-C connector.

Benson Leung (2):
  extcon: cros-ec: Add extcon-cros-ec driver to support display out.
  dt-bindings: extcon: Add support for cros-ec device

 .../devicetree/bindings/extcon/extcon-cros-ec.txt  |  24 ++
 drivers/extcon/Kconfig                             |   7 +
 drivers/extcon/Makefile                            |   1 +
 drivers/extcon/extcon-cros_ec.c                    | 480 +++++++++++++++++++++
 include/linux/mfd/cros_ec_commands.h               |  75 ++++
 5 files changed, 587 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-cros-ec.txt
 create mode 100644 drivers/extcon/extcon-cros_ec.c

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
