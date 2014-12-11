From: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/2] devicetree: document ARM bindings for QEMU's Firmware Config interface
Date: Thu, 11 Dec 2014 04:49:10 +0100
Message-ID: <1418269752-31516-1-git-send-email-lersek@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Addressing v2 comments from Peter Maydell and Arnd Bergmann. Also
documenting the new 64-bit wide data register, and possibility for
future extensions. Changes are noted on each patch.

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
