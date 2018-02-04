From: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/7] ARM: dts: imx6q: engicam LVDS panel changes
Date: Sun,  4 Feb 2018 23:19:24 +0530
Message-ID: <1517766571-409-1-git-send-email-jagan@amarulasolutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Series adda LVDS panel attributes on panel drivers instead of defining
them in dts nodes, and also added new icorem6 engicam boards.

Jagan Teki (7):
  drm/panel: simple: add support for Ampire AM-800480AYTZQW-00H
  ARM: dts: imx6q-icore: Switch LVDS timings from panel-simple
  ARM: dts: imx6dl-icore: Add LVDS node
  drm/panel: simple: Add support for KEO TX31D200VM0BAA
  ARM: dts: imx6q-icore-ofcap12: Switch LVDS timings from panel-simple
  ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual OpenFrame Cap 7
    initial support
  ARM: dts: imx6q: Add Engicam i.CoreM6 1.5 Quad/Dual MIPI starter kit
    support

 .../display/panel/ampire,am-800480aytzqw-00h.txt   | 25 +++++++++
 .../bindings/display/panel/koe,tx31d200vm0baa.txt  | 25 +++++++++
 arch/arm/boot/dts/Makefile                         |  2 +
 arch/arm/boot/dts/imx6dl-icore.dts                 | 28 ++++++++++
 arch/arm/boot/dts/imx6q-icore-mipi.dts             | 25 +++++++++
 arch/arm/boot/dts/imx6q-icore-ofcap12.dts          | 31 ++++++-----
 arch/arm/boot/dts/imx6q-icore-ofcap7.dts           | 65 ++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-icore.dts                  | 31 ++++++-----
 arch/arm/boot/dts/imx6qdl-icore.dtsi               | 25 ++++++++-
 drivers/gpu/drm/panel/panel-simple.c               | 54 ++++++++++++++++++
 10 files changed, 282 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-800480aytzqw-00h.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
 create mode 100644 arch/arm/boot/dts/imx6q-icore-mipi.dts
 create mode 100644 arch/arm/boot/dts/imx6q-icore-ofcap7.dts

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
