From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 05/14] dmaengine: dma-jz4780: Add support for the JZ4740
 SoC
Date: Tue, 17 Jul 2018 13:00:29 +0200
Message-ID: <1531825229.5992.0@smtp.crapouillou.net>
References: <20180703123214.23090-1-paul@crapouillou.net>
        <20180703123214.23090-6-paul@crapouillou.net>
        <20180709171226.GK22377@vkoul-mobl> <20180716213339.GA19161@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180716213339.GA19161@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Vinod <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi,

Le lun. 16 juil. 2018 =E0 23:33, Rob Herring <robh@kernel.org> a =E9crit :
> On Mon, Jul 09, 2018 at 10:42:26PM +0530, Vinod wrote:
>>  On 03-07-18, 14:32, Paul Cercueil wrote:
>>=20
>>  >  enum jz_version {
>>  > +	ID_JZ4740,
>>  >  	ID_JZ4770,
>>  >  	ID_JZ4780,
>>  >  };
>>  > @@ -247,6 +248,7 @@ static void jz4780_dma_desc_free(struct=20
>> virt_dma_desc *vdesc)
>>  >  }
>>  >
>>  >  static const unsigned int jz4780_dma_ord_max[] =3D {
>>  > +	[ID_JZ4740] =3D 5,
>>  >  	[ID_JZ4770] =3D 6,
>>  >  	[ID_JZ4780] =3D 7,
>>  >  };
>>  > @@ -801,11 +803,13 @@ static struct dma_chan=20
>> *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
>>  >  }
>>  >
>>  >  static const unsigned int jz4780_dma_nb_channels[] =3D {
>>  > +	[ID_JZ4740] =3D 6,
>>  >  	[ID_JZ4770] =3D 6,
>>  >  	[ID_JZ4780] =3D 32,
>>  >  };
>>=20
>>  I feel these should be done away with if we describe hardware in DT
>=20
> The compatible property can imply things like this.
>=20
> But how this is structured is a bit strange. Normally you have a per
> compatible struct with these as elements and the compatible matching
> selects the struct.

You're right, I'll change that.

>>=20
>>  >
>>  >  static const struct of_device_id jz4780_dma_dt_match[] =3D {
>>  > +	{ .compatible =3D "ingenic,jz4740-dma", .data =3D (void *)ID_JZ4740=
=20
>> },
>>=20
>>  adding .compatible should be the only thing required, if at all for=20
>> this
>>  addition :)
>>=20
>>  --
>>  ~Vinod
=
