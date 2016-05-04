From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: Re: [PATCH v10] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Wed, 4 May 2016 16:25:43 +0800
Message-ID: <5729B207.5090809@hisilicon.com>
References: <1461050839-24644-1-git-send-email-xuejiancheng@hisilicon.com>
 <5720A8BD.90302@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5720A8BD.90302@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, jteki@openedev.com, ezequiel@vanguardiasur.com.ar, juhosg@openwrt.org, furquan@google.com, robh+dt@kernel.org
Cc: suwenping@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yanhaifeng@hisilicon.com, raojun@hisilicon.com, linux-mtd@lists.infradead.org, jiangheng@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, yanghongwei@hisilicon.com, zhangzhenxing@hisilicon.com, hermit.wangheming@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi Cyrille,

On 2016/4/27 19:55, Cyrille Pitchen wrote:
> Hi Jiancheng,
>=20
> Le 19/04/2016 09:27, Jiancheng Xue a =E9crit :
>> From: Jiancheng Xue <xuejiancheng@huawei.com>
>>
>> Add hisilicon spi-nor flash controller driver
>=20
> [...]
>> +enum hifmc_iftype {
>> +	IF_TYPE_STD,
>> +	IF_TYPE_DUAL,
>> +	IF_TYPE_DIO,
>> +	IF_TYPE_QUAD,
>> +	IF_TYPE_QIO,
>> +};
>=20
> Just for my own information, the hisilicon controller supports:
> - SPI 1-1-1 : IF_TYPE_STD
> - SPI 1-1-2 : IF_TYPE_DUAL
> - SPI 1-2-2 : IF_TYPE_DIO
> - SPI 1-1-4 : IF_TYPE_QUAD
> - SPI 1-4-4 : IF_TYPE_QIO
>=20
> but not the SPI protocols 2-2-2 or 4-4-4, does it?

You are right.

> If I ask you this question, it's because I wonder how to make the dif=
ference
> between SPI controllers supporting both SPI 1-4-4 and 4-4-4 and those
> supporting only SPI 1-4-4 in the case they rely on the m25p80 driver =
as an
> adaptation layer between the spi-nor framework et the spi framework.
>=20
> I guess the "spi-tx-bus-width" and "spi-rx-bus-width" DT properties a=
re not
> enough to make the difference between these two kinds of SPI controll=
er.
>=20
> I understand your driver doesn't use the m25p80 driver as it directly=
 calls
> spi_nor_scan() and implements the .read_reg, .write_reg, .read, .writ=
e and
> .erase hooks, but its a general question :)
>=20
IMO, the "spi-tx-bus-width" and "spi-rx-bus-width" DT properties which
will be stored in spi_device.mode just represent modes of the spi devic=
e,
but not the ones of the spi controller. We should add a specific member=
 for
the controller to indicate all modes which it supports.

The definition of spi_nor_scan can be modified to
int spi_nor_scan(struct spi_nor *nor, const char *name, int mode).
The argument "mode" represents all modes which the controller supports.
=46or example,
#define SPI_1_1_1  (1 << 0)
#define SPI_1_1_4  (1 << 0)
#define SPI_1_4_4  (1 << 2)
#define SPI_4_4_4  (1 << 3)
If the controller supports SPI_1_1_1, SPI_1_1_4 and SPI_1_4_4, the mode
passed to spi_nor_scan will be (SPI_1_1_1 | SPI_1_1_4 | SPI_1_4_4).

The really read_mode we use when transferring should depend on both con=
troller's
modes(i.e. the argument "mode") and device's modes(i.e. struct flash_in=
fo.flags,
which can be got by spi_nor_read_id()).

>> +static int get_if_type(enum read_mode flash_read)
>> +{
>> +	enum hifmc_iftype if_type;
>> +
>> +	switch (flash_read) {
>> +	case SPI_NOR_DUAL:
>> +		if_type =3D IF_TYPE_DUAL;
>> +		break;
>> +	case SPI_NOR_QUAD:
>> +		if_type =3D IF_TYPE_QUAD;
>> +		break;
>> +	case SPI_NOR_NORMAL:
>> +	case SPI_NOR_FAST:
>> +	default:
>> +		if_type =3D IF_TYPE_STD;
>> +		break;
>> +	}
>> +
>> +	return if_type;
>> +}
>=20
> Here I understand your QSPI controller could support SPI 1-4-4 and SP=
I 1-2-2
> but you limit it to SPI 1-1-4 and SPI 1-1-2 because the spi-nor frame=
work
> doesn't support those protocols yet.
>=20
Yes. You're right.
It is one of the reasons that the spi-nor framework doesn't support tho=
se two protocols.
We also found protocols supported were enough for our product solutions=
 now. So
