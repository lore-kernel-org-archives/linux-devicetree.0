From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash
 Controller.
Date: Mon, 31 Aug 2015 12:30:37 -0500
Message-ID: <55E48F3D.3030800@opensource.altera.com>
References: <1440148851-14621-1-git-send-email-marex@denx.de> <1440148851-14621-2-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440148851-14621-2-git-send-email-marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Vikas MANOCHA <vikas.manocha-qxv4g6HH51o@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marek,

Having some compile issues...see below

On 08/21/2015 04:20 AM, Marek Vasut wrote:
> From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>
> Add support for the Cadence QSPI controller. This controller is
> present in the Altera SoCFPGA SoCs and this driver has been tested
> on the Cyclone V SoC.
>
> Signed-off-by: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>

[...]

> +static int cqspi_set_protocol(struct spi_nor *nor, enum spi_protocol=
 proto)
> +{
> +	struct cqspi_flash_pdata *f_pdata =3D nor->priv;
> +
> +	switch (proto) {
> +	case SPI_PROTO_1_1_1:
> +	case SPI_PROTO_1_1_2:
> +	case SPI_PROTO_1_1_4:
> +	case SPI_PROTO_1_2_2:
> +	case SPI_PROTO_1_4_4:
> +		f_pdata->inst_width =3D CQSPI_INST_TYPE_SINGLE;
> +		break;
> +	case SPI_PROTO_2_2_2:
> +		f_pdata->inst_width =3D CQSPI_INST_TYPE_DUAL;
> +		break;
> +	case SPI_PROTO_4_4_4:
> +		f_pdata->inst_width =3D CQSPI_INST_TYPE_QUAD;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (proto) {
> +	case SPI_PROTO_1_1_1:
> +	case SPI_PROTO_1_1_2:
> +	case SPI_PROTO_1_1_4:
> +		f_pdata->addr_width =3D CQSPI_INST_TYPE_SINGLE;
> +		break;
> +	case SPI_PROTO_1_2_2:
> +	case SPI_PROTO_2_2_2:
> +		f_pdata->addr_width =3D CQSPI_INST_TYPE_DUAL;
> +		break;
> +	case SPI_PROTO_1_4_4:
> +	case SPI_PROTO_4_4_4:
> +		f_pdata->addr_width =3D CQSPI_INST_TYPE_QUAD;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +

I think you have some other patches in your tree, the above doesn't=20
compile on l2-mtd/master:

~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:57: warning: =91enum=
=20
spi_protocol=92 declared inside parameter list [enabled by default]
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:57: warning: its=20
scope is only this definition or declaration, which is probably not wha=
t=20
you want [enabled by default]
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:70: error: parameter=
=20
2 (=91proto=92) has incomplete type
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:701:12: error: function=20
declaration isn=92t a prototype [-Werror=3Dstrict-prototypes]
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c: In function=20
=91cqspi_set_protocol=92:
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:706:7: error:=20
=91SPI_PROTO_1_1_1=92 undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:706:7: note: each=20
undeclared identifier is reported only once for each function it appear=
s in
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:707:7: error:=20
=91SPI_PROTO_1_1_2=92 undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:708:7: error:=20
=91SPI_PROTO_1_1_4=92 undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:709:7: error:=20
=91SPI_PROTO_1_2_2=92 undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:710:7: error:=20
=91SPI_PROTO_1_4_4=92 undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:713:7: error:=20
=91SPI_PROTO_2_2_2=92 undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:716:7: error:=20
=91SPI_PROTO_4_4_4=92 undeclared (first use in this function)
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c: In function=20
=91cqspi_setup_flash=92:
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:1087:6: error: =91struct=
=20
spi_nor=92 has no member named =91dn=92
~/l2-mtd/drivers/mtd/spi-nor/cadence-quadspi.c:1096:6: error: =91struct=
=20
spi_nor=92 has no member named =91set_protocol=92

[...]

Regards,
Graham
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
