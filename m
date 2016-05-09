From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v5 0/5] da8xx USB PHY platform devices and clocks (was "da8xx UBS clocks")
Date: Mon,  9 May 2016 18:46:47 -0500
Message-ID: <1462837612-7803-1-git-send-email-david@lechnology.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nsekhar-l0cyMroinI0@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

v5 changes: renamed "usbphy" to "usb_phy" or "usb-phy" as appropriate

David Lechner (5):
  ARM: davinci: da8xx: add usb phy clocks
  ARM: davinci: da8xx: Add CFGCHIP syscon platform declaration.
  ARM: davinci: da8xx: Add USB PHY platform declaration
  ARM: DTS: da850: Add cfgchip syscon node
  ARM: DTS: da850: Add usb phy node

 arch/arm/boot/dts/da850.dtsi                |   9 ++
 arch/arm/mach-davinci/board-da830-evm.c     |  52 +++----
 arch/arm/mach-davinci/board-da850-evm.c     |   4 +
 arch/arm/mach-davinci/board-mityomapl138.c  |   4 +
 arch/arm/mach-davinci/board-omapl138-hawk.c |  23 ++-
 arch/arm/mach-davinci/devices-da8xx.c       |  28 ++++
 arch/arm/mach-davinci/include/mach/da8xx.h  |   6 +
 arch/arm/mach-davinci/usb-da8xx.c           | 230 +++++++++++++++++++++++++++-
 8 files changed, 314 insertions(+), 42 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
