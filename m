From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Wed, 27 Apr 2016 13:55:41 +0200
Message-ID: <5720A8BD.90302@atmel.com>
References: <1461050839-24644-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461050839-24644-1-git-send-email-xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, furquan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jiangheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jiancheng,

Le 19/04/2016 09:27, Jiancheng Xue a =E9crit :
> From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>=20
> Add hisilicon spi-nor flash controller driver

[...]
> +enum hifmc_iftype {
> +	IF_TYPE_STD,
> +	IF_TYPE_DUAL,
> +	IF_TYPE_DIO,
> +	IF_TYPE_QUAD,
> +	IF_TYPE_QIO,
> +};

Just for my own information, the hisilicon controller supports:
- SPI 1-1-1 : IF_TYPE_STD
- SPI 1-1-2 : IF_TYPE_DUAL
- SPI 1-2-2 : IF_TYPE_DIO
- SPI 1-1-4 : IF_TYPE_QUAD
- SPI 1-4-4 : IF_TYPE_QIO

but not the SPI protocols 2-2-2 or 4-4-4, does it?

If I ask you this question, it's because I wonder how to make the diffe=
rence
between SPI controllers supporting both SPI 1-4-4 and 4-4-4 and those
supporting only SPI 1-4-4 in the case they rely on the m25p80 driver as=
 an
adaptation layer between the spi-nor framework et the spi framework.

I guess the "spi-tx-bus-width" and "spi-rx-bus-width" DT properties are=
 not
enough to make the difference between these two kinds of SPI controller=
=2E

I understand your driver doesn't use the m25p80 driver as it directly c=
alls
spi_nor_scan() and implements the .read_reg, .write_reg, .read, .write =
and
=2Eerase hooks, but its a general question :)

> +static int get_if_type(enum read_mode flash_read)
> +{
> +	enum hifmc_iftype if_type;
> +
> +	switch (flash_read) {
> +	case SPI_NOR_DUAL:
> +		if_type =3D IF_TYPE_DUAL;
> +		break;
> +	case SPI_NOR_QUAD:
> +		if_type =3D IF_TYPE_QUAD;
> +		break;
> +	case SPI_NOR_NORMAL:
> +	case SPI_NOR_FAST:
> +	default:
> +		if_type =3D IF_TYPE_STD;
> +		break;
> +	}
> +
> +	return if_type;
> +}

Here I understand your QSPI controller could support SPI 1-4-4 and SPI =
1-2-2
but you limit it to SPI 1-1-4 and SPI 1-1-2 because the spi-nor framewo=
rk
doesn't support those protocols yet.

[...]

> +static void hisi_spi_nor_cmd_prepare(struct hifmc_host *host, u8 cmd=
,
> +		u32 *opcfg)
> +{
> +	u32 reg;
> +
> +	*opcfg |=3D FMC_OP_CMD1_EN;
> +	switch (cmd) {
> +	case SPINOR_OP_RDID:
> +	case SPINOR_OP_RDSR:
> +	case SPINOR_OP_RDCR:
> +		*opcfg |=3D FMC_OP_READ_DATA_EN;
> +		break;
> +	case SPINOR_OP_WREN:
> +		reg =3D readl(host->regbase + FMC_GLOBAL_CFG);
> +		if (reg & FMC_GLOBAL_CFG_WP_ENABLE) {
> +			reg &=3D ~FMC_GLOBAL_CFG_WP_ENABLE;
> +			writel(reg, host->regbase + FMC_GLOBAL_CFG);
> +		}
> +		break;
> +	case SPINOR_OP_WRSR:
> +		*opcfg |=3D FMC_OP_WRITE_DATA_EN;
> +		break;
> +	case SPINOR_OP_BE_4K:
> +	case SPINOR_OP_BE_4K_PMC:
> +	case SPINOR_OP_SE_4B:
> +	case SPINOR_OP_SE:
> +		*opcfg |=3D FMC_OP_ADDR_EN;
> +		break;
> +	case SPINOR_OP_EN4B:
> +		reg =3D readl(host->regbase + FMC_CFG);
> +		reg |=3D SPI_NOR_ADDR_MODE;
> +		writel(reg, host->regbase + FMC_CFG);
> +		break;
> +	case SPINOR_OP_EX4B:
> +		reg =3D readl(host->regbase + FMC_CFG);
> +		reg &=3D ~SPI_NOR_ADDR_MODE;
> +		writel(reg, host->regbase + FMC_CFG);
> +		break;
> +	case SPINOR_OP_CHIP_ERASE:
> +	default:
> +		break;
> +	}
> +}

