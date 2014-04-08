From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 0/2] ARM: dts: keystone: i2c updates
Date: Tue, 8 Apr 2014 14:46:05 +0300
Message-ID: <1396957567-14540-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: ivan.khoronzhuk-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Santosh,

There are two small non critical fixes for Keystone 2 I2C DT definitions.

Changes in v2;
- added additional patch to move i2c0 device node from SoC to board files
- updated commits messages

Grygorii Strashko (2):
  ARM: dts: keystone: add cell's information to i2c nodes
  ARM: dts: keystone: move i2c0 device node from SoC to board files

 arch/arm/boot/dts/k2e-evm.dts   |    7 +++++++
 arch/arm/boot/dts/k2hk-evm.dts  |    7 +++++++
 arch/arm/boot/dts/k2l-evm.dts   |    7 +++++++
 arch/arm/boot/dts/keystone.dtsi |    9 ++++-----
 4 files changed, 25 insertions(+), 5 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
