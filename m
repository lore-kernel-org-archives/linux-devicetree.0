From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 00/11] Hi Maxime / Patrice / Srini,
Date: Mon, 28 Sep 2015 13:37:36 +0100
Message-ID: <1443443867-4099-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series makes a series of updates to the stih407 pinctrl groups
and makes the upstream kernel more closely aligned in terms of pin
configuration to the vendor kernel.

A number of new periphs are added such as spi fsm, nand, cec0, and
for others such as SPI the various alternate function pin muxings have
been added. Finally for SPI the controller nodes have been updated
to have the default pin assignment in the controller node.

Changes since v1:
 - Rebase on v4.3-rc3
 - Remove some SoBs (Lee)
 - Collect up Acks

kind regards,

Peter.

Peter Griffin (11):
  ARM: STi: DT: STiH407: Add a cec0 pin definition
  ARM: STi: DT: STiH407: Add i2c3 alternate pin configs
  ARM: DT: STiH407: Add SPI 3 wire and 4 wire pinctrl configs
  ARM: DT: STiH407: Add serial3 pinctrl configuration
  ARM: DT: STiH407: Add SPI FSM (NOR Flash) Controller pin config
  ARM: DT: STiH407: Add NAND flash controller pin configuration
  ARM: DT: STiH407: Add systrace pin configuration
  ARM: DT: STiH407: Add SD pinctrl config for mmc0 controller
  ARM: DT: STiH407: Add pinconfig for IRB UHF and IRB TX
  ARM: DT: STiH407: Add RMII pinctrl support
  ARM: STi: STiH407: Add spi default pinctrl groups.

 arch/arm/boot/dts/stih407-family.dtsi  |  14 ++
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 378 ++++++++++++++++++++++++++++++++-
 2 files changed, 387 insertions(+), 5 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