we didn't implement SPI-1-4-4 and SPI-1-2-2 in this patch.

> [...]
>=20
>> +static void hisi_spi_nor_cmd_prepare(struct hifmc_host *host, u8 cm=
d,
>> +		u32 *opcfg)
>> +{
>> +	u32 reg;
>> +
>> +	*opcfg |=3D FMC_OP_CMD1_EN;
>> +	switch (cmd) {
>> +	case SPINOR_OP_RDID:
>> +	case SPINOR_OP_RDSR:
>> +	case SPINOR_OP_RDCR:
>> +		*opcfg |=3D FMC_OP_READ_DATA_EN;
>> +		break;
>> +	case SPINOR_OP_WREN:
>> +		reg =3D readl(host->regbase + FMC_GLOBAL_CFG);
>> +		if (reg & FMC_GLOBAL_CFG_WP_ENABLE) {
>> +			reg &=3D ~FMC_GLOBAL_CFG_WP_ENABLE;
>> +			writel(reg, host->regbase + FMC_GLOBAL_CFG);
>> +		}
>> +		break;
>> +	case SPINOR_OP_WRSR:
>> +		*opcfg |=3D FMC_OP_WRITE_DATA_EN;
>> +		break;
>> +	case SPINOR_OP_BE_4K:
>> +	case SPINOR_OP_BE_4K_PMC:
>> +	case SPINOR_OP_SE_4B:
>> +	case SPINOR_OP_SE:
>> +		*opcfg |=3D FMC_OP_ADDR_EN;
>> +		break;
>> +	case SPINOR_OP_EN4B:
>> +		reg =3D readl(host->regbase + FMC_CFG);
>> +		reg |=3D SPI_NOR_ADDR_MODE;
>> +		writel(reg, host->regbase + FMC_CFG);
>> +		break;
>> +	case SPINOR_OP_EX4B:
>> +		reg =3D readl(host->regbase + FMC_CFG);
>> +		reg &=3D ~SPI_NOR_ADDR_MODE;
>> +		writel(reg, host->regbase + FMC_CFG);
>> +		break;
>> +	case SPINOR_OP_CHIP_ERASE:
>> +	default:
>> +		break;
>> +	}
>> +}
>=20
> IMHO, this is exactly what should be avoided in (Q)SPI controller dri=
vers:
> they should not analyse the command op code to guess some settings su=
ch as
> the SPI protocol to be used or in your case whether some address or d=
ata
> cycles are included inside the command.
>=20
> Why? Just because your driver won't know what to do when we introduce=
 new
> op codes. Right now, hisi_spi_nor_cmd_prepare() is not aware of op co=
de 0x15
> use by Macronix to read its Configuration Register or Micron op codes=
 to
