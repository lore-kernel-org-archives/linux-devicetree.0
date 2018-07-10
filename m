From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 06/14] dmaengine: dma-jz4780: Add support for the JZ4725B
 SoC
Date: Tue, 10 Jul 2018 17:45:02 +0200
Message-ID: <1531237502.17118.3@crapouillou.net>
References: <20180703123214.23090-1-paul@crapouillou.net>
        <20180703123214.23090-7-paul@crapouillou.net>
        <20180709171458.GL22377@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180709171458.GL22377@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org



Le lun. 9 juil. 2018 =E0 19:14, Vinod <vkoul@kernel.org> a =E9crit :
> On 03-07-18, 14:32, Paul Cercueil wrote:
>>  The JZ4725B has one DMA core starring six DMA channels.
>>  As for the JZ4770, each DMA channel's clock can be enabled with
>>  a register write, the difference here being that once started, it
>>  is not possible to turn it off.
>=20
> ok so disable for this, right..
>=20
>>  @@ -204,6 +205,8 @@ static inline void=20
>> jz4780_dma_chan_enable(struct jz4780_dma_dev *jzdma,
>>   {
>>   	if (jzdma->version =3D=3D ID_JZ4770)
>>   		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKES, BIT(chn));
>>  +	else if (jzdma->version =3D=3D ID_JZ4725B)
>>  +		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKE, BIT(chn));
>=20
> but you are writing to a different register here..

Yes. SoCs >=3D JZ4770 have the DCKE read-only register, and DCKES/DCKEC=20
to set/clear bits in DCKE.
On JZ4725B, DCKE is read/write, but the zeros written are ignored (at=20
least that's what the
documentation says).

> --
> ~Vinod

Thanks,
-Paul
=
