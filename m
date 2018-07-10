Return-Path: <SRS0=MMVR=J2=crapouillou.net=paul@kernel.org>
Date: Tue, 10 Jul 2018 17:29:06 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 01/14] dmaengine: dma-jz4780: Avoid hardcoding number of
 channels
Message-Id: <1531236550.17118.0@crapouillou.net>
In-Reply-To: <20180709165945.GH22377@vkoul-mobl>
References: <20180703123214.23090-1-paul@crapouillou.net>
	<20180703123214.23090-2-paul@crapouillou.net>
	<20180709165945.GH22377@vkoul-mobl>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-5aoy//xP6d8p5q3tJdl/"
To: Vinod <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-ID: <devicetree@vger.kernel.org>

--=-5aoy//xP6d8p5q3tJdl/
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

Le lun. 9 juil. 2018 =E0 18:59, Vinod <vkoul@kernel.org> a =E9crit :
> On 03-07-18, 14:32, Paul Cercueil wrote:
>=20
>>   struct jz4780_dma_dev {
>>   	struct dma_device dma_device;
>>   	void __iomem *base;
>>   	struct clk *clk;
>>   	unsigned int irq;
>>  +	unsigned int nb_channels;
>>  +	enum jz_version version;
>>=20
>>   	uint32_t chan_reserved;
>>  -	struct jz4780_dma_chan chan[JZ_DMA_NR_CHANNELS];
>>  +	struct jz4780_dma_chan chan[];
>=20
> why array, why not channel pointer?

I can alloc the jz4780_dma_dev struct + the right number of=20
jz4780_dma_chan
structures in one kzalloc() call. This is pretty standard.

>>  +static const unsigned int jz4780_dma_nb_channels[] =3D {
>>  +	[ID_JZ4780] =3D 32,
>>  +};
>>  +
>>  +static const struct of_device_id jz4780_dma_dt_match[] =3D {
>>  +	{ .compatible =3D "ingenic,jz4780-dma", .data =3D (void *)ID_JZ4780 }=
,
>>  +	{},
>>  +};
>=20
> Looking at description I was hoping that channels would be in DT,
> channels is hardware information, so should come from DT rather than
> coding the kernel...

I had a talk with Linus Walleij (GPIO maintainer) about that:
http://lkml.iu.edu/hypermail/linux/kernel/1701.3/05422.html

And I agree with him, we shouldn't have in devicetree what we can deduce
from the compatible string. But there doesn't seem to be an enforced
policy about it.

@Rob, what do you think?

>>  -	jzdma =3D devm_kzalloc(dev, sizeof(*jzdma), GFP_KERNEL);
>>  +	if (of_id)
>>  +		version =3D (enum jz_version)of_id->data;
>>  +	else
>>  +		version =3D ID_JZ4780; /* Default when not probed from DT */
>=20
> where else would it be probed from.... ?

Platform, MFD driver, etc. But not likely to happen.
I can remove these lines if you want.

> --
> ~Vinod
=

--=-5aoy//xP6d8p5q3tJdl/
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Hi Vinod,</div></div><div id=3D"ge=
ary-quote" dir=3D"auto"><br>Le lun. 9 juil. 2018 =E0 18:59, Vinod &lt;vkoul=
@kernel.org&gt; a =E9crit&nbsp;:<br><blockquote type=3D"cite"><div class=3D=
"plaintext" style=3D"white-space: pre-wrap;">On 03-07-18, 14:32, Paul Cercu=
eil wrote:

<blockquote>  struct jz4780_dma_dev {
  	struct dma_device dma_device;
  	void __iomem *base;
  	struct clk *clk;
  	unsigned int irq;
 +	unsigned int nb_channels;
 +	enum jz_version version;
 =20
  	uint32_t chan_reserved;
 -	struct jz4780_dma_chan chan[JZ_DMA_NR_CHANNELS];
 +	struct jz4780_dma_chan chan[];
</blockquote>
why array, why not channel pointer?</div></blockquote><div><br></div><div>I=
 can alloc the jz4780_dma_dev struct + the right number of jz4780_dma_chan<=
/div><div>structures in one kzalloc() call. This is pretty standard.</div><=
br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space:=
 pre-wrap;"><blockquote> +static const unsigned int jz4780_dma_nb_channels[=
] =3D {
 +	[ID_JZ4780] =3D 32,
 +};
 +
 +static const struct of_device_id jz4780_dma_dt_match[] =3D {
 +	{ .compatible =3D "ingenic,jz4780-dma", .data =3D (void *)ID_JZ4780 },
 +	{},
 +};
</blockquote>
Looking at description I was hoping that channels would be in DT,
channels is hardware information, so should come from DT rather than
coding the kernel...</div></blockquote><span style=3D"white-space: pre-wrap=
;"><div><span style=3D"white-space: pre-wrap;"><br></span></div><div><span =
style=3D"white-space: pre-wrap;">I had a talk with Linus Walleij (GPIO main=
tainer) about that:</span></div><div><span style=3D"white-space: pre-wrap;"=
>http://lkml.iu.edu/hypermail/linux/kernel/1701.3/05422.html</span></div><d=
iv><span style=3D"white-space: pre-wrap;"><br></span></div><div><span style=
=3D"white-space: pre-wrap;">And I agree with him, we shouldn't have in devi=
cetree what we can deduce</span></div><div><span style=3D"white-space: pre-=
wrap;">from the compatible string. But there doesn't seem to be an enforced=
</span></div><div><span style=3D"white-space: pre-wrap;">policy about it.</=
span></div><div><span style=3D"white-space: pre-wrap;"><br></span></div><di=
v><span style=3D"white-space: pre-wrap;">@Rob, what do you think?</span></d=
iv><br></span><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"w=
hite-space: pre-wrap;"><blockquote> -	jzdma =3D devm_kzalloc(dev, sizeof(*j=
zdma), GFP_KERNEL);
 +	if (of_id)
 +		version =3D (enum jz_version)of_id-&gt;data;
 +	else
 +		version =3D ID_JZ4780; /* Default when not probed from DT */
</blockquote>
where else would it be probed from.... ?</div></blockquote><span style=3D"w=
hite-space: pre-wrap;"><div><span style=3D"white-space: pre-wrap;"><br></sp=
an></div><div><span style=3D"white-space: pre-wrap;">Platform, MFD driver, =
etc. But not likely to happen.</span></div><div><span style=3D"white-space:=
 pre-wrap;">I can remove these lines if you want.</span></div><br></span><b=
lockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: pre-=
wrap;"><div>--=20
</div>~Vinod
</div></blockquote></div>=

--=-5aoy//xP6d8p5q3tJdl/--
