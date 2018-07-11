From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 02/14] dmaengine: dma-jz4780: Separate chan/ctrl registers
Date: Thu, 12 Jul 2018 01:13:05 +0200
Message-ID: <1531350785.2021.0@smtp.crapouillou.net>
References: <20180703123214.23090-1-paul@crapouillou.net>
        <20180703123214.23090-3-paul@crapouillou.net>
        <20180709170359.GI22377@vkoul-mobl> <1531237019.17118.1@crapouillou.net>
        <20180711121655.GS3219@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180711121655.GS3219@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org



Le mer. 11 juil. 2018 =E0 14:16, Vinod <vkoul@kernel.org> a =E9crit :
> On 10-07-18, 17:36, Paul Cercueil wrote:
>=20
>>  > >  @@ -3,7 +3,8 @@
>>  > >   Required properties:
>>  > >
>>  > >   - compatible: Should be "ingenic,jz4780-dma"
>>  > >  -- reg: Should contain the DMA controller registers location=20
>> and
>>  > > length.
>>  > >  +- reg: Should contain the DMA channel registers location and
>>  > > length, followed
>>  > >  +  by the DMA controller registers location and length.
>>  > >   - interrupts: Should contain the interrupt specifier of the=20
>> DMA
>>  > > controller.
>>  > >   - interrupt-parent: Should be the phandle of the interrupt
>>  > > controller that
>>  > >   - clocks: Should contain a clock specifier for the JZ4780 PDMA
>>  > > clock.
>>  > >  @@ -22,7 +23,8 @@ Example:
>>  > >
>>  > >   dma: dma@13420000 {
>>  > >   	compatible =3D "ingenic,jz4780-dma";
>>  > >  -	reg =3D <0x13420000 0x10000>;
>>  > >  +	reg =3D <0x13420000 0x400
>>  > >  +	       0x13421000 0x40>;
>>  >
>>  > Second should be optional or we break platform which may not have
>>  > updated DT..
>>=20
>>  See comment below.
>>=20
>>  > >  -	jzdma->base =3D devm_ioremap_resource(dev, res);
>>  > >  -	if (IS_ERR(jzdma->base))
>>  > >  -		return PTR_ERR(jzdma->base);
>>  > >  +	jzdma->chn_base =3D devm_ioremap_resource(dev, res);
>>  > >  +	if (IS_ERR(jzdma->chn_base))
>>  > >  +		return PTR_ERR(jzdma->chn_base);
>>  > >  +
>>  > >  +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
>>  > >  +	if (!res) {
>>  > >  +		dev_err(dev, "failed to get I/O memory\n");
>>  > >  +		return -EINVAL;
>>  > >  +	}
>>  >
>>  > okay and this breaks if you happen to get probed on older DT. I=20
>> think DT
>>  > is treated as ABI so you need to continue support older method=20
>> while
>>  > finding if DT has split resources
>>=20
>>  See my response to PrasannaKumar. All the Ingenic-based boards do=20
>> compile
>>  the devicetree within the kernel, so I think it's still fine to add=20
>> breaking
>>  changes. I'll wait on @Rob to give his point of view on this,=20
>> though.
>>=20
>>  (It's not something hard to change, but I'd like to know what's the=20
>> policy
>>  in that case. I have other DT-breaking patches to submit)
>=20
> The policy is that DT is an ABI and should not break :)
>=20
> Who maintains Ingenic arch. MAINTAINERS doesn't tell me.

Unofficially that would be me :)

Otherwise that would be the MIPS maintainers, Ralf and Paul (Burton).

> --
> ~Vinod
=
