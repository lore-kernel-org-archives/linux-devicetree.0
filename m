From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: syscon: Allow to using subdevices
Date: Thu, 14 Nov 2013 14:44:56 +0000
Message-ID: <20131114144456.GB4996@lee--X1>
References: <1384433523-30602-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1384433523-30602-1-git-send-email-shc_work@mail.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

> This patch adds support for using subdevices within syscon node.
> Primary usage of this is describe all devices with same memory
> region in one container.

Can you show me an example where people have placed devices as
children to syscon?

> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/mfd/syscon.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 71841f9..6e9244a 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -152,6 +152,9 @@ static int syscon_probe(struct platform_device *p=
dev)
> =20
>  	platform_set_drvdata(pdev, syscon);
> =20
> +	if (of_platform_populate(dev->of_node, NULL, NULL, dev))
> +		dev_warn(dev, "Fail to create subdevices\n");
> +
>  	dev_info(dev, "regmap %pR registered\n", res);
> =20
>  	return 0;
> --=20
> 1.8.1.5
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
