From: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/3] ARM: dts: lpc32xx: update ssp / spi nodes
Date: Wed, 20 Apr 2016 09:20:57 -0400
Message-ID: <1461158460-2946-1-git-send-email-slemieux.tyco@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org
Cc: stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>

This patchset change the following:
1) adds clock properties to spi peripheral devices,
   clock ids are taken from dt-bindings/clock/lpc32xx-clock.h.

2) enable SSP0 used by PHY3250.
   preparatory change prior to disabling SSPx controllers.

3) disable, by default, the SSP0/SPI1 and SSP1/SPI2 shared pinout;
   shared pin should be enable in board specific dts, as needed.
---
Changes from v1 to v2:
* Update the patch as per the feedback received from:
  Arnd: http://permalink.gmane.org/gmane.linux.ports.arm.kernel/493250
  - Start subject with "ARM" instead of "arm".
  - Add a multi-line description for trivial patches.
  Vladimir: http://permalink.gmane.org/gmane.linux.ports.arm.kernel/493323
            http://permalink.gmane.org/gmane.linux.ports.arm.kernel/493324
  - Remove "clock-names" property.
  - Switch patch #2 and #3 order.
* Rebased on the following patch:
  http://permalink.gmane.org/gmane.linux.drivers.devicetree/164584/

Sylvain Lemieux (3):
  ARM: dts: lpc32xx: add clock properties to spi nodes
  ARM: dts: phy3250: enable ssp0
  ARM: dts: lpc32xx: disabled ssp0/spi1 & ssp1/spi2 by default

 arch/arm/boot/dts/lpc32xx.dtsi | 14 ++++++++++++++
 arch/arm/boot/dts/phy3250.dts  |  1 +
 2 files changed, 15 insertions(+)

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
