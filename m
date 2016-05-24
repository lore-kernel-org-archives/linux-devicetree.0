From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V12 2/2] pinctrl: max77620: add pincontrol driver for MAX77620/MAX20024
Date: Tue, 24 May 2016 13:21:08 +0200
Message-ID: <CACRpkdZNDEL855=Mruwm4U7eFz-QiuvXuDP83QPOupkpj2Jpkg@mail.gmail.com>
References: <1463116755-30469-1-git-send-email-ldewangan@nvidia.com>
	<1463116755-30469-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463116755-30469-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 13, 2016 at 7:19 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO pins
> which also act as the special function in alternate mode. Also
> there is configuration like push-pull, open drain, FPS timing
> etc for these pins.
>
> Add pin control driver to configure these parameters through
> pin control APIs.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Patch applied for the next kernel cycle.

> +       switch (param) {
> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +               if (mpci->pin_info[pin].drv_type == MAX77620_PIN_OD_DRV)
> +                       arg = 1;
> +               break;

Hmmmm OK is this one of those cases we discussed where
you need to be able to tell the pin config back-end to do the
open draining (etc) from the GPIO driver?

Yours,
Linus Walleij
