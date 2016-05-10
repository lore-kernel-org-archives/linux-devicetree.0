From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Tue, 10 May 2016 13:34:42 +0200
Message-ID: <5731C752.9040702@atmel.com>
References: <1461050839-24644-1-git-send-email-xuejiancheng@hisilicon.com>
 <5720A8BD.90302@atmel.com> <5729B207.5090809@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5729B207.5090809-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, furquan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jiangheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jiancheng,

Le 04/05/2016 10:25, Jiancheng Xue a =E9crit :
> Hi Cyrille,
>=20
> On 2016/4/27 19:55, Cyrille Pitchen wrote:
>> Hi Jiancheng,
>>
>> Le 19/04/2016 09:27, Jiancheng Xue a =E9crit :
>>> From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>>
>>> Add hisilicon spi-nor flash controller driver
>>
>> [...]
>>> +enum hifmc_iftype {
>>> +	IF_TYPE_STD,
>>> +	IF_TYPE_DUAL,
>>> +	IF_TYPE_DIO,
>>> +	IF_TYPE_QUAD,
>>> +	IF_TYPE_QIO,
>>> +};
>>
>> Just for my own information, the hisilicon controller supports:
>> - SPI 1-1-1 : IF_TYPE_STD
>> - SPI 1-1-2 : IF_TYPE_DUAL
>> - SPI 1-2-2 : IF_TYPE_DIO
>> - SPI 1-1-4 : IF_TYPE_QUAD
>> - SPI 1-4-4 : IF_TYPE_QIO
>>
>> but not the SPI protocols 2-2-2 or 4-4-4, does it?
>=20
> You are right.
>=20
>> If I ask you this question, it's because I wonder how to make the di=
fference
>> between SPI controllers supporting both SPI 1-4-4 and 4-4-4 and thos=
e
>> supporting only SPI 1-4-4 in the case they rely on the m25p80 driver=
 as an
>> adaptation layer between the spi-nor framework et the spi framework.
>>
>> I guess the "spi-tx-bus-width" and "spi-rx-bus-width" DT properties =
are not
>> enough to make the difference between these two kinds of SPI control=
ler.
>>
>> I understand your driver doesn't use the m25p80 driver as it directl=
y calls
>> spi_nor_scan() and implements the .read_reg, .write_reg, .read, .wri=
te and
>> .erase hooks, but its a general question :)
>>
> IMO, the "spi-tx-bus-width" and "spi-rx-bus-width" DT properties whic=
h
> will be stored in spi_device.mode just represent modes of the spi dev=
ice,
> but not the ones of the spi controller. We should add a specific memb=
er for
> the controller to indicate all modes which it supports.
>=20
> The definition of spi_nor_scan can be modified to
> int spi_nor_scan(struct spi_nor *nor, const char *name, int mode).
> The argument "mode" represents all modes which the controller support=
s.
> For example,
> #define SPI_1_1_1  (1 << 0)
> #define SPI_1_1_4  (1 << 0)
> #define SPI_1_4_4  (1 << 2)
> #define SPI_4_4_4  (1 << 3)
> If the controller supports SPI_1_1_1, SPI_1_1_4 and SPI_1_4_4, the mo=
de
> passed to spi_nor_scan will be (SPI_1_1_1 | SPI_1_1_4 | SPI_1_4_4).
>=20
> The really read_mode we use when transferring should depend on both c=
ontroller's
> modes(i.e. the argument "mode") and device's modes(i.e. struct flash_=
info.flags,
> which can be got by spi_nor_read_id()).
>=20

I've sent few series of patches to the mailing list to enhance the supp=
ort of
QSPI memories. The latest one was an RFC: I've implemented support of M=
icron
memories as an example. Since the publication, I've also written suppor=
t for
Macronix but I didn't sent the Macronix patch yet. If you want to have =
a look
to the latest published version:

https://lkml.org/lkml/2016/4/13/633

