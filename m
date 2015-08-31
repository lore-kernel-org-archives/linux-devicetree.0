From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller.
Date: Tue, 1 Sep 2015 00:36:22 +0200
Message-ID: <201509010036.22605.marex@denx.de>
References: <1440148851-14621-1-git-send-email-marex@denx.de> <1440148851-14621-2-git-send-email-marex@denx.de> <55E48F3D.3030800@opensource.altera.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55E48F3D.3030800-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Vikas MANOCHA <vikas.manocha-qxv4g6HH51o@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday, August 31, 2015 at 07:30:37 PM, Graham Moore wrote:
> Hi Marek,

Hi Graham,

> Having some compile issues...see below
>=20
> On 08/21/2015 04:20 AM, Marek Vasut wrote:
> > From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> >=20
> > Add support for the Cadence QSPI controller. This controller is
> > present in the Altera SoCFPGA SoCs and this driver has been tested
> > on the Cyclone V SoC.
> >=20
> > Signed-off-by: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
>=20
> [...]
>=20
> > +static int cqspi_set_protocol(struct spi_nor *nor, enum spi_protoc=
ol
> > proto) +{
> > +	struct cqspi_flash_pdata *f_pdata =3D nor->priv;
> > +
> > +	switch (proto) {
> > +	case SPI_PROTO_1_1_1:
> > +	case SPI_PROTO_1_1_2:
> > +	case SPI_PROTO_1_1_4:
> > +	case SPI_PROTO_1_2_2:
> > +	case SPI_PROTO_1_4_4:
> > +		f_pdata->inst_width =3D CQSPI_INST_TYPE_SINGLE;
> > +		break;
> > +	case SPI_PROTO_2_2_2:
> > +		f_pdata->inst_width =3D CQSPI_INST_TYPE_DUAL;
> > +		break;
> > +	case SPI_PROTO_4_4_4:
> > +		f_pdata->inst_width =3D CQSPI_INST_TYPE_QUAD;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	switch (proto) {
> > +	case SPI_PROTO_1_1_1:
> > +	case SPI_PROTO_1_1_2:
> > +	case SPI_PROTO_1_1_4:
> > +		f_pdata->addr_width =3D CQSPI_INST_TYPE_SINGLE;
> > +		break;
> > +	case SPI_PROTO_1_2_2:
> > +	case SPI_PROTO_2_2_2:
> > +		f_pdata->addr_width =3D CQSPI_INST_TYPE_DUAL;
> > +		break;
> > +	case SPI_PROTO_1_4_4:
> > +	case SPI_PROTO_4_4_4:
> > +		f_pdata->addr_width =3D CQSPI_INST_TYPE_QUAD;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
>=20
> I think you have some other patches in your tree, the above doesn't
> compile on l2-mtd/master:
>=20
> ~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:57: warning: =E2=80=
=98enum
> spi_protocol=E2=80=99 declared inside parameter list [enabled by defa=
ult]
> ~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:57: warning: its
> scope is only this definition or declaration, which is probably not w=
hat
> you want [enabled by default]
> ~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:70: error: paramet=
er
> 2 (=E2=80=98proto=E2=80=99) has incomplete type

It's in the V7 changelog, you need:

mtd: spi-nor: notify (Q)SPI controller about protocol change

Also, since V8, you will need:

mtd: spi-nor: Decouple SPI NOR's device_node from controller device

They're both in the linux-mtd list, so feel free to pick them from ther=
e.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
