From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v5 1/6] drm: panfrost: add optional bus_clock
Date: Sat, 18 May 2019 00:08:22 +0200
Message-ID: <CAJiuCcdMxXAXYk=QpRwsvBUW0tvBVMqXvgx0Y7fAKP=ouyBnKQ@mail.gmail.com>
References: <20190517184659.18828-1-peron.clem@gmail.com> <20190517184659.18828-2-peron.clem@gmail.com>
 <CAL_JsqKPazGn+g1zS4NMwvQZ_6GcAm0tgcOTqyQA0dz0+2dp3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKPazGn+g1zS4NMwvQZ_6GcAm0tgcOTqyQA0dz0+2dp3g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Neil Armstrong <narmstrong@baylibre.com>, Steven Price <steven.price@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Linux IOMMU <iommu@lists.linux-foundation.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Fri, 17 May 2019 at 22:07, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, May 17, 2019 at 1:47 PM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> >
> > Allwinner H6 has an ARM Mali-T720 MP2 which required a bus_clock.
> >
> > Add an optional bus_clock at the init of the panfrost driver.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_device.c | 25 +++++++++++++++++++++-
> >  drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
> >  2 files changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/d=
rm/panfrost/panfrost_device.c
> > index 3b2bced1b015..8da6e612d384 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> > @@ -44,7 +44,8 @@ static int panfrost_clk_init(struct panfrost_device *=
pfdev)
> >
> >         pfdev->clock =3D devm_clk_get(pfdev->dev, NULL);
> >         if (IS_ERR(pfdev->clock)) {
> > -               dev_err(pfdev->dev, "get clock failed %ld\n", PTR_ERR(p=
fdev->clock));
> > +               dev_err(pfdev->dev, "get clock failed %ld\n",
> > +                       PTR_ERR(pfdev->clock));
>
> Please drop this whitespace change.

Sorry, I thought it was only a mistake here, I will drop it.
Why are they so many lines over 80 characters?
Is there a specific coding style to follow ?

Thanks,
Clement

>
> >                 return PTR_ERR(pfdev->clock);
> >         }
> >