>>> +static int get_if_type(enum read_mode flash_read)
>>> +{
>>> +	enum hifmc_iftype if_type;
>>> +
>>> +	switch (flash_read) {
>>> +	case SPI_NOR_DUAL:
>>> +		if_type =3D IF_TYPE_DUAL;
>>> +		break;
>>> +	case SPI_NOR_QUAD:
>>> +		if_type =3D IF_TYPE_QUAD;
>>> +		break;
>>> +	case SPI_NOR_NORMAL:
>>> +	case SPI_NOR_FAST:
>>> +	default:
>>> +		if_type =3D IF_TYPE_STD;
>>> +		break;
>>> +	}
>>> +
>>> +	return if_type;
>>> +}
>>
>> Here I understand your QSPI controller could support SPI 1-4-4 and S=
PI 1-2-2
>> but you limit it to SPI 1-1-4 and SPI 1-1-2 because the spi-nor fram=
ework
>> doesn't support those protocols yet.
>>
> Yes. You're right.
> It is one of the reasons that the spi-nor framework doesn't support t=
hose two protocols.
> We also found protocols supported were enough for our product solutio=
ns now. So
> we didn't implement SPI-1-4-4 and SPI-1-2-2 in this patch.
>=20
>> [...]
>>
>>> +static void hisi_spi_nor_cmd_prepare(struct hifmc_host *host, u8 c=
md,
>>> +		u32 *opcfg)
>>> +{
>>> +	u32 reg;
>>> +
>>> +	*opcfg |=3D FMC_OP_CMD1_EN;
>>> +	switch (cmd) {
>>> +	case SPINOR_OP_RDID:
>>> +	case SPINOR_OP_RDSR:
>>> +	case SPINOR_OP_RDCR:
>>> +		*opcfg |=3D FMC_OP_READ_DATA_EN;
>>> +		break;
>>> +	case SPINOR_OP_WREN:
>>> +		reg =3D readl(host->regbase + FMC_GLOBAL_CFG);
>>> +		if (reg & FMC_GLOBAL_CFG_WP_ENABLE) {
>>> +			reg &=3D ~FMC_GLOBAL_CFG_WP_ENABLE;
>>> +			writel(reg, host->regbase + FMC_GLOBAL_CFG);
>>> +		}
>>> +		break;
>>> +	case SPINOR_OP_WRSR:
>>> +		*opcfg |=3D FMC_OP_WRITE_DATA_EN;
>>> +		break;
>>> +	case SPINOR_OP_BE_4K:
>>> +	case SPINOR_OP_BE_4K_PMC:
>>> +	case SPINOR_OP_SE_4B:
>>> +	case SPINOR_OP_SE:
>>> +		*opcfg |=3D FMC_OP_ADDR_EN;
>>> +		break;
>>> +	case SPINOR_OP_EN4B:
>>> +		reg =3D readl(host->regbase + FMC_CFG);
>>> +		reg |=3D SPI_NOR_ADDR_MODE;
>>> +		writel(reg, host->regbase + FMC_CFG);
>>> +		break;
>>> +	case SPINOR_OP_EX4B:
>>> +		reg =3D readl(host->regbase + FMC_CFG);
>>> +		reg &=3D ~SPI_NOR_ADDR_MODE;
>>> +		writel(reg, host->regbase + FMC_CFG);
>>> +		break;
>>> +	case SPINOR_OP_CHIP_ERASE:
>>> +	default:
>>> +		break;
>>> +	}
>>> +}
>>
>> IMHO, this is exactly what should be avoided in (Q)SPI controller dr=
ivers:
>> they should not analyse the command op code to guess some settings s=
uch as
>> the SPI protocol to be used or in your case whether some address or =
data
>> cycles are included inside the command.
>>
>> Why? Just because your driver won't know what to do when we introduc=
e new
>> op codes. Right now, hisi_spi_nor_cmd_prepare() is not aware of op c=
ode 0x15
>> use by Macronix to read its Configuration Register or Micron op code=
s to
>> read/write their Volatile Configuration Register and Enhanced Volati=
le
>> Configuration Register. So your driver won't support those memories =
any longer
>> when new features using those registers will be added in the spi-nor=
 framework.
