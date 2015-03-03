From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH 4/6] gpio: arizona: Add support for WM8280/WM8281
Date: Tue, 3 Mar 2015 16:47:07 +0000
Message-ID: <20150303164707.GG32624@x1>
References: <1425399576-26428-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1425399576-26428-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425399576-26428-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, linus.walleij@linaro.org, gnurou@gmail.com, sameo@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org, rf@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 03 Mar 2015, Charles Keepax wrote:

> From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
>=20
> Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/gpio/gpio-arizona.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Applied, thanks.

Will send out pull-request once this has had time to soak in -next.=20

> diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.=
c
> index fe369f5..9665d0a 100644
> --- a/drivers/gpio/gpio-arizona.c
> +++ b/drivers/gpio/gpio-arizona.c
> @@ -116,6 +116,7 @@ static int arizona_gpio_probe(struct platform_dev=
ice *pdev)
>  	switch (arizona->type) {
>  	case WM5102:
>  	case WM5110:
> +	case WM8280:
>  	case WM8997:
>  		arizona_gpio->gpio_chip.ngpio =3D 5;
>  		break;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
