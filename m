From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 0/5] STM32 Independant watchdog
Date: Tue, 28 Mar 2017 20:00:57 -0700
Message-ID: <1390e264-2b54-c07b-89d3-9f5dd7d7254e@roeck-us.net>
References: <1490195083-25117-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490195083-25117-1-git-send-email-yannick.fertre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Subject: s/Independant/Independent/

On 03/22/2017 08:04 AM, Yannick Fertre wrote:
> Version 3:
> - Update typo into  bindings file
> - Reorder node in devicetree (ordering by address)
> - Remove unecessary lines in commits
>
> Version 2:
> - Add commit messages
>
> Version 1:
> - Initial commit
>
> The purpose of this set of patches is to add a new watchdog driver for
> stm32f429.
> This driver was developed and tested on evaluation board stm32429i.
>
> Yannick Fertre (5):
>   dt-bindings: Document STM32 IWDG bindings
>   drivers: watchdog: Add STM32 IWDG driver
>   ARM: dts: stm32: Add watchdog support for STM32F429 SoC
>   ARM: dts: stm32: Add watchdog support for STM32F429 eval board
>   ARM: configs: Add watchdog support in STM32 defconfig
>
>  .../devicetree/bindings/watchdog/st,stm32-iwdg.txt |  15 ++
>  arch/arm/boot/dts/stm32429i-eval.dts               |   4 +
>  arch/arm/boot/dts/stm32f429.dtsi                   |   9 +-
>  arch/arm/configs/stm32_defconfig                   |   1 +
>  drivers/watchdog/Kconfig                           |  11 +
>  drivers/watchdog/Makefile                          |   1 +
>  drivers/watchdog/stm32_iwdg.c                      | 289 +++++++++++++++++++++
>  7 files changed, 329 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
>  create mode 100644 drivers/watchdog/stm32_iwdg.c
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
