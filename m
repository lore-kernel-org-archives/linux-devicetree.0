From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/6] ARM: stm32: add initial STM32MPU support
Date: Fri, 8 Dec 2017 15:41:29 +0100
Message-ID: <4a21e715-43f8-c2be-a626-fe7977b167e8@baylibre.com>
References: <1512742277-28205-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512742277-28205-1-git-send-email-ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/12/2017 15:11, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> 
> This patch series extends the existing STM32 microcontrollers (MCUs)
> family to microprocessors (MPUs). The MPU platform (based on
> Arm Cortex-A) is a continuation of the MCU one (based on Arm
> Cortex-M) in that it shares a wide number of hardware blocks.
> 
> Ludovic Barre (6):
>   ARM: stm32: prepare stm32 family to welcome armv7 architecture
>   ARM: stm32: add initial support for STM32MP157
>   pinctrl: stm32: Add STM32MP157 MPU support
>   ARM: configs: multi_v7: add stm32 support
>   ARM: dts: stm32: add stm32mp157c initial support
>   ARM: dts: stm32: add initial support of stm32mp157c eval board
> 
>  Documentation/arm/stm32/overview.txt               |   21 +-
>  Documentation/arm/stm32/stm32mp157-overview.txt    |   12 +
>  Documentation/devicetree/bindings/arm/stm32.txt    |    1 +
>  .../bindings/pinctrl/st,stm32-pinctrl.txt          |    2 +
>  arch/arm/boot/dts/Makefile                         |    5 +-
>  arch/arm/boot/dts/stm32mp157-pinctrl.dtsi          |  185 ++
>  arch/arm/boot/dts/stm32mp157c-ed1.dts              |   29 +
>  arch/arm/boot/dts/stm32mp157c-ev1.dts              |   19 +
>  arch/arm/boot/dts/stm32mp157c.dtsi                 |  139 ++
>  arch/arm/configs/multi_v7_defconfig                |    2 +
>  arch/arm/mach-stm32/Kconfig                        |   48 +-
>  arch/arm/mach-stm32/Makefile                       |    3 +-
>  arch/arm/mach-stm32/{board-dt.c => board-mcu-dt.c} |    0
>  arch/arm/mach-stm32/board-mpu-dt.c                 |   16 +
>  drivers/pinctrl/stm32/Kconfig                      |    6 +
>  drivers/pinctrl/stm32/Makefile                     |    1 +
>  drivers/pinctrl/stm32/pinctrl-stm32mp157.c         | 2188 ++++++++++++++++++++
>  17 files changed, 2656 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/arm/stm32/stm32mp157-overview.txt
>  create mode 100644 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
>  create mode 100644 arch/arm/boot/dts/stm32mp157c-ed1.dts
>  create mode 100644 arch/arm/boot/dts/stm32mp157c-ev1.dts
>  create mode 100644 arch/arm/boot/dts/stm32mp157c.dtsi
>  rename arch/arm/mach-stm32/{board-dt.c => board-mcu-dt.c} (100%)
>  create mode 100644 arch/arm/mach-stm32/board-mpu-dt.c
>  create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32mp157.c
> 

Hi Ludovic,

This is great news !

But I couldn't find any announcement on ST ?

I'm curious, but which GPU will be embedded ?

The serie looks great, I don't have more comments on this.

Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
