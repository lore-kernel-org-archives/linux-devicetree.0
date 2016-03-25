From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/4] STi DT updates
Date: Fri, 25 Mar 2016 15:36:24 +0000
Message-ID: <1458920188-29612-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

This series adds some more alternate pin configurations which were missing
upstream, the DT config for SSC12, and also a DT node for the 24c256 eeprom.

regards,

Peter.

Peter Griffin (4):
  ARM: DT: STiH407: Add UART RTS/CTS pin configuration
  ARM: DT: STiH407: Add i2c12 pin definition
  ARM: DT: STiH407: Add node for i2c12 controller
  ARM: STi: DT: STiH407: Add DT node for eeprom

 arch/arm/boot/dts/stih407-family.dtsi  | 13 ++++++
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 82 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stihxxx-b2120.dtsi   |  9 ++++
 3 files changed, 104 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
