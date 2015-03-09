From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH_V2 0/5] drm: jz4780: Add drm driver for Ingenic JZ4780
Date: Mon, 9 Mar 2015 12:44:00 +0000
Message-ID: <1425905045-14007-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Here we have 5 patches that add a DRM driver for the LCD
controller in the Ingenic JZ4780 SoC.

The HDMI Controller in the JZ4780 is by Synopsys
and the dw_hdmi driver is used.

These patches are based on 4.0-rc3

V1 -> V2
Fixed module licenses
Fix in makefile and #include drm_flip_work
Rebased to v4.0-rc3

Feedback welcome

Thank-you
ZubairLK


Zubair Lutfullah Kakakhel (5):
  dt-bindings: video: Add Ingenic jz4780-drm binding
  dt-bindings: video: Add jz4780-lcd binding
  drm: jz4780: Add DRM driver for Ingenic JZ4780
  dt-bindings: video: Add jz4780-hdmi binding
  drm: bridge/dw_hdmi: Add jz4780 support

 .../bindings/video/ingenic-jz4780-drm.txt          |  17 +
 .../bindings/video/ingenic-jz4780-hdmi.txt         |  41 ++
 .../bindings/video/ingenic-jz4780-lcd.txt          |  39 ++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/jz4780/Kconfig                     |  22 +
 drivers/gpu/drm/jz4780/Makefile                    |   4 +
 drivers/gpu/drm/jz4780/dw_hdmi-jz4780.c            | 235 +++++++
 drivers/gpu/drm/jz4780/jz4780_crtc.c               | 719 +++++++++++++++++++++
 drivers/gpu/drm/jz4780/jz4780_drv.c                | 388 +++++++++++
 drivers/gpu/drm/jz4780/jz4780_drv.h                |  82 +++
 drivers/gpu/drm/jz4780/jz4780_regs.h               | 694 ++++++++++++++++++++
 include/drm/bridge/dw_hdmi.h                       |   1 +
 13 files changed, 2245 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/ingenic-jz4780-drm.txt
 create mode 100644 Documentation/devicetree/bindings/video/ingenic-jz4780-hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/video/ingenic-jz4780-lcd.txt
 create mode 100644 drivers/gpu/drm/jz4780/Kconfig
 create mode 100644 drivers/gpu/drm/jz4780/Makefile
 create mode 100644 drivers/gpu/drm/jz4780/dw_hdmi-jz4780.c
 create mode 100644 drivers/gpu/drm/jz4780/jz4780_crtc.c
 create mode 100644 drivers/gpu/drm/jz4780/jz4780_drv.c
 create mode 100644 drivers/gpu/drm/jz4780/jz4780_drv.h
 create mode 100644 drivers/gpu/drm/jz4780/jz4780_regs.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
