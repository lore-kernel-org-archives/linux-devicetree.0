From: <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 0/4] Add STM32 Reset Driver
Date: Thu, 21 Jul 2016 11:19:24 +0200
Message-ID: <1469092768-17489-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, patrice.chotard-qxv4g6HH51o@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>

v2:
 - switch to the non-relaxed variants
 - describe dt-binfings in one place

The STM32 MCUs family IPs can be reset by accessing some registers
from the RCC block.

Gabriel Fernandez (1):
  ARM: dts: stm32f429: add missing #reset-cells of rcc

Maxime Coquelin (3):
  dt-bindings: mfd: Add STM32F4 RCC numeric constants into DT include
    file
  dt-bindings: Document the STM32 reset bindings
  drivers: reset: Add STM32 reset driver

 .../devicetree/bindings/clock/st,stm32-rcc.txt     |  42 ++++++--
 .../devicetree/bindings/reset/st,stm32-rcc.txt     |   6 ++
 arch/arm/boot/dts/stm32f429.dtsi                   |   1 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-stm32.c                        | 113 +++++++++++++++++++++
 include/dt-bindings/mfd/stm32f4-rcc.h              |  98 ++++++++++++++++++
 6 files changed, 254 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
 create mode 100644 drivers/reset/reset-stm32.c
 create mode 100644 include/dt-bindings/mfd/stm32f4-rcc.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
