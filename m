From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH linux-next v2 10/14] mtd: spi-nor: configure the number of
 dummy clock cycles on Macronix memories
Date: Fri, 29 Jan 2016 14:29:54 +0100
Message-ID: <56AB6952.90701@atmel.com>
References: <cover.1452268345.git.cyrille.pitchen@atmel.com>
 <caaf19555ae684e0a1ccdd79cd7326ee1fbf1197.1452268345.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <caaf19555ae684e0a1ccdd79cd7326ee1fbf1197.1452268345.git.cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, vigneshr-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

I've found a small issue within this patch when I test with a Macronix
mx25l51245g (JEDEC ID C2201A so reported as "mx66l51235l" by spi-nor.c)=
=2E
It deals with a wrong op code used when reading the Configuration Regis=
ter.
See below for more details.

So I will send a new patch to fix this issue.

Otherwise, I tested on a sama5d2 xplained board and it works :)


Le 08/01/2016 17:02, Cyrille Pitchen a =E9crit :
> The spi-nor framework currently expects all Fast Read operations to u=
se 8
> dummy clock cycles. Especially some drivers like m25p80 can only supp=
ort
> multiple of 8 dummy clock cycles.
>=20
> On Macronix memories, the number of dummy clock cycles to be used by =
=46ast
> Read commands can be safely set to 8 by updating the DC0 and DC1 vola=
tile
> bits inside the Configuration Register.
>=20
> According to the mx66l1g45g datasheet from Macronix, using 8 dummy cl=
ock
> cycles should be enough to set the SPI bus clock frequency up to:
> - 133 MHz for Fast Read 1-1-1, 1-1-2, 1-1-4 and 1-2-2 commands in Sin=
gle
>   Transfer Rate (STR)
> - 104 MHz for Fast Read 1-4-4 (or 4-4-4 in QPI mode) commands (STR)
>=20
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
[...]
> +static int macronix_set_dummy_cycles(struct spi_nor *nor, u8 read_du=
mmy)
> +{
> +	int ret, sr, cr, mask, val;
> +	u16 sr_cr;
> +	u8 dc;
> +
> +	/* Convert the number of dummy cycles into Macronix DC volatile bit=
s */
> +	ret =3D macronix_dummy2code(nor->read_opcode, read_dummy, &dc);
> +	if (ret)
> +		return ret;
> +
> +	mask =3D GENMASK(7, 6);
> +	val =3D (dc << 6) & mask;
> +
> +	cr =3D read_cr(nor);
Macronix memories use the 0x15 op code (not 0x35) to read the Configura=
tion Register.
The 0x35 op code is used to enter the QPI mode. So read_cr() cannot be =
used here.

> +	if (cr < 0) {
> +		dev_err(nor->dev, "error while reading the config register\n");
> +		return cr;
> +	}
> +
> +	if ((cr & mask) =3D=3D val) {
> +		nor->read_dummy =3D read_dummy;
> +		return 0;
> +	}
> +
> +	sr =3D read_sr(nor);
> +	if (sr < 0) {
> +		dev_err(nor->dev, "error while reading the status register\n");
> +		return sr;
> +	}
> +
> +	cr =3D (cr & ~mask) | val;
> +	sr_cr =3D (sr & 0xff) | ((cr & 0xff) << 8);
> +	write_enable(nor);
> +	ret =3D write_sr_cr(nor, sr_cr);
> +	if (ret) {
> +		dev_err(nor->dev,
> +			"error while writing the SR and CR registers\n");
> +		return ret;
> +	}
> +
> +	ret =3D spi_nor_wait_till_ready(nor);
> +	if (ret)
> +		return ret;
> +
> +	cr =3D read_cr(nor);
Here again, we must use the 0x15 op code instead of 0x35.

> +	if (cr < 0 || (cr & mask) !=3D val) {
> +		dev_err(nor->dev, "Macronix Dummy Cycle bits not updated\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Save the number of dummy cycles to use with Fast Read commands *=
/
> +	nor->read_dummy =3D read_dummy;
> +	return 0;
> +}
> +

Best regards,

Cyrille
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
