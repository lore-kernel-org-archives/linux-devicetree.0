From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/2] mfd: stmpe: support gpio over irq under device
 tree
Date: Mon, 15 Sep 2014 16:12:43 -0700
Message-ID: <20140915231243.GL25162@lee--X1>
References: <1410491914-23378-1-git-send-email-xobs@kosagi.com>
 <1410491914-23378-2-git-send-email-xobs@kosagi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1410491914-23378-2-git-send-email-xobs@kosagi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Cross <xobs@kosagi.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, bunnie@kosagi.com
List-Id: devicetree@vger.kernel.org

On Fri, 12 Sep 2014, Sean Cross wrote:

> The stmpe_platform_data has a irq_over_gpio field, which allows the
> system to read STMPE events whenever an IRQ occurs on a GPIO pin.
> This patch adds the ability to configure this field and to use a GPIO
> as an IRQ source for boards configuring the STMPE in device tree.
>=20
> Signed-off-by: Sean Cross <xobs@kosagi.com>
> ---
>  drivers/mfd/stmpe.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> index 3b6bfa7..4c42b05 100644
> --- a/drivers/mfd/stmpe.c
> +++ b/drivers/mfd/stmpe.c
> @@ -1122,7 +1122,12 @@ static void stmpe_of_probe(struct stmpe_platfo=
rm_data *pdata,
>  	if (pdata->id < 0)
>  		pdata->id =3D -1;
> =20
> -	pdata->irq_trigger =3D IRQF_TRIGGER_NONE;
> +	pdata->irq_gpio =3D of_get_named_gpio_flags(np, "irq-gpio", 0,
> +				&pdata->irq_trigger);
> +	if (gpio_is_valid(pdata->irq_gpio))
> +		pdata->irq_over_gpio =3D 1;
> +	else
> +		pdata->irq_trigger =3D IRQF_TRIGGER_NONE;
> =20
>  	of_property_read_u32(np, "st,autosleep-timeout",
>  			&pdata->autosleep_timeout);

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
