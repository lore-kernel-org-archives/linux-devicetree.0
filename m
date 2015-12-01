From: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/9] pinctrl: Add support STM32 MCUs
Date: Tue, 1 Dec 2015 10:53:24 +0100
Message-ID: <CALszF6Cd=yei0m2Zs=+k=KT5RUzdesGWPK7PAQPdj_-Ouan=2A@mail.gmail.com>
References: <1445102604-11502-1-git-send-email-mcoquelin.stm32@gmail.com>
	<1445102604-11502-5-git-send-email-mcoquelin.stm32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445102604-11502-5-git-send-email-mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

2015-10-17 19:23 GMT+02:00 Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> This patch adds pinctrl and GPIO support to STMicroelectronic's STM32
> family of MCUs.
>
> While it only supports STM32F429 for now, it has been designed to enable
> support of other MCUs of the family (e.g. STM32F746).
>
> Signed-off-by: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/pinctrl/Kconfig                   |    1 +
>  drivers/pinctrl/Makefile                  |    1 +
>  drivers/pinctrl/stm32/Kconfig             |   16 +
>  drivers/pinctrl/stm32/Makefile            |    5 +
>  drivers/pinctrl/stm32/pinctrl-stm32.c     |  856 +++++++++++++++
>  drivers/pinctrl/stm32/pinctrl-stm32.h     |   43 +
>  drivers/pinctrl/stm32/pinctrl-stm32f429.c | 1598 +++++++++++++++++++++++++++++
>  7 files changed, 2520 insertions(+)
>  create mode 100644 drivers/pinctrl/stm32/Kconfig
>  create mode 100644 drivers/pinctrl/stm32/Makefile
>  create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32.c
>  create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32.h
>  create mode 100644 drivers/pinctrl/stm32/pinctrl-stm32f429.c
>

Gentle reminder, do you know when you will be able to review this driver?

Thanks in advance,
Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
