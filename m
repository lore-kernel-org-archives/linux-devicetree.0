From: Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 0/2]  platform: Add DT support for DA8xx
Date: Wed, 16 Nov 2016 12:07:34 +0100
Message-ID: <1479294456-7942-1-git-send-email-abailon@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This add and enable the usb otg for da850 and da850-lcdk.
This series depends on "driver: dd DT support for DA8xx" patch set.

If this series is applied before the "usb: musb: da8xx: Fix few issues" patch
set then the usb driver will always retrun -ENODEV.

Changes in v2:
* Remove unrelated changes in patch 3
* Rename the device node in patch 4

Changes in v3:
* Fix few mistakes in DT binding sample
* Only build the device table if DT is enabled

Change in v4:
* Fix a nit

Changes in v5:
* Remove usb_phy node from d850.dtsi because it has already been merged.
* Separated the patch in two: one for the board and one for the SoC.

Alexandre Bailon (2):
  ARM: dts: da850: Add the usb otg device node
  ARM: dts: da850-lcdk: Enable the usb otg device node

 arch/arm/boot/dts/da850-lcdk.dts |  8 ++++++++
 arch/arm/boot/dts/da850.dtsi     | 10 ++++++++++
 2 files changed, 18 insertions(+)

-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
