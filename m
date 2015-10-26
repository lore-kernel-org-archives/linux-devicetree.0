From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 9/9] ARM: config: Enable GPIO Led driver in stm32_defconfig
Date: Mon, 26 Oct 2015 14:42:41 +0100
Message-ID: <CACRpkdZZ_T24+Zx5Auv1cs0wUF=UycVxo7mLFosDrfz2Quw9uw@mail.gmail.com>
References: <1445102604-11502-1-git-send-email-mcoquelin.stm32@gmail.com>
	<1445102604-11502-10-git-send-email-mcoquelin.stm32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1445102604-11502-10-git-send-email-mcoquelin.stm32@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 17, 2015 at 7:23 PM, Maxime Coquelin
<mcoquelin.stm32@gmail.com> wrote:

> Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> ---
>  arch/arm/configs/stm32_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
> index 4725fab..92ade2e 100644
> --- a/arch/arm/configs/stm32_defconfig
> +++ b/arch/arm/configs/stm32_defconfig
> @@ -52,6 +52,7 @@ CONFIG_SERIAL_STM32_CONSOLE=y
>  # CONFIG_USB_SUPPORT is not set
>  CONFIG_NEW_LEDS=y
>  CONFIG_LEDS_CLASS=y
> +CONFIG_LEDS_GPIO=y
>  CONFIG_LEDS_TRIGGERS=y
>  CONFIG_LEDS_TRIGGER_HEARTBEAT=y

You even have triggers and heartbeat in your defconfig, even
more reason to set it up as default trigger in the DT.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
