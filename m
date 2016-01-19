From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v5 0/1] Introduce Innosilicon HDMI driver on Rockchip platforms
Date: Tue, 19 Jan 2016 11:59:01 +0800
Message-ID: <1453175941-18066-1-git-send-email-ykk@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ken Mixte <kmixter-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ben Chan <benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Zheng Yang <zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Here are a brief introduction to Innosilicon HDMI IP:
 - Support HDMI 1.4a, HDCP 1.2 and DVI 1.0 standard compliant transmitter
 - Support HDMI1.4 a/b 3D function defined in HDMI 1.4 a/b spec
 - Digital video interface supports a pixel size of 24, 30, 36, 48bits color
   depth in RGB
 - S/PDIF output supports PCM, Dolby Digital, DTS digital audio transmission
   (32-192kHz Fs) using IEC60958 and IEC 61937
 - The EDID and CEC function are also supported by Innosilicon HDMI Transmitter
   Controlle


Changes in v5:
- Use hdmi_infoframe helper functions to packed the infoframe (Russell)
- Remove the unused double wait_for_completion_timeout for ddc transfer (Russell)
- Remove the unused local variable in "inno_hdmi_i2c_write()" function (Russell)

Changes in v4:
- Modify the commit title "drm/rockchip: hdmi: ..." (Mark)
- Correct the "DKMS" to "DPMS" (Mark)
- Fix over 80 characters problems (Mark)
- Remove encoder .prepare/.commit helper functions, and move the vop mode
  configure function into encoder .enable helper functions. (Mark)

Changes in v3:
- Use encoder enable/disable function, and remove the encoder DPMS function
- Keep HDMI PLL power on in standby mode

Changes in v2:
- Using DRM atomic helper functions for connector init (Mark)
- Remove "hdmi->connector.encoder = encoder;" (Mark)

Yakir Yang (1):
  drm/rockchip: hdmi: add Innosilicon HDMI support

 drivers/gpu/drm/rockchip/Kconfig     |   8 +
 drivers/gpu/drm/rockchip/Makefile    |   1 +
 drivers/gpu/drm/rockchip/inno_hdmi.c | 941 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/rockchip/inno_hdmi.h | 362 ++++++++++++++
 4 files changed, 1312 insertions(+)
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h

-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
