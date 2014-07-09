From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/3] ARM: keystone: enable mdio support
Date: Wed, 9 Jul 2014 16:14:17 +0300
Message-ID: <1404911660-10047-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ivan.khoronzhuk-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT definitions for Keystone 2 MDIO module and Ethernet PHYs for Keystone
EVMK2HX evm. And enable MDIO support for Keystone 2 SoCs.

Grygorii Strashko (3):
  ARM: dts: keystone: add mdio devices entries
  ARM: dts: keystone-evm: add 1g ethernet phys nodes
  ARM: keystone_defconfig: enable mdio and marvell eth phys

 arch/arm/boot/dts/k2hk-evm.dts      |   12 ++++++++++++
 arch/arm/boot/dts/keystone.dtsi     |   11 +++++++++++
 arch/arm/configs/keystone_defconfig |    2 ++
 3 files changed, 25 insertions(+)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
