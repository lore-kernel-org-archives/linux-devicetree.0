From: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 0/2] devicetree: document ARM bindings for QEMU's Firmware Config interface
Date: Wed, 17 Dec 2014 21:49:44 +0100
Message-ID: <1418849386-25857-1-git-send-email-lersek@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, agraf-l3A5Bk7waGM@public.gmane.org
List-Id: devicetree@vger.kernel.org

The qemu patchset has been turned upside down on qemu-devel during
review (many thanks for that!); one outcome is that now both the
selector and the data registers are big endian. This series has been
updated accordingly.

Thanks
Laszlo

Laszlo Ersek (2):
  devicetree: document the "qemu" and "virtio" vendor prefixes
  devicetree: document ARM bindings for QEMU's Firmware Config interface

 Documentation/devicetree/bindings/arm/fw-cfg.txt   | 72 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  2 +
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/fw-cfg.txt

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
