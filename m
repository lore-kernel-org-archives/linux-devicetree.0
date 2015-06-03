From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v4 1/6] mtd: nand: =?UTF-8?Q?vf=36=31=30=5Fnfc=3A=20Fr?=
 =?UTF-8?Q?eescale=20NFC=20for=20VF=36=31=30=2C=20MPC=35=31=32=35=20and=20?=
 =?UTF-8?Q?others?=
Date: Wed, 03 Jun 2015 17:05:16 +0200
Message-ID: <b3b09b4b8c97cbfc88fa0d5fdc5e40cd@agner.ch>
References: <1427300909-20825-1-git-send-email-stefan@agner.ch>
 <1427300909-20825-2-git-send-email-stefan@agner.ch>
 <20150603130825.GA23991@breakpoint.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150603130825.GA23991-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, aaron-yuhzfaV+M/Wz3Dx2OeFgIA@public.gmane.org, marb-Z4QKGCRq86k@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bpringlemeir-ygJ1pmMJ17cAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015-06-03 15:08, Sebastian Andrzej Siewior wrote:
> On 2015-03-25 17:28:24 [+0100], Stefan Agner wrote:
>> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_n=
fc.c
>> new file mode 100644
>> index 0000000..23c1510
>> --- /dev/null
>> +++ b/drivers/mtd/nand/vf610_nfc.c
>> @@ -0,0 +1,686 @@
> =E2=80=A6
>> +static inline u32 vf610_nfc_read(struct vf610_nfc *nfc, uint reg)
>> +{
>> +	return readl(nfc->regs + reg);
>> +}
>> +
>> +static inline void vf610_nfc_write(struct vf610_nfc *nfc, uint reg,=
 u32 val)
>> +{
>> +	writel(val, nfc->regs + reg);
>> +}
> =E2=80=A6
>=20
>> +static void vf610_nfc_send_command(struct vf610_nfc *nfc, u32 cmd_b=
yte1,
>> +				   u32 cmd_code)
>> +{
>> +	void __iomem *reg =3D nfc->regs + NFC_FLASH_CMD2;
>> +	u32 tmp;
>> +
>> +	vf610_nfc_clear_status(nfc);
>> +
>> +	tmp =3D __raw_readl(reg);
>> +	tmp &=3D ~(CMD_BYTE1_MASK | CMD_CODE_MASK | BUFNO_MASK);
>> +	tmp |=3D cmd_byte1 << CMD_BYTE1_SHIFT;
>> +	tmp |=3D cmd_code << CMD_CODE_SHIFT;
>> +	__raw_writel(tmp, reg);
>> +}
>=20
> Why readl() vs __raw_readl() dito for write?
> vf610_nfc_{read|write} is good since for PPC we would need out_be32()
> here instead.
> It would be nice if you could abstract the __raw_ once as well. And I=
 am
> not sure if you need those at all since the former functions should w=
ork
> here just fine.

As Boris guessed correctly, the reason I used the raw variant was due t=
o
performance improvements due to the barrier. However, I will use
{read|write}l_relaxed instead, which should offer endian abstraction
while not having the performance penalty due to extensive barriers...

--
Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
