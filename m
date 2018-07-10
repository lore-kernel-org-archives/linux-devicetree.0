From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/14] dmaengine: dma-jz4780: Add support for the JZ4770
 SoC
Date: Tue, 10 Jul 2018 17:41:26 +0200
Message-ID: <1531237286.17118.2@crapouillou.net>
References: <20180703123214.23090-1-paul@crapouillou.net>
        <20180703123214.23090-5-paul@crapouillou.net>
        <20180709171032.GJ22377@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180709171032.GJ22377@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org



Le lun. 9 juil. 2018 =E0 19:10, Vinod <vkoul@kernel.org> a =E9crit :
> On 03-07-18, 14:32, Paul Cercueil wrote:
>=20
>>  +static inline void jz4780_dma_chan_disable(struct jz4780_dma_dev=20
>> *jzdma,
>>  +	unsigned int chn)
>>  +{
>>  +	if (jzdma->version =3D=3D ID_JZ4770)
>>  +		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKEC, BIT(chn));
>>  +}
>=20
> this sounds as hardware behaviour, so why not describe as a property=20
> in
> DT?

See my response to your message on patch 1.

>>  +
>>   static struct jz4780_dma_desc *jz4780_dma_desc_alloc(
>>   	struct jz4780_dma_chan *jzchan, unsigned int count,
>>   	enum dma_transaction_type type)
>>  @@ -228,8 +246,15 @@ static void jz4780_dma_desc_free(struct=20
>> virt_dma_desc *vdesc)
>>   	kfree(desc);
>>   }
>>=20
>>  -static uint32_t jz4780_dma_transfer_size(unsigned long val,=20
>> uint32_t *shift)
>>  +static const unsigned int jz4780_dma_ord_max[] =3D {
>>  +	[ID_JZ4770] =3D 6,
>>  +	[ID_JZ4780] =3D 7,
>>  +};
>=20
> So this gives the transfer length supported?

Yes, exactly. The maximum transfer size is (1 << ord).

> --
> ~Vinod
=
