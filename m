From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/4] ARM: dts: keystone: fixes
Date: Wed, 1 Oct 2014 13:37:30 +0300
Message-ID: <1412159854-21143-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Snatosh,

This small set of DTS fixes for Keystone 2 SoCs, which
I've done while testing kernel boot on linux-next (3.18).

Grygorii Strashko (4):
  ARM: dts: keystone: fix io range for usb_phy
  ARM: dts: keystone-k2e: update usb1 node for dma properties
  ARM: dts: keystone-k2e: fix mdio io start address
  ARM: dts: keystone-k2l: fix mdio io start address

 arch/arm/boot/dts/k2e.dtsi      | 6 ++++++
 arch/arm/boot/dts/k2l.dtsi      | 4 ++++
 arch/arm/boot/dts/keystone.dtsi | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
