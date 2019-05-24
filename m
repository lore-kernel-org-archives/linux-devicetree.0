From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v5 4/5] ARM: dts: da850-evm: enable cpufreq
Date: Fri, 24 May 2019 18:58:04 +0200
Message-ID: <CAMRc=Me9hwsLdpDVfs+cb_rqrWs=+bJOa9nEFY+xs_vs5LAXXA@mail.gmail.com>
References: <20190417152701.23391-1-brgl@bgdev.pl> <20190417152701.23391-5-brgl@bgdev.pl>
 <CAHCN7xKVaYqd5LLvRx7i8ik+JnTFdpexZf2WXt0R2N1W1skOJA@mail.gmail.com> <CAMpxmJW9yWcQ8497OwOhMN8wj-Cmc3-UP7Rh-yoU_uDaQkVVSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMpxmJW9yWcQ8497OwOhMN8wj-Cmc3-UP7Rh-yoU_uDaQkVVSw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Adam Ford <aford173@gmail.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

wt., 23 kwi 2019 o 11:15 Bartosz Golaszewski
<bgolaszewski@baylibre.com> napisa=C5=82(a):
>
> =C5=9Br., 17 kwi 2019 o 19:09 Adam Ford <aford173@gmail.com> napisa=C5=82=
(a):
> >
> > On Wed, Apr 17, 2019 at 10:27 AM Bartosz Golaszewski <brgl@bgdev.pl> wr=
ote:
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > Enable cpufreq-dt support for da850-evm. The cvdd is supplied by the
> > > tps65070 pmic with configurable output voltage. By default da850-evm
> > > boards support frequencies up to 375MHz so enable this operating
> > > point.
> >
> > Have you done any testing with the LCD on any of the devices you have?
> >
> > I enabled the ondemand governor, and I got a bunch of splat from the
> > LCD controller:
> >
> > tilcdc 1e13000.display: effective pixel clock rate (50000000Hz)
> > differs from the calculated rate (54000000Hz)
> > tilcdc 1e13000.display: tilcdc_crtc_irq(0x00000161): FIFO underflow
> > tilcdc 1e13000.display: tilcdc_crtc_irq(0x00000161): FIFO underflow
> > ... [ snip]
> > tilcdc 1e13000.display: effective pixel clock rate (50000000Hz)
> > differs from the calculated rate (54000000Hz)
> > tilcdc 1e13000.display: effective pixel clock rate (50000000Hz)
> > differs from the calculated rate (54000000Hz)
> > tilcdc 1e13000.display: tilcdc_crtc_irq(0x00000161): FIFO underflow
> >
> > It appears to go on forever.  I don't necessarily want to hold it up,
> > but I don't know the clocking system well enough to know where to go
> > investigate it.  I can certainly live without ondemand.  Using
> > userspace as the default governor is fine for me for now.
> >
> > adam
>
> Hi Adam,
>
> I did test the tilcdc on da850-lcdk. The only message I'm getting
> during transitions is a single:
>
> tilcdc <name>: tilcdc_crtc_irq(<address>): FIFO underflow
>
> but this is fairly normal - we also get this during modeset and it
> doesn't affect the display.
>
> The problem with the pixel clock may come from the bootloader - are
> you using a recent version of u-boot?
>
> Bart
>
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > Reviewed-by: Adam Ford <aford173@gmail.com>
> > > ---
> > >  arch/arm/boot/dts/da850-evm.dts | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da85=
0-evm.dts
> > > index f04bc3e15332..f94bb38fdad9 100644
> > > --- a/arch/arm/boot/dts/da850-evm.dts
> > > +++ b/arch/arm/boot/dts/da850-evm.dts
> > > @@ -191,6 +191,19 @@
> > >         };
> > >  };
> > >
> > > +&cpu {
> > > +       cpu-supply =3D <&vdcdc3_reg>;
> > > +};
> > > +
> > > +/*
> > > + * The standard da850-evm kits and SOM's are 375MHz so enable this o=
perating
> > > + * point by default. Higher frequencies must be enabled for custom b=
oards with
> > > + * other variants of the SoC.
> > > + */
> > > +&opp_375 {
> > > +       status =3D "okay";
> > > +};
> > > +
> > >  &sata {
> > >         status =3D "okay";
> > >  };
> > > --
> > > 2.21.0
> > >

Hi Adam,

did you figure out the problem by chance? Are you OK with merging this seri=
es?

Bart
