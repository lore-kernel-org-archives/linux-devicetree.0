From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 07/18] dmaengine: dma-jz4780: Add support for the
 JZ4770 SoC
Date: Tue, 24 Jul 2018 17:04:55 +0200
Message-ID: <1532444695.2610.1@smtp.crapouillou.net>
References: <20180721110643.19624-1-paul@crapouillou.net>
        <20180721110643.19624-8-paul@crapouillou.net>
        <20180724133229.GG3661@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724133229.GG3661@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi Vinod,

Le mar. 24 juil. 2018 =E0 15:32, Vinod <vkoul@kernel.org> a =E9crit :
> On 21-07-18, 13:06, Paul Cercueil wrote:
>>  +static inline void jz4780_dma_chan_enable(struct jz4780_dma_dev=20
>> *jzdma,
>>  +	unsigned int chn)
>=20
> right justified and aligned with preceding please. While adding new
> code to a existing driver it is a good idea to conform to existing=20
> style

OK.

>>  +{
>>  +	if (jzdma->version =3D=3D ID_JZ4770)
>>  +		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKES, BIT(chn));
>>  +}
>>  +
>>  +static inline void jz4780_dma_chan_disable(struct jz4780_dma_dev=20
>> *jzdma,
>>  +	unsigned int chn)
>>  +{
>>  +	if (jzdma->version =3D=3D ID_JZ4770)
>>  +		jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKEC, BIT(chn));
>=20
> so if another version has this feature we would do:
>         if (jzdma->version =3D=3D ID_JZ4770) ||
>                 if (jzdma->version =3D=3D ID_JZXXXX))
>=20
> and so on.. why not add a value, clk_enable in the description and use
> that. For each controller it is set to true or false

I agree with what you said in your other answers.
However here I still need to check the "version", because on JZ4725B=20
and JZ4770+
the way to start/stop each DMA channel's clock is different, so I can't=20
use a boolean.

> --
> ~Vinod

Thanks,
-Paul
=
