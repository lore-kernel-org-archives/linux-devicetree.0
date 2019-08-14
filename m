From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [linux-sunxi] [PATCH] ARM64: dts: allwinner: Add devicetree for
 pine H64 modelA evaluation board
Date: Wed, 14 Aug 2019 15:28:53 +0200
Message-ID: <CAJiuCcfASQriPLMuwuDCn9bU=_8q4jL+KkPo8NmMrrYpOqy2qA@mail.gmail.com>
References: <20190808084253.10573-1-clabbe.montjoie@gmail.com>
 <1648748.TWHgARQioU@jernej-laptop> <20190814132001.GC24324@Red>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814132001.GC24324@Red>
Sender: linux-kernel-owner@vger.kernel.org
To: clabbe.montjoie@gmail.com
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, 14 Aug 2019 at 15:20, Corentin Labbe <clabbe.montjoie@gmail.com> wr=
ote:
>
> On Mon, Aug 12, 2019 at 12:56:56PM +0200, Jernej =C5=A0krabec wrote:
> > Dne =C4=8Detrtek, 08. avgust 2019 ob 10:42:53 CEST je Corentin Labbe na=
pisal(a):
> > > This patch adds the evaluation variant of the model A of the PineH64.
> > > The model A has the same size of the pine64 and has a PCIE slot.
> > >
> > > The only devicetree difference with current pineH64, is the PHY
> > > regulator.
> >
> > I have Model A board which also needs ddc-en-gpios property for HDMI co=
nnector
> > in order for HDMI to work correctly. Otherwise it will just use 1024x76=
8
> > resolution. Can you confirm that?

Schematics Rev A:
http://files.pine64.org/doc/Pine%20H64/Pine%20H64%20Ver1.1-20180104.pdf

Rev B:
http://files.pine64.org/doc/Pine%20H64/PINE-H6-model-B-20181212-schematic.p=
df

There is a DDC_EN on REV A not on REV B

Regards,
Cl=C3=A9ment

> >
> > Best regards,
> > Jernej
> >
>
> Sorry I didnt use at all video stuff (like HDMI), so I cannot answer now.
>
> Could you send me a patch against my future v2 and I could test with/with=
out.
>
> Regards
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msg=
id/linux-sunxi/20190814132001.GC24324%40Red.
