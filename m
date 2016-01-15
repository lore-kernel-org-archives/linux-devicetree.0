From: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] reset: img: Add pistachio SoC reset support
Date: Fri, 15 Jan 2016 14:44:31 +0000
Message-ID: <1452869073-27608-1-git-send-email-james.hartley@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Damien Horsley <damien.horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Govindraj Raja <govindraj.raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series provides the reset controller driver and documentation for the
pistachio SoC. 

Further platform support and a device tree will be posted via the MIPS
mailing list shortly.

These patches are based on linux-next.

Damien.Horsley (2):
  reset: img: Add pistachio reset controller binding document
  reset: img: Add Pistachio reset controller driver

 .../bindings/reset/img,pistachio-reset.txt         |   51 ++++++
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-pistachio.c                    |  162 ++++++++++++++++++++
 .../reset-controller/pistachio-resets.h            |   36 +++++
 4 files changed, 250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/img,pistachio-reset.txt
 create mode 100644 drivers/reset/reset-pistachio.c
 create mode 100644 include/dt-bindings/reset-controller/pistachio-resets.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
