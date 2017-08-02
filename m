From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] ARM: dts: stm32: change pinctrl bindings definition
Date: Wed, 2 Aug 2017 11:32:33 +0200
Message-ID: <CACRpkdY+_W7uTK+CRqHRrS2gHYjQkhQeNHjWvOSNazq_YpE-uw@mail.gmail.com>
References: <1500289258-3700-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500289258-3700-1-git-send-email-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 17, 2017 at 1:00 PM, Alexandre TORGUE
<alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:

> Initially each pin was declared in "include/dt-bindings/stm32f429-pinfunc.h"
> and each definition contained SOC names (ex: STM32F429_PA9_FUNC_USART1_TX).
> Since this approach was approved, the number of supported MCU has
> increased (STM32F429/STM32F469/STM32f746/STM32H743). To avoid to add a new
> file in "include/dt-bindings" each time a new STM32 SOC arrives I propose
> a new approach which consist to use a macro to define pin muxing in device
> tree. All STM32 DT will use the common macro to define pinmux. Furthermore, it
> will make easy maintenance and integration of new SOC.
>
> To check that patch generate same dtb than befrore I used dtc binary to (re)generate dts files
> (before and after apply the series).
> Example on stm32f469-disco:
>
> ./scripts/dtc/dtc -I dtb -O dts -o stm32f469-disco-after.dts
> stm32f469-disco-after.dtb
>
> ./scripts/dtc/dtc -I dtb -O dts -o stm32f469-disco-before.dts
> stm32f469-disco-before.dtb
>
> Then diff -u stm32f469-disco-before.dts stm32f469-disco-after.dts

Looks OK to me. I guess it should all be merged into ARM SoC.

Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
for the final version.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
