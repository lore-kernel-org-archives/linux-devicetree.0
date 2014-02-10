From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v3 0/4] ARM: keystone: enable gpio support
Date: Mon, 10 Feb 2014 18:41:17 +0200
Message-ID: <1392050481-19086-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ivan.khoronzhuk-l0cyMroinI0@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds Keystone GPIO IP definition in DT and enable GPIO support in
Keystone configuration file.

Also, it enables LEDs support for Keystone 2 K2H EVM as specified in board 
schematic. For more information see:
- http://www.advantech.com/Support/TI-EVM/EVMK2HX.aspx 

Changes in v3:
 - rebased on top 3.14 + "[PATCH v2] arm: dts: keystone: add watchdog entry"
   http://www.spinics.net/lists/devicetree/msg20211.html

[v1-v2] http://www.spinics.net/lists/arm-kernel/msg294655.html

Grygorii Strashko (4):
  ARM: dts: keystone: add gpio device entry
  ARM: dts: keystone-evm: add leds supports
  ARM: keystone_defconfig: enable gpio support
  ARM: keystone_defconfig: enable led support

 arch/arm/boot/dts/k2hk-evm.dts      |   23 ++++++++++++++++++
 arch/arm/boot/dts/keystone.dtsi     |   45 +++++++++++++++++++++++++++++++++++
 arch/arm/configs/keystone_defconfig |   11 +++++++++
 3 files changed, 79 insertions(+)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
