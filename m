From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: keystone: fix and updates
Date: Thu, 18 Sep 2014 20:15:21 +0300
Message-ID: <1411060524-25077-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Santosh,

This serie contains fix of SPI nodes DT defintions for Keystone K2L  SoC.

Also It adds DT definitions for Keystone 2 DSP GPIO and IRQ controllers.


Grygorii Strashko (2):
  ARM: dts: keystone: add keystone irq controller node
  ARM: dts: keystone: add dsp gpio controllers nodes

Murali Karicheri (1):
  ARM: dts: keystone: k2l: Fix chip selects for SPI devices

 arch/arm/boot/dts/k2e.dtsi      |  7 ++++++
 arch/arm/boot/dts/k2hk.dtsi     | 56 +++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/k2l.dtsi      | 42 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/keystone.dtsi |  8 ++++++
 4 files changed, 113 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
