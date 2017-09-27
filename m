From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2 1/1] mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370
 variants.
Date: Wed, 27 Sep 2017 21:53:39 +0000
Message-ID: <d78bb3d3d1ec4db287496170164f8133@svr-chch-ex1.atlnz.lc>
References: <20170927005516.28374-1-kalyan.kinthada@alliedtelesis.co.nz>
 <20170927005516.28374-2-kalyan.kinthada@alliedtelesis.co.nz>
 <20170927085318.0670a849@xps13> <20170927111547.3536eb2b@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>, Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis.co.nz>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>, "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Miquel,=0A=
=0A=
On 27/09/17 22:16, Miquel RAYNAL wrote:=0A=
> On Wed, 27 Sep 2017 08:53:18 +0200=0A=
> Miquel RAYNAL <miquel.raynal@free-electrons.com> wrote:=0A=
> =0A=
>> Hello Kalyan,=0A=
>>=0A=
>> On Wed, 27 Sep 2017 13:55:16 +1300=0A=
>> Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz> wrote:=0A=
>>=0A=
>>> When the arbitration between NOR and NAND flash is enabled=0A=
>>> the <FORCE_CSX> field bit[21] in the Data Flash Control Register=0A=
>>> needs to be set to 1 according to guidleine GL-5830741.=0A=
> =0A=
> I forgot to ask you what is this guideline ? Is this a Marvell=0A=
> document ? I could not find it. The functional spec clearly states:=0A=
> "When NOR/NAND hardware arbiter enabled, this bit must be set" but as=0A=
> you mention it in the commit log and in the code it is worth knowing=0A=
> what your are referring to.=0A=
=0A=
The guideline number is from a Marvell Errata document MV-S501377-00, =0A=
although this specific change is a guideline not an erratum. You'll need =
=0A=
access to Marvell's extranet (with appropriate NDAs etc) to retrieve it. =
=0A=
We can mention the document reference in the commit message for v3.=0A=
=0A=
> Also, could you test if this bit introduces a regression or a speed=0A=
> penalty when using for instance only one NAND chip (so not using=0A=
> the arbiter even if it is enabled) ?=0A=
> =0A=
> To do so you may use the flash_speed tool from the mtd-utils package:=0A=
> http://lists.infradead.org/pipermail/linux-mtd/2017-August/076477.html=0A=
=0A=
We haven't run flash_speed (yet) but anecdotally we've seen no =0A=
noticeable performance difference.=0A=
=0A=
> =0A=
> Thank you,=0A=
> Miqu=E8l=0A=
> =0A=
>>>=0A=
>>> This commit sets the FORCE_CSX bit to 1 for all=0A=
>>> ARMADA370 variants as the arbitration is always enabled by=0A=
>>> default.=0A=
>>=0A=
>> Maybe you could mention here that this does not apply for pxa3xx=0A=
>> variant as this bit does not exist/is reserved on the NFCv1.=0A=
>>=0A=
>>>=0A=
>>> Signed-off-by: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>=0A=
>>> ---=0A=
>>>   drivers/mtd/nand/pxa3xx_nand.c | 7 +++++++=0A=
>>>   1 file changed, 7 insertions(+)=0A=
>>>=0A=
>>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c=0A=
>>> b/drivers/mtd/nand/pxa3xx_nand.c index 85cff68643e0..b2753eea567c=0A=
>>> 100644 --- a/drivers/mtd/nand/pxa3xx_nand.c=0A=
>>> +++ b/drivers/mtd/nand/pxa3xx_nand.c=0A=
>>> @@ -68,6 +68,7 @@=0A=
>>>   #define NDCR_PAGE_SZ		(0x1 << 24)=0A=
>>>   #define NDCR_NCSX		(0x1 << 23)=0A=
>>>   #define NDCR_ND_MODE		(0x3 << 21)=0A=
>>> +#define NDCR_FORCE_CSX		(0x1 << 21)=0A=
>>>   #define NDCR_NAND_MODE   	(0x0)=0A=
>>=0A=
>> The three lines above seems to have the same purpose.=0A=
>> I had a look to the specs (pxa/370/375/xp/380/390), and I could=0A=
>> not find any reference to a valid bit 22 in NDCR (it is always=0A=
>> reserved). Maybe you could delete NDCR_ND_MODE and=0A=
>> NDCR_NAND_MODE then ?=0A=
>>=0A=
>>>   #define NDCR_CLR_PG_CNT		(0x1 << 20)=0A=
>>>   #define NFCV1_NDCR_ARB_CNTL	(0x1 << 19)=0A=
>>> @@ -1464,6 +1465,9 @@ static int pxa3xx_nand_config_ident(struct=0A=
>>> pxa3xx_nand_info *info) info->chunk_size =3D PAGE_CHUNK_SIZE;=0A=
>>>   	info->reg_ndcr =3D 0x0; /* enable all interrupts */=0A=
>>>   	info->reg_ndcr |=3D (pdata->enable_arbiter) ?=0A=
>>> NDCR_ND_ARB_EN : 0;=0A=
>>> +	/* Set FORCE_CSX bit for all ARMADAGL-5830741370 Variants.=0A=
>>> Ref#: GL-5830741*/=0A=
>>=0A=
>> You miss a space between "GL-5830741" and "*/".=0A=
>>=0A=
>>> +	if (info->variant =3D=3D PXA3XX_NAND_VARIANT_ARMADA370)=0A=
>>> +		info->reg_ndcr |=3D NDCR_FORCE_CSX;=0A=
>>>   	info->reg_ndcr |=3D NDCR_RD_ID_CNT(READ_ID_BYTES);=0A=
>>>   	info->reg_ndcr |=3D NDCR_SPARE_EN;=0A=
>>>   =0A=
>>> @@ -1498,6 +1502,9 @@ static void pxa3xx_nand_detect_config(struct=0A=
>>> pxa3xx_nand_info *info) info->reg_ndcr =3D ndcr &=0A=
>>>   		~(NDCR_INT_MASK | NDCR_ND_ARB_EN |=0A=
>>> NFCV1_NDCR_ARB_CNTL); info->reg_ndcr |=3D (pdata->enable_arbiter) ?=0A=
>>> NDCR_ND_ARB_EN : 0;=0A=
>>> +	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#:=0A=
>>> GL-5830741*/=0A=
>>=0A=
>> Same here.=0A=
>>=0A=
>>> +	if (info->variant =3D=3D PXA3XX_NAND_VARIANT_ARMADA370)=0A=
>>> +		info->reg_ndcr |=3D NDCR_FORCE_CSX;=0A=
>>>   	info->ndtr0cs0 =3D nand_readl(info, NDTR0CS0);=0A=
>>>   	info->ndtr1cs0 =3D nand_readl(info, NDTR1CS0);=0A=
>>>   }=0A=
>>=0A=
>>=0A=
>> Thanks,=0A=
>> Miqu=E8l=0A=
>>=0A=
> =0A=
> =0A=
> =0A=
=0A=
