From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 0/4] Add support for STM32F4 DAC
Date: Mon, 10 Jul 2017 15:23:56 +0200
Message-ID: <1499693040-12994-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for STM32F4 Digital to Analog Converter variant into
existing STM32 DAC driver.
Introduce compatible associated with configuration data.
BTW, fix error message in driver probe (minor).

Fabrice Gasnier (4):
  dt-bindings: iio: stm32-dac: add support for STM32F4
  iio: dac: stm32: fix error message
  iio: dac: stm32: add support for stm32f4
  ARM: dts: stm32: Add DAC support on stm32f429

 .../devicetree/bindings/iio/dac/st,stm32-dac.txt   |  4 ++-
 arch/arm/boot/dts/stm32f429.dtsi                   | 25 ++++++++++++++
 drivers/iio/dac/stm32-dac-core.c                   | 38 ++++++++++++++++++----
 drivers/iio/dac/stm32-dac.c                        |  2 +-
 4 files changed, 60 insertions(+), 9 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