> read/write their Volatile Configuration Register and Enhanced Volatil=
e
> Configuration Register. So your driver won't support those memories a=
ny longer
> when new features using those registers will be added in the spi-nor =
framework.
>=20
>=20
> Since your driver implements struct spi_nor hooks, here is what you c=
ould do
> instead:
>=20
> 1 - hisi_spi_nor_read_reg(..., u8 *buf, int len)
>=20
> if buf !=3D NULL then you should set FMC_OP_READ_DATA_EN, don't set i=
t otherwise.
>=20
>=20
> 2 - hisi_spi_nor_write_reg(..., u8 *buf, int len)
>=20
> buf should always be !=3D NULL so I guess you can always set FMC_OP_W=
RITE_DATA_EN
>=20
> For the special case of SPINOR_OP_WREN (Write Enable), your driver se=
ems
> to clear the FMC_GLOBAL_CFG_WP_ENABLE bit from the FMC_GLOBAL_CFG reg=
ister, if
> set, but never set it again... So why not clear this bit once for all=
?
>=20
> Reading the current source code, the support of the hardware write pr=
otect
> feature is a little bit odd, isn't it?
>=20
> 3 - hisi_spi_nor_read(struct spi_nor *nor, ...)
>=20
> your driver doesn't seem to call hisi_spi_nor_send_cmd() /
> hisi_spi_nor_cmd_prepare() from _read() so I don't know whether you h=
ave to
> set the FMC_OP_READ_DATA_EN bit here.
>=20
> Also you can check nor->addr_width to know whether you need SPI_NOR_A=
DDR_MODE.
>=20
>=20
> 4 - hisi_spi_nor_write(struct spi_nor *nor, ...)
>=20
> Almost the same comment as for _read(): just replace FMC_OP_READ_DATA=
_EN by
> FMC_OP_WRITE_DATA_EN I guess.
>=20
>=20
> 5 - hisi_spi_nor_erase(struct spi_nor *nor, ...)
>=20
> Here again you should check nor->addr_width to know when to set the
> SPI_NOR_ADDR_MODE bit in the FMC_CFG register.
>=20
> The FMC_OP_ADDR_EN bit should always be set for erase operations.
>=20
>=20
>> +static int hisi_spi_nor_send_cmd(struct spi_nor *nor, u8 cmd, int l=
en)
>> +{
>> +	struct hifmc_priv *priv =3D nor->priv;
>> +	struct hifmc_host *host =3D priv->host;
>> +	u32 reg, op_cfg =3D 0;
>> +
>> +	hisi_spi_nor_cmd_prepare(host, cmd, &op_cfg);
> [...]
>=20
> Just get rid of hisi_spi_nor_cmd_prepare(), it would simplify the sup=
port of
> your driver a lot. For sure, I don't know the hisilicon spi-nor flash
> controller as much as you do but I'm pretty sure its driver doesn't n=
eed to
> analyse the op code to guess some hardware settings. There are other =
means to
> find out these settings.
>=20
> Anyway, I hope these few comments will help you.
>=20
Thank you very much for your detailed comments. They help me a lot. I l=
ooked into
the datasheet and this driver. I found it was really a big mistake for
hisi_spi_nor_cmd_prepare to configure registers according to the comman=
d op code.

I rewrote corresponding functions like below.

static int hisi_spi_nor_op_reg(struct spi_nor *nor, u8 opcode, int len,=
 u8 optype)
{
	struct hifmc_priv *priv =3D nor->priv;
	struct hifmc_host *host =3D priv->host;
	u32 reg;

	reg =3D FMC_CMD_CMD1(opcode);
	writel(reg, host->regbase + FMC_CMD);

	reg =3D FMC_DATA_NUM_CNT(len);
	writel(reg, host->regbase + FMC_DATA_NUM);

	reg =3D OP_CFG_FM_CS(priv->chipselect);
	writel(reg, host->regbase + FMC_OP_CFG);

	writel(0xff, host->regbase + FMC_INT_CLR);
	reg =3D FMC_OP_CMD1_EN;
	if (optype =3D=3D FMC_OP_READ) {
		reg |=3D FMC_OP_READ_DATA_EN;
	} else {
		reg |=3D FMC_OP_WRITE_DATA_EN;
	}
	reg |=3D FMC_OP_REG_OP_START;
	writel(reg, host->regbase + FMC_OP);

	return wait_op_finish(host);
}

static int hisi_spi_nor_read_reg(struct spi_nor *nor, u8 opcode, u8 *bu=
f,
		int len)
{
	struct hifmc_priv *priv =3D nor->priv;
	struct hifmc_host *host =3D priv->host;
	int ret;

	ret =3D hisi_spi_nor_op_reg(nor, opcode, len, FMC_OP_READ);
	if (ret)
		return ret;

	memcpy_fromio(buf, host->iobase, len);
	return 0;
}

static int hisi_spi_nor_write_reg(struct spi_nor *nor, u8 opcode,
				u8 *buf, int len)
{
	struct hifmc_priv *priv =3D nor->priv;
	struct hifmc_host *host =3D priv->host;

	if (len)
		memcpy_toio(host->iobase, buf, len);

	return hisi_spi_nor_op_reg(nor, opcode, len, FMC_OP_WRITE);
}

static int hisi_spi_nor_register(struct device_node *np,
				struct hifmc_host *host)
{
	struct spi_nor *nor;
	...
	nor->read_reg =3D hisi_spi_nor_read_reg;
	nor->write_reg =3D hisi_spi_nor_write_reg;
	nor->erase =3D NULL;   /*use the default implementation*/
	...
	spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
	...
}

Any new comments will be highly appreciated. Thank you.

Regards,
Jiancheng
