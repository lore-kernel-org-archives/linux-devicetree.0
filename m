From: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [kernel PATCH v2 0/2] devicetree: document ARM bindings for QEMU's Firmware Config interface
Date: Sun, 30 Nov 2014 17:51:20 +0100
Message-ID: <1417366282-13527-1-git-send-email-lersek@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

V2 seeks to address comments raised in the v1 review. Changes are broken
out per patch, as git notes.

Thanks
Laszlo

Laszlo Ersek (2):
  devicetree: document the "qemu" and "virtio" vendor prefixes
  devicetree: document ARM bindings for QEMU's Firmware Config interface

 Documentation/devicetree/bindings/arm/fw-cfg.txt   | 57 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  2 +
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/fw-cfg.txt

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
