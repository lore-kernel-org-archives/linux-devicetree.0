From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 00/12] ARM: dts: Add dragonboard-600c support.
Date: Wed, 23 Mar 2016 19:46:06 +0000
Message-ID: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

This patchset adds support to Dragonboard 600c which is based on APQ8064.

With this patchset, except spi I was able to test all the below features
on this board on top of linus master branch.
1> i2c
2> spi
3> sd/mmc with card detect
4> eMMC
5> USB
6> SATA
7> on board Ethernet based on PCIE.
8> user and activity leds.

AHCI SATA is broken on APQ8064 on mainline, due to changes in libahci, fix is
being discussed which should not effect this dt patches anyway.
This patchset also has a fix to i2c/spi pinctrls which was not set correctly
in my previous apq8064 patches, I have verified this patchset with eeprom and
sensors on the board, you might want to take that patch in next rc.

Thanks,
srini

Srinivas Kandagatla (12):
  ARM: dts: apq8064: fix the pinctrls for i2c and spi
  ARM: dts: apq8064: add support to gsbi1 uart
  ARM: dts: apq8064: add gsbi7 i2c support
  ARM: dts: dragonboard-600c: add board support with serial
  ARM: dts: dragonboard-600c: add pmic regulator supplies
  ARM: dts: dragonboard-600c: Add eMMC and SD card support
  ARM: dts: dragonboard-600c: add usb support
  ARM: dts: dragonboard-600c: add pcie support
  ARM: dts: dragonboard-600c: add on board sata support.
  ARM: dts: dragonboard-600c: Add on board leds support
  ARM: dts: dragonboard-600c: add i2c support
  ARM: dts: dragonboard-600c: add spi support

 arch/arm/boot/dts/Makefile                         |   1 +
 .../arm/boot/dts/qcom-apq8064-dragonboard-600c.dts | 377 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8064-pins.dtsi           |  39 +++
 arch/arm/boot/dts/qcom-apq8064.dtsi                |  41 ++-
 4 files changed, 452 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
