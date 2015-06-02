From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v3] Add TI CDCE925 I2C controlled clock synthesizer driver
Date: Tue, 2 Jun 2015 10:39:35 +0200
Message-ID: <556D6BC7.8000308@topic.nl>
References: <1433153623-29205-1-git-send-email-mike.looijmans@topic.nl> <1433231444.2361.75.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433231444.2361.75.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-clk@vger.kernel.org, sboyd@codeaurora.org, mturquette@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

=EF=BB=BFOn 02-06-15 09:50, Paul Bolle wrote:
> On Mon, 2015-06-01 at 12:13 +0200, Mike Looijmans wrote:
>> --- /dev/null
>> +++ b/drivers/clk/clk-cdce925.c
>
>> +static int cdce925_regmap_i2c_write(
>> +	void *context, const void *data, size_t count)
>
>> +	dev_dbg(&i2c->dev, "%s(%u) %#x %#x\n", __func__, count,
>> +			reg_data[0], reg_data[1]);
>
> For some silly reason (ie, I mistakenly thought I spotted an issue) I
> did a quick build of this file. That triggered some noise on x86_64.
> Excerpt:
>
> drivers/clk/clk-cdce925.c: In function =E2=80=98cdce925_regmap_i2c_wr=
ite=E2=80=99:
> include/linux/dynamic_debug.h:64:16: warning: format =E2=80=98%u=E2=80=
=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argume=
nt 5 has type =E2=80=98size_t=E2=80=99 [-Wformat=3D]
>    static struct _ddebug  __aligned(8)   \
>                  ^
> [...]
> drivers/clk/clk-cdce925.c:505:2: note: in expansion of macro =E2=80=98=
dev_dbg=E2=80=99
>    dev_dbg(&i2c->dev, "%s(%u) %#x %#x\n", __func__, count,
>    ^
>
> A quick look at Documentation/printk-formats.txt suggested this (very
> lightly tested) fix:
> @@ -502,7 +502,7 @@ static int cdce925_regmap_i2c_write(
>          reg_data[0] =3D CDCE925_I2C_COMMAND_BYTE_TRANSFER | ((u8 *)d=
ata)[0];
>          reg_data[1] =3D ((u8 *)data)[1];
>
> -       dev_dbg(&i2c->dev, "%s(%u) %#x %#x\n", __func__, count,
> +       dev_dbg(&i2c->dev, "%s(%zu) %#x %#x\n", __func__, count,
>                          reg_data[0], reg_data[1]);
>
>          ret =3D i2c_master_send(i2c, reg_data, count);
>
>> +static int cdce925_regmap_i2c_read(void *context,
>> +	   const void *reg, size_t reg_size, void *val, size_t val_size)
>
>> +		dev_dbg(&i2c->dev, "%s(%u, %u) %#x %#x\n", __func__,
>> +				reg_size, val_size, reg_data[0], *((u8 *)val));
>
> Likewise:
> @@ -547,7 +547,7 @@ static int cdce925_regmap_i2c_read(void *context,
>
>          ret =3D i2c_transfer(i2c->adapter, xfer, 2);
>          if (likely(ret =3D=3D 2)) {
> -               dev_dbg(&i2c->dev, "%s(%u, %u) %#x %#x\n", __func__,
> +               dev_dbg(&i2c->dev, "%s(%zu, %zu) %#x %#x\n", __func__=
,
>                                  reg_size, val_size, reg_data[0], *((=
u8 *)val));
>                  return 0;
>          } else if (ret < 0)
>
> Thanks,
>
>
> Paul Bolle
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail
