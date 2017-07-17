From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [RESEND RFC PATCH] ARM: dts: stm32: change pinctrl bindings definition
Date: Mon, 17 Jul 2017 18:23:49 +0200
Message-ID: <1500308630-14364-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Initially each pin was declared in "include/dt-bindings/stm32f429-pinfunc.h"
and each definition contained SOC names (ex: STM32F429_PA9_FUNC_USART1_TX).
Since this approach was approved, the number of supported MCU has
increased (STM32F429/STM32F469/STM32f746/STM32H743). To avoid to add a new
file in "include/dt-bindings" each time a new STM32 SOC arrives I propose
a new approach which consist to use a macro to define pin muxing in device
tree. All STM32 DT will use the common macro to define pinmux. Furthermore, it
will make easy maintenance and integration of new SOC.

To check that patch generate same dtb than befrore I used dtc binary to (re)generate dts files
(before and after apply the series).
Example on stm32f469-disco:

./scripts/dtc/dtc -I dtb -O dts -o stm32f469-disco-after.dts
stm32f469-disco-after.dtb

./scripts/dtc/dtc -I dtb -O dts -o stm32f469-disco-before.dts
stm32f469-disco-before.dtb

Then diff -u stm32f469-disco-before.dts stm32f469-disco-after.dts

Regards
Alex

Alexandre TORGUE (1):
  ARM: dts: stm32: change pinctrl bindings definition

 arch/arm/boot/dts/stm32f429.dtsi                |  176 ++--
 include/dt-bindings/pinctrl/stm32-pinfunc.h     |   61 ++
 include/dt-bindings/pinctrl/stm32f429-pinfunc.h | 1239 -----------------------
 3 files changed, 149 insertions(+), 1327 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/stm32-pinfunc.h
 delete mode 100644 include/dt-bindings/pinctrl/stm32f429-pinfunc.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