IMHO, this is exactly what should be avoided in (Q)SPI controller drive=
rs:
they should not analyse the command op code to guess some settings such=
 as
the SPI protocol to be used or in your case whether some address or dat=
a
cycles are included inside the command.

Why? Just because your driver won't know what to do when we introduce n=
ew
op codes. Right now, hisi_spi_nor_cmd_prepare() is not aware of op code=
 0x15
use by Macronix to read its Configuration Register or Micron op codes t=
o
read/write their Volatile Configuration Register and Enhanced Volatile
Configuration Register. So your driver won't support those memories any=
 longer
when new features using those registers will be added in the spi-nor fr=
amework.


Since your driver implements struct spi_nor hooks, here is what you cou=
ld do
instead:

1 - hisi_spi_nor_read_reg(..., u8 *buf, int len)

if buf !=3D NULL then you should set FMC_OP_READ_DATA_EN, don't set it =
otherwise.


2 - hisi_spi_nor_write_reg(..., u8 *buf, int len)

buf should always be !=3D NULL so I guess you can always set FMC_OP_WRI=
TE_DATA_EN

=46or the special case of SPINOR_OP_WREN (Write Enable), your driver se=
ems
to clear the FMC_GLOBAL_CFG_WP_ENABLE bit from the FMC_GLOBAL_CFG regis=
ter, if
set, but never set it again... So why not clear this bit once for all?

Reading the current source code, the support of the hardware write prot=
ect
feature is a little bit odd, isn't it?

3 - hisi_spi_nor_read(struct spi_nor *nor, ...)

your driver doesn't seem to call hisi_spi_nor_send_cmd() /
hisi_spi_nor_cmd_prepare() from _read() so I don't know whether you hav=
e to
set the FMC_OP_READ_DATA_EN bit here.

Also you can check nor->addr_width to know whether you need SPI_NOR_ADD=
R_MODE.


4 - hisi_spi_nor_write(struct spi_nor *nor, ...)

Almost the same comment as for _read(): just replace FMC_OP_READ_DATA_E=
N by
=46MC_OP_WRITE_DATA_EN I guess.


5 - hisi_spi_nor_erase(struct spi_nor *nor, ...)

Here again you should check nor->addr_width to know when to set the
SPI_NOR_ADDR_MODE bit in the FMC_CFG register.

The FMC_OP_ADDR_EN bit should always be set for erase operations.


> +static int hisi_spi_nor_send_cmd(struct spi_nor *nor, u8 cmd, int le=
n)
> +{
> +	struct hifmc_priv *priv =3D nor->priv;
> +	struct hifmc_host *host =3D priv->host;
> +	u32 reg, op_cfg =3D 0;
> +
> +	hisi_spi_nor_cmd_prepare(host, cmd, &op_cfg);
[...]

Just get rid of hisi_spi_nor_cmd_prepare(), it would simplify the suppo=
rt of
your driver a lot. For sure, I don't know the hisilicon spi-nor flash
controller as much as you do but I'm pretty sure its driver doesn't nee=
d to
analyse the op code to guess some hardware settings. There are other me=
ans to
find out these settings.

Anyway, I hope these few comments will help you.

Best regards,

Cyrille

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