>>
>>
>> Since your driver implements struct spi_nor hooks, here is what you =
could do
>> instead:
>>
>> 1 - hisi_spi_nor_read_reg(..., u8 *buf, int len)
>>
>> if buf !=3D NULL then you should set FMC_OP_READ_DATA_EN, don't set =
it otherwise.
>>
>>
>> 2 - hisi_spi_nor_write_reg(..., u8 *buf, int len)
>>
>> buf should always be !=3D NULL so I guess you can always set FMC_OP_=
WRITE_DATA_EN
>>
>> For the special case of SPINOR_OP_WREN (Write Enable), your driver s=
eems
>> to clear the FMC_GLOBAL_CFG_WP_ENABLE bit from the FMC_GLOBAL_CFG re=
gister, if
>> set, but never set it again... So why not clear this bit once for al=
l?
>>
>> Reading the current source code, the support of the hardware write p=
rotect
>> feature is a little bit odd, isn't it?
>>
>> 3 - hisi_spi_nor_read(struct spi_nor *nor, ...)
>>
>> your driver doesn't seem to call hisi_spi_nor_send_cmd() /
>> hisi_spi_nor_cmd_prepare() from _read() so I don't know whether you =
have to
>> set the FMC_OP_READ_DATA_EN bit here.
>>
>> Also you can check nor->addr_width to know whether you need SPI_NOR_=
ADDR_MODE.
>>
>>
>> 4 - hisi_spi_nor_write(struct spi_nor *nor, ...)
>>
>> Almost the same comment as for _read(): just replace FMC_OP_READ_DAT=
A_EN by
>> FMC_OP_WRITE_DATA_EN I guess.
>>
>>
>> 5 - hisi_spi_nor_erase(struct spi_nor *nor, ...)
>>
>> Here again you should check nor->addr_width to know when to set the
>> SPI_NOR_ADDR_MODE bit in the FMC_CFG register.
>>
>> The FMC_OP_ADDR_EN bit should always be set for erase operations.
>>
>>
>>> +static int hisi_spi_nor_send_cmd(struct spi_nor *nor, u8 cmd, int =
len)
>>> +{
>>> +	struct hifmc_priv *priv =3D nor->priv;
>>> +	struct hifmc_host *host =3D priv->host;
>>> +	u32 reg, op_cfg =3D 0;
>>> +
>>> +	hisi_spi_nor_cmd_prepare(host, cmd, &op_cfg);
>> [...]
>>
>> Just get rid of hisi_spi_nor_cmd_prepare(), it would simplify the su=
pport of
>> your driver a lot. For sure, I don't know the hisilicon spi-nor flas=
h
>> controller as much as you do but I'm pretty sure its driver doesn't =
need to
>> analyse the op code to guess some hardware settings. There are other=
 means to
>> find out these settings.
>>
>> Anyway, I hope these few comments will help you.
>>
> Thank you very much for your detailed comments. They help me a lot. I=
 looked into
> the datasheet and this driver. I found it was really a big mistake fo=
r
> hisi_spi_nor_cmd_prepare to configure registers according to the comm=
and op code.
>=20
> I rewrote corresponding functions like below.
>=20

This new version looks good to me. I just have one small suggestion:

> static int hisi_spi_nor_op_reg(struct spi_nor *nor, u8 opcode, int le=
n, u8 optype)
> {
> 	struct hifmc_priv *priv =3D nor->priv;
> 	struct hifmc_host *host =3D priv->host;
> 	u32 reg;
>=20
> 	reg =3D FMC_CMD_CMD1(opcode);
> 	writel(reg, host->regbase + FMC_CMD);
>=20
> 	reg =3D FMC_DATA_NUM_CNT(len);
> 	writel(reg, host->regbase + FMC_DATA_NUM);
>=20
> 	reg =3D OP_CFG_FM_CS(priv->chipselect);
> 	writel(reg, host->regbase + FMC_OP_CFG);
>=20
> 	writel(0xff, host->regbase + FMC_INT_CLR);
> 	reg =3D FMC_OP_CMD1_EN;
> 	if (optype =3D=3D FMC_OP_READ) {
> 		reg |=3D FMC_OP_READ_DATA_EN;
> 	} else {
> 		reg |=3D FMC_OP_WRITE_DATA_EN;
> 	}
Assuming you provide the right value in 'optype', here you could direct=
ly
write:
-	if (optype =3D=3D FMC_OP_READ) {
-		reg |=3D FMC_OP_READ_DATA_EN;
-	} else {
-		reg |=3D FMC_OP_WRITE_DATA_EN;
-	}
+	reg |=3D optype;


> 	reg |=3D FMC_OP_REG_OP_START;
> 	writel(reg, host->regbase + FMC_OP);
>=20
> 	return wait_op_finish(host);
> }
>=20
> static int hisi_spi_nor_read_reg(struct spi_nor *nor, u8 opcode, u8 *=
buf,
> 		int len)
> {
> 	struct hifmc_priv *priv =3D nor->priv;
> 	struct hifmc_host *host =3D priv->host;
> 	int ret;
>=20
> 	ret =3D hisi_spi_nor_op_reg(nor, opcode, len, FMC_OP_READ);
-	ret =3D hisi_spi_nor_op_reg(nor, opcode, len, FMC_OP_READ);
+	ret =3D hisi_spi_nor_op_reg(nor, opcode, len, FMC_OP_READ_DATA_EN);
> 	if (ret)
> 		return ret;
>=20
> 	memcpy_fromio(buf, host->iobase, len);
> 	return 0;
> }
>=20
> static int hisi_spi_nor_write_reg(struct spi_nor *nor, u8 opcode,
> 				u8 *buf, int len)
> {
> 	struct hifmc_priv *priv =3D nor->priv;
> 	struct hifmc_host *host =3D priv->host;
>=20
> 	if (len)
> 		memcpy_toio(host->iobase, buf, len);
>=20
> 	return hisi_spi_nor_op_reg(nor, opcode, len, FMC_OP_WRITE);
-	return hisi_spi_nor_op_reg(nor, opcode, len, FMC_OP_WRITE);
+	return hisi_spi_nor_op_reg(nor, opcode, len, FMC_OP_WRITE_DATA_EN);
> }
>=20
> static int hisi_spi_nor_register(struct device_node *np,
> 				struct hifmc_host *host)
> {
> 	struct spi_nor *nor;
> 	...
> 	nor->read_reg =3D hisi_spi_nor_read_reg;
> 	nor->write_reg =3D hisi_spi_nor_write_reg;
> 	nor->erase =3D NULL;   /*use the default implementation*/
> 	...
> 	spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> 	...
> }
>=20
> Any new comments will be highly appreciated. Thank you.
>=20
> Regards,
> Jiancheng
>=20
>=20
Best regards,

Cyrille
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
