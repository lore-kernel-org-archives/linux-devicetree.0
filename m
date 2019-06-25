From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v13 04/13] mfd: Add Ingenic TCU driver
Date: Tue, 25 Jun 2019 17:30:28 +0000
Message-ID: <20190625173026.dbvx44iwywnijjql@pburton-laptop>
References: <20190624225759.18299-1-paul@crapouillou.net>
 <20190624225759.18299-5-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624225759.18299-5-paul@crapouillou.net>
Content-Language: en-US
Content-ID: <9BAE9DD0984EBD4FBCD7F23175005B2A@namprd22.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Mathieu Malaterre <malat@debian.org>, "od@zcrc.me" <od@zcrc.me>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Artur Rojek <contact@artur-ro>
List-Id: devicetree@vger.kernel.org

Hi Paul,

On Tue, Jun 25, 2019 at 12:57:50AM +0200, Paul Cercueil wrote:
> +static const struct of_device_id ingenic_tcu_of_match[] =3D {
> +	{ .compatible =3D "ingenic,jz4740-tcu", .data =3D &jz4740_soc_info, },
> +	{ .compatible =3D "ingenic,jz4725b-tcu", .data =3D &jz4725b_soc_info, }=
,
> +	{ .compatible =3D "ingenic,jz4770-tcu", .data =3D &jz4740_soc_info, },
> +	{ }
> +};

Nit: why not order these numerically? ie. 25b, 40, 70.

> +static struct regmap * __init ingenic_tcu_create_regmap(struct device_no=
de *np)
> +{
> +	struct resource res;
> +	void __iomem *base;
> +	struct regmap *map;
> +
> +	if (!of_match_node(ingenic_tcu_of_match, np))
> +		return ERR_PTR(-EINVAL);
> +
> +	base =3D of_io_request_and_map(np, 0, "TCU");
> +	if (IS_ERR(base))
> +		return ERR_PTR(PTR_ERR(base));

This is equivalent to:

    return ERR_CAST(base);

Apart from those:

    Reviewed-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul
