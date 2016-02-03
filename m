From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH linux-next v2 01/14] mtd: spi-nor: remove
 micron_quad_enable()
Date: Wed, 3 Feb 2016 12:16:53 +0100
Message-ID: <56B1E1A5.9060902@atmel.com>
References: <A765B125120D1346A63912DDE6D8B6310BF57A75@NTXXIAMBX02.xacn.micron.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF57A75-xjs9rfTec9KBtk7LW/CC8tTcztV8WXajQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "marex-ynQEQJNshbs@public.gmane.org" <marex-ynQEQJNshbs@public.gmane.org>, "vigneshr-l0cyMroinI0@public.gmane.org" <vigneshr-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 20/01/2016 06:13, Bean Huo =BB=F4=B1=F3=B1=F3 (beanhuo) a =A8=A6crit=
 :
>> Message-ID:
>> 	<6177f7317fe11922e1d1b6dc4548afbaf0ccebdd.1452268345.git.cyrille.
>> pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>
>> Content-Type: text/plain
>>
>> This patch remove the micron_quad_enable() function which force the =
Quad
>> SPI mode. However, once this mode is enabled, the Micron memory expe=
ct
>> ALL
>> commands to use the SPI 4-4-4 protocol. Hence a failure does occur w=
hen
>> calling spi_nor_wait_till_ready() right after the update of the Enha=
nced
>> Volatile Configuration Register (EVCR) in the micron_quad_enable() a=
s
>> the SPI controller driver is not aware about the protocol change.
>> Since there is almost no performance increase using Fast Read 4-4-4
>> commands instead of Fast Read 1-1-4 commands, we rather keep on usin=
g
>> the
>> Extended SPI mode than enabling the Quad SPI mode.
>>
>> Let's take the example of the pretty standard use of 8 dummy cycles =
during
>> Fast Read operations on 64KB erase sectors:
>>
>> Fast Read 1-1-4 requires 8 cycles for the command, then 24 cycles fo=
r the
>> 3byte address followed by 8 dummy clock cycles and finally 65536*2 c=
ycles
>> for the read data; so 131112 clock cycles.
>>
>> On the other hand the Fast Read 4-4-4 would require 2 cycles for the
>> command, then 6 cycles for the 3byte address followed by 8 dummy clo=
ck
>> cycles and finally 65536*2 cycles for the read data. So 131088 clock
>> cycles. The theorical bandwidth increase is 0.0%.
>>
>> Now using Fast Read operations on 512byte pages:
>> Fast Read 1-1-4 needs 8+24+8+(512*2) =3D 1064 clock cycles whereas F=
ast
>> Read 4-4-4 would requires 2+6+8+(512*2) =3D 1040 clock cycles. Hence=
 the
>> theorical bandwidth increase is 2.3%.
>> Consecutive reads for non sequential pages is not a relevant use cas=
e so
>> The Quad SPI mode is not worth it.
>>
>> mtd_speedtest seems to confirm these figures.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> Fixes: 548cd3ab54da ("mtd: spi-nor: Add quad I/O support for Micron =
SPI
>> NOR")
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 46 +-------------------------------=
-----------
>>  1 file changed, 1 insertion(+), 45 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi=
-nor.c
>> index ed0c19c558b5..3028c06547c1 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1100,45 +1100,6 @@ static int spansion_quad_enable(struct spi_no=
r
>> *nor)
>>  	return 0;
>>  }
>>
>> -static int micron_quad_enable(struct spi_nor *nor)
>> -{
>> -	int ret;
>> -	u8 val;
>> -
>> -	ret =3D nor->read_reg(nor, SPINOR_OP_RD_EVCR, &val, 1);
>> -	if (ret < 0) {
>> -		dev_err(nor->dev, "error %d reading EVCR\n", ret);
>> -		return ret;
>> -	}
>> -
>> -	write_enable(nor);
>> -
>> -	/* set EVCR, enable quad I/O */
>> -	nor->cmd_buf[0] =3D val & ~EVCR_QUAD_EN_MICRON;
>> -	ret =3D nor->write_reg(nor, SPINOR_OP_WD_EVCR, nor->cmd_buf, 1);
>> -	if (ret < 0) {
>> -		dev_err(nor->dev, "error while writing EVCR register\n");
>> -		return ret;
>> -	}
>> -
>> -	ret =3D spi_nor_wait_till_ready(nor);
>> -	if (ret)
>> -		return ret;
>> -
>> -	/* read EVCR and check it */
>> -	ret =3D nor->read_reg(nor, SPINOR_OP_RD_EVCR, &val, 1);
>> -	if (ret < 0) {
>> -		dev_err(nor->dev, "error %d reading EVCR\n", ret);
>> -		return ret;
>> -	}
>> -	if (val & EVCR_QUAD_EN_MICRON) {
>> -		dev_err(nor->dev, "Micron EVCR Quad bit not clear\n");
>> -		return -EINVAL;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>>  static int set_quad_mode(struct spi_nor *nor, const struct flash_in=
fo *info)
>>  {
>>  	int status;
>> @@ -1152,12 +1113,7 @@ static int set_quad_mode(struct spi_nor *nor,
>> const struct flash_info *info)
>>  		}
>>  		return status;
>>  	case SNOR_MFR_MICRON:
>> -		status =3D micron_quad_enable(nor);
>> -		if (status) {
>> -			dev_err(nor->dev, "Micron quad-read not enabled\n");
>> -			return -EINVAL;
>> -		}
>> -		return status;
>> +		return 0;
>>  	default:
>>  		status =3D spansion_quad_enable(nor);
>>  		if (status) {
>> --
>> 1.8.2.2
>>
>>
>>
>>
>=20
> Hi, Cyrlle
> Micron_quad_enable() function is just for how to enable Micron spi no=
r Quad mode,
> does not force to use SPI nor quad mode. if does not need SPI NOR qua=
d mode,
> why spi-nor.c need set_quad_mode(), according to your patch, this fun=
ction also need to
> be removed?
> Another question, if there is user want to enable SPI nor quad mode, =
how to do?
>=20

Hi Bean,

the set_quad_mode() function should not been removed from spi-nor.c as =
it is
needed for both Macronix and Spansion memories.
Indeed, what macronix_quad_enable() and spansion_quad_enable() do is to=
 change
a dedicated bit in some status/configuration register to enable Quad SP=
I
operations. More precisely, this disables some features such as the Wri=
te
Protection (Spansion & Macronix) or the Reset (Macronix) / Hold (Spansi=
on) so
the associated pins can be reassigned to IO2 and IO3 data lines... and =
that's
all!
What I mean is that once set_quad_mode() has been called, Macronix and =
Spansion
memories still reply to commands such as Read Status Register in protoc=
ol
SPI 1-1-1. Of course, they now also support Fast Read 1-1-4 (0x6b) or 1=
-4-4
(0xeb).
=46or Macronix memories, setting the Quad Enable bit in its Status Regi=
ster is
NOT the same as entering its QPI mode. In QPI mode, ALL commands are ex=
pected
to use the SPI 4-4-4 protocol: this mode is not used by spi-nor.c

Then going back to the Micron case, micron_quad_enable() makes the memo=
ry
enter its Quad mode where ALL commands must use the SPI 4-4-4 protocol.=
 So
it is definitely not the same thing as what either macronix_quad_enable=
() or
spansion_quad_enable() do.

Also the current code of micron_quad_enable() is broken:

[...]
Here, the memory still expects the SPI 1-1-1 to be used by write_reg() =
or
read_reg().

	/* set EVCR, enable quad I/O */
	nor->cmd_buf[0] =3D val & ~EVCR_QUAD_EN_MICRON;
	ret =3D nor->write_reg(nor, SPINOR_OP_WD_EVCR, nor->cmd_buf, 1);
	if (ret < 0) {
		dev_err(nor->dev, "error while writing EVCR register\n");
		return ret;
	}

However, once the Quad Enable bit has been cleared into the Enhanced Vo=
latile
Configuration Register, all commands must use the SPI 4-4-4 protocol.
Especially, the later call of spi_nor_wait_till_ready(), which calls re=
ad_reg()
to read the Status Register, will fail because the QSPI controller has =
to mean
to know about the protocol switch hence keeps on sending the Read Statu=
s
Register command with the wrong SPI 1-1-1 protocol.
This is the issue I faced when using a Micron memory with the Atmel QSP=
I
controller embedded in a sama5d2 SoC. Also for the same reason, users o=
f the
m25p80 driver won't be able to use Micron memories for QSPI operations =
too.

	ret =3D spi_nor_wait_till_ready(nor);
	if (ret)
		return ret;
[...]

So in its current state, micron_quad_enable() prevents us from using Mi=
cron
memories for Quad SPI operations. Some code is missing to make it work.



As I said in the patch description, using the SPI 4-4-4 protocol is not
relevant for MTD usage. It would be worth for XIP operations but this i=
s not the
purpose of the spi-nor driver.
Also, the series of patches still support the Micron Quad SPI mode: the=
 spi-nor
driver no longer enables this mode itself but it still can adapt itself=
 whether
the Quad SPI mode had already been enabled by a previous bootloader or =
at
reset. This is the purpose of the patch focusing on Read JEDEC ID comma=
nds:
it is used to probe the current state of the memory and use the SPI 4-4=
-4 if
needed.

Best regards,

Cyrille
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
