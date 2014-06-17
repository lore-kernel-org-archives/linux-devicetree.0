From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 11/21] mfd: use devm_irq_of_parse_and_map() where
 appropriate
Date: Tue, 17 Jun 2014 16:12:26 +0100
Message-ID: <20140617151226.GM29841@lee--X1>
References: <1401880402-30091-1-git-send-email-nyushchenko@dev.rtsoft.ru>
 <1401880402-30091-12-git-send-email-nyushchenko@dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1401880402-30091-12-git-send-email-nyushchenko@dev.rtsoft.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: nyushchenko@dev.rtsoft.ru
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, lugovskoy@dev.rtsoft.ru
List-Id: devicetree@vger.kernel.org

> From: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>
>=20
> This avoids leak of IRQ mapping on error paths, and makes it possible
> to use devm_request_irq() without facing unmap-while-handler-installe=
d
> issues.
>=20
> Signed-off-by: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>
> ---
>  drivers/mfd/max8997.c |    4 +++-
>  drivers/mfd/max8998.c |    4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
> index 8cf7a01..6ae0786 100644
> --- a/drivers/mfd/max8997.c
> +++ b/drivers/mfd/max8997.c
> @@ -153,7 +153,9 @@ static struct max8997_platform_data *max8997_i2c_=
parse_dt_pdata(
>  		return ERR_PTR(-ENOMEM);
>  	}
> =20
> -	pd->ono =3D irq_of_parse_and_map(dev->of_node, 1);
> +	pd->ono =3D devm_irq_of_parse_and_map(dev, dev->of_node, 1);
> +	if (pd->ono < 0)
> +		return ERR_PTR(pd->ono);
> =20
>  	/*
>  	 * ToDo: the 'wakeup' member in the platform data is more of a linu=
x
> diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
> index 592db06..6b62dd7 100644
> --- a/drivers/mfd/max8998.c
> +++ b/drivers/mfd/max8998.c
> @@ -159,7 +159,9 @@ static struct max8998_platform_data *max8998_i2c_=
parse_dt_pdata(
>  	if (!pd)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	pd->ono =3D irq_of_parse_and_map(dev->of_node, 1);
> +	pd->ono =3D devm_irq_of_parse_and_map(dev, dev->of_node, 1);
> +	if (pd->ono < 0)
> +		return ERR_PTR(pd->ono);
> =20
>  	/*
>  	 * ToDo: the 'wakeup' member in the platform data is more of a linu=
x

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
