From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH 0/2] Add reboot modes for LEGO MINDSTORMS EV3
Date: Thu, 11 Jan 2018 20:21:23 -0600
Message-ID: <1515723685-19286-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds a new device tree node to declare a special memory
address that is used by the I2C bootloader on LEGO MINDSTORMS EV3
to boot into a special firmware update mode and enables the required
module to use it.

David Lechner (2):
  ARM: dts: da850-lego-ev3: Add node for reboot modes
  ARM: davinci_all_defconfig: enable SYSCON_REBOOT_MODE

 arch/arm/boot/dts/da850-lego-ev3.dts   | 17 +++++++++++++++++
 arch/arm/configs/davinci_all_defconfig |  1 +
 2 files changed, 18 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
