Return-Path: <SRS0=gJgO=WW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42798 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfHZWA0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 26 Aug 2019 18:00:26 -0400
Date: Mon, 26 Aug 2019 15:00:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] Input: tsc2007 - use GPIO descriptor
Message-ID: <20190826220022.GA7663@dtor-ws>
References: <20190823071021.5598-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190823071021.5598-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org, Denis Carikli <denis@eukrea.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, "H . Nikolaus Schaller" <hns@goldelico.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Linus,

On Fri, Aug 23, 2019 at 09:10:21AM +0200, Linus Walleij wrote:
> This switches the TSC2007 to use a GPIO descriptor to read
> the pendown GPIO line.
> 
> As this will make the gpiolib start to respect polarity
> inversion flags on the GPIO lines, drop the inversion when
> reading the line with gpio_get_value(), fix two offenders
> in the i.MX device trees, and also emphasize the importance
> of marking the polarity right in the device tree bindings.
> 
> Cc: Denis Carikli <denis@eukrea.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Drop inversion on the GPIO descriptor value, rely on the
>   gpiolib to handle polarity inversion.
> - Comb through device trees, identify two offenders, fix
>   them as part of the patch for a clean cut.
> - Also fix the device tree bindings.
> ---
>  .../bindings/input/touchscreen/tsc2007.txt         |  5 +++--
>  arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi       |  3 ++-
>  arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi       |  3 ++-
>  drivers/input/touchscreen/tsc2007.h                |  4 +++-
>  drivers/input/touchscreen/tsc2007_core.c           | 14 +++++++-------
>  5 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt b/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> index ed00f61b8c08..b08b54d49699 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
> @@ -7,7 +7,8 @@ Required properties:
>  
>  Optional properties:
>  - gpios: the interrupt gpio the chip is connected to (trough the penirq pin).
> -  The penirq pin goes to low when the panel is touched.
> +  The penirq pin goes to low when the panel is touched, so make sure to tag
> +  the GPIO line with GPIO_ACTIVE_LOW.

I think this is too strong. I am sure that one can come up with a way to
connect the attention signal though polarity inverter and then one would
have to specify GPIO_ACTIVE_HIGH in the DT.

Can we say:

The penirq pin goes to low when the panel is touched, so GPIO line
should normally be tagged with GPIO_ACTIVE_LOW.

Thanks.

-- 
Dmitry
