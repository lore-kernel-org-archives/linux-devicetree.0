From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v4 0/7] da8xx USB PHY (was da8xx USB clocks)
Date: Thu, 14 Apr 2016 13:35:11 -0500
Message-ID: <1460658919-4965-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The "da8xx USB clocks" patch series was growing a bit too big, so on the advice
of Sekhar Nori, I am splitting it into two parts. This part contains everything
in drivers/ and the other part will contain everything in arch/arm/mach-davinci.

This patch series will apply and build on its own. It just won't work at runtime
without the corresponding mach-davinci changes to provide clocks, etc.

This round just contains changes from feedback. See individual patches for
details.

Tested working on LEGO MINDSTORMS EV3 using linux-davinci/master branch.

David Lechner (7):
  mfd: da8xx-cfgchip: New header file for CFGCHIP registers.
  dt-bindings: Add bindings for phy-da8xx-usb
  phy: Add set_mode callback
  phy: da8xx-usb: new driver for DA8xx SoC USB PHY
  usb: ohci-da8xx: Remove code that references mach
  usb: musb: da8xx: Use devm in probe
  usb: musb: da8xx: Remove mach code

 .../devicetree/bindings/phy/phy-da8xx-usb.txt      |  40 ++++
 drivers/phy/Kconfig                                |  10 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-core.c                             |  15 ++
 drivers/phy/phy-da8xx-usb.c                        | 245 +++++++++++++++++++++
 drivers/usb/host/Kconfig                           |   1 +
 drivers/usb/host/ohci-da8xx.c                      | 102 +++++----
 drivers/usb/musb/Kconfig                           |   2 +-
 drivers/usb/musb/da8xx.c                           | 160 +++++---------
 include/linux/mfd/da8xx-cfgchip.h                  | 153 +++++++++++++
 include/linux/phy/phy.h                            |  15 ++
 include/linux/platform_data/usb-davinci.h          |  22 --
 12 files changed, 594 insertions(+), 172 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
 create mode 100644 drivers/phy/phy-da8xx-usb.c
 create mode 100644 include/linux/mfd/da8xx-cfgchip.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
