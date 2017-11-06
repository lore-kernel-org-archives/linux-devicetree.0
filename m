From: Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/4] arm64: defconfig: enable additional led triggers
Date: Mon,  6 Nov 2017 12:38:12 +0530
Message-ID: <cover.1509951550.git.amit.kucheria@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset enables the kernel panic and disk-activity trigger for LEDs
and then enables the panic trigger for three 96Boards - DB410c, Hikey and
Hikey960.

DB410c and Hikey panic behaviour has been tested by triggering a panic
through /proc/sysrq-trigger, while Hikey960 is only compile-tested.


Amit Kucheria (4):
  arm64: defconfig: enable new trigger modes for leds
  arm64: dts: qcom: apq8016-sbc: Allow USR4 LED to notify kernel panic
  arm64: dts: hisilicon: hi6220-hikey: Allow USR1 LED to notify kernel
    panic
  arm64: dts: hisilicon: hi3660-hikey960: Allow USR4 LED to notify
    kernel panic

 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 1 +
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts    | 1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi         | 1 +
 arch/arm64/configs/defconfig                      | 2 ++
 4 files changed, 5 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
