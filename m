From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v4 1/6] pinctrl: amlogic: gxbb: add the IR remote pin
Date: Fri, 19 Aug 2016 15:23:19 -0700
Message-ID: <7h4m6g7608.fsf@baylibre.com>
References: <20160628191802.21227-1-martin.blumenstingl@googlemail.com>
        <20160819215547.20063-1-martin.blumenstingl@googlemail.com>
        <20160819215547.20063-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160819215547.20063-2-martin.blumenstingl@googlemail.com>
        (Martin Blumenstingl's message of "Fri, 19 Aug 2016 23:55:42 +0200")
Sender: linux-gpio-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, narmstrong@baylibre.com, carlo@caione.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, mchehab@kernel.org, will.deacon@arm.com, catalin.marinas@arm.com, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This adds the IR remote receiver to the AO domain devices.

nit Re: Subject: should specify IR remote *input* pin.

> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> index cb4d6ad..8fffb31 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> @@ -225,6 +225,8 @@ static const unsigned int i2c_sda_ao_pins[] = {PIN(GPIOAO_5, 0) };
>  static const unsigned int i2c_slave_sck_ao_pins[] = {PIN(GPIOAO_4, 0) };
>  static const unsigned int i2c_slave_sda_ao_pins[] = {PIN(GPIOAO_5, 0) };
>  
> +static const unsigned int ir_in_ao_pins[] = {PIN(GPIOAO_7, 0) };
> +

I'm trying to keep the names here so they match the datasheet, which
calls this remote_input_ao.  Please update throughout the patch.

Otherwise looks good to me.  Feel free to add

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

and Linus W can queue it up.

Thanks,

Kevin
