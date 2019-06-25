From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v13 04/13] mfd: Add Ingenic TCU driver
Date: Tue, 25 Jun 2019 19:47:32 +0200
Message-ID: <1561484852.10069.0@crapouillou.net>
References: <20190624225759.18299-1-paul@crapouillou.net>
        <20190624225759.18299-5-paul@crapouillou.net>
        <20190625173026.dbvx44iwywnijjql@pburton-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625173026.dbvx44iwywnijjql@pburton-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Mathieu Malaterre <malat@debian.org>, od@zcrc.me, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org



Le mar. 25 juin 2019 =E0 19:30, Paul Burton <paul.burton@mips.com> a=20
=E9crit :
> Hi Paul,
>=20
> On Tue, Jun 25, 2019 at 12:57:50AM +0200, Paul Cercueil wrote:
>>  +static const struct of_device_id ingenic_tcu_of_match[] =3D {
>>  +	{ .compatible =3D "ingenic,jz4740-tcu", .data =3D &jz4740_soc_info, }=
,
>>  +	{ .compatible =3D "ingenic,jz4725b-tcu", .data =3D &jz4725b_soc_info,=
=20
>> },
>>  +	{ .compatible =3D "ingenic,jz4770-tcu", .data =3D &jz4740_soc_info, }=
,
>>  +	{ }
>>  +};
>=20
> Nit: why not order these numerically? ie. 25b, 40, 70.

They are in chronological order - the jz4725b is newer than the jz4740.

>>  +static struct regmap * __init ingenic_tcu_create_regmap(struct=20
>> device_node *np)
>>  +{
>>  +	struct resource res;
>>  +	void __iomem *base;
>>  +	struct regmap *map;
>>  +
>>  +	if (!of_match_node(ingenic_tcu_of_match, np))
>>  +		return ERR_PTR(-EINVAL);
>>  +
>>  +	base =3D of_io_request_and_map(np, 0, "TCU");
>>  +	if (IS_ERR(base))
>>  +		return ERR_PTR(PTR_ERR(base));
>=20
> This is equivalent to:
>=20
>     return ERR_CAST(base);

Alright - I'll fix it in a following patch if this V13 gets merged,
or in the V14 patchset.

> Apart from those:
>=20
>     Reviewed-by: Paul Burton <paul.burton@mips.com>
>=20
> Thanks,
>     Paul

=
