From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v3 1/1] mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370
 variants.
Date: Sun, 15 Oct 2017 20:55:43 +0000
Message-ID: <5d708701612f48cf958da5feeb68365f@svr-chch-ex1.atlnz.lc>
References: <20170928005756.3938-1-kalyan.kinthada@alliedtelesis.co.nz>
 <20170928005756.3938-2-kalyan.kinthada@alliedtelesis.co.nz>
 <20171014151233.4e9ff319@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis.co.nz>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>, "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>, "miquel.raynal@free-electrons.com" <miquel.raynal@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,=0A=
=0A=
On 15/10/17 02:13, Boris Brezillon wrote:=0A=
> Hi Kalyan,=0A=
> =0A=
> On Thu, 28 Sep 2017 13:57:56 +1300=0A=
> Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> When the arbitration between NOR and NAND flash is enabled=0A=
>> the <FORCE_CSX> field bit[21] in the Data Flash Control Register=0A=
>> needs to be set to 1 according to guidleine GL-5830741 mentioned=0A=
>> in Marvell Errata document MV-S501377-00, Rev. D.=0A=
> =0A=
> The real question is, is this patch fixing a real bug or are you just=0A=
> setting this bit because a guideline says it should be set?=0A=
=0A=
Yes that's a fair summary. It is in a document called "Functional =0A=
Errata" so there is some feeling here that we (allied telesis) should =0A=
follow up things in these kinds of documents.=0A=
=0A=
> As far as I=0A=
> understand, noone fully understands what this bit does and why it needs=
=0A=
> to be set, so if you're not fixing a real bug, I'd prefer keeping the=0A=
> code unchanged code until someone complains for a good reason.=0A=
=0A=
Agreed. We've certainly not noticed a change in behaviour on our boards. =
=0A=
I've requested more information from Marvell through their support =0A=
channels. I'll share what I can if/when they come back with something =0A=
useful.=0A=
=0A=
> =0A=
> Regards,=0A=
> =0A=
> Boris=0A=
> =0A=
>>=0A=
>> This commit sets the FORCE_CSX bit to 1 for all=0A=
>> ARMADA370 variants as the arbitration is always enabled by default.=0A=
>> This change does not apply for pxa3xx variants because the FORCE_CSX=0A=
>> bit does not exist/reserved on the NFCv1.=0A=
>>=0A=
>> The NDCR_ND_MODE conflicts with the new NDCR_FORCE_CSX but is unused so=
=0A=
>> remove it along with NDCR_NAND_MODE.=0A=
>>=0A=
>> Signed-off-by: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>=0A=
>> ---=0A=
>>   drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--=0A=
>>   1 file changed, 7 insertions(+), 2 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_na=
nd.c=0A=
>> index 85cff68643e0..a6a7a5af7bed 100644=0A=
>> --- a/drivers/mtd/nand/pxa3xx_nand.c=0A=
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c=0A=
>> @@ -67,8 +67,7 @@=0A=
>>   #define NDCR_DWIDTH_M		(0x1 << 26)=0A=
>>   #define NDCR_PAGE_SZ		(0x1 << 24)=0A=
>>   #define NDCR_NCSX		(0x1 << 23)=0A=
>> -#define NDCR_ND_MODE		(0x3 << 21)=0A=
>> -#define NDCR_NAND_MODE   	(0x0)=0A=
>> +#define NDCR_FORCE_CSX		(0x1 << 21)=0A=
>>   #define NDCR_CLR_PG_CNT		(0x1 << 20)=0A=
>>   #define NFCV1_NDCR_ARB_CNTL	(0x1 << 19)=0A=
>>   #define NFCV2_NDCR_STOP_ON_UNCOR	(0x1 << 19)=0A=
>> @@ -1464,6 +1463,9 @@ static int pxa3xx_nand_config_ident(struct pxa3xx_=
nand_info *info)=0A=
>>   	info->chunk_size =3D PAGE_CHUNK_SIZE;=0A=
>>   	info->reg_ndcr =3D 0x0; /* enable all interrupts */=0A=
>>   	info->reg_ndcr |=3D (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;=0A=
>> +	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#: GL-5830741 */=
=0A=
>> +	if (info->variant =3D=3D PXA3XX_NAND_VARIANT_ARMADA370)=0A=
>> +		info->reg_ndcr |=3D NDCR_FORCE_CSX;=0A=
>>   	info->reg_ndcr |=3D NDCR_RD_ID_CNT(READ_ID_BYTES);=0A=
>>   	info->reg_ndcr |=3D NDCR_SPARE_EN;=0A=
>>   =0A=
>> @@ -1498,6 +1500,9 @@ static void pxa3xx_nand_detect_config(struct pxa3x=
x_nand_info *info)=0A=
>>   	info->reg_ndcr =3D ndcr &=0A=
>>   		~(NDCR_INT_MASK | NDCR_ND_ARB_EN | NFCV1_NDCR_ARB_CNTL);=0A=
>>   	info->reg_ndcr |=3D (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;=0A=
>> +	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#: GL-5830741 */=
=0A=
>> +	if (info->variant =3D=3D PXA3XX_NAND_VARIANT_ARMADA370)=0A=
>> +		info->reg_ndcr |=3D NDCR_FORCE_CSX;=0A=
>>   	info->ndtr0cs0 =3D nand_readl(info, NDTR0CS0);=0A=
>>   	info->ndtr1cs0 =3D nand_readl(info, NDTR1CS0);=0A=
>>   }=0A=
> =0A=
> =0A=
=0A=
