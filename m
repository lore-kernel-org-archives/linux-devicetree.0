From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: media: A31 compatible
Date: Sun, 26 May 2019 21:08:59 +0200
Message-ID: <CAJiuCcdpaw8jLMFUAAqvHr82+UZ4Lf1rrVvB1ksYQ1xcQqTDAg@mail.gmail.com>
References: <20190525180923.6105-1-peron.clem@gmail.com> <20190525180923.6105-2-peron.clem@gmail.com>
 <20190526190217.257pxcc5s7ykhfor@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190526190217.257pxcc5s7ykhfor@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Sun, 26 May 2019 at 21:02, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Sat, May 25, 2019 at 08:09:14PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Since Allwiner A31 all the SoC have a differente memory mapping.
> >
> > Introduce this bindings to make a difference since this generation.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>
> Mentionning what those differences are would be great

Will do,
Thanks for the review,
Cl=C3=A9ment

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com, "Missing dma-requests, using %u.\n",
> > -                      DMA_CHAN_MAX_DRQ_A31);
> > -             sdc->max_request =3D DMA_CHAN_MAX_DRQ_A31;
> > +                      DMA_CHAN_MA
