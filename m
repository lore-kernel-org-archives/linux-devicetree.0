From: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: da850-evm: enable cpufreq
Date: Fri, 12 Apr 2019 08:59:44 -0500
Message-ID: <CAHCN7x+BpuuNnV+wteD=JBwuYF3z7EDD4kig26Kj4rOdJcW+LA@mail.gmail.com>
References: <20190408075924.2284-1-brgl@bgdev.pl> <20190408075924.2284-3-brgl@bgdev.pl>
 <57fe079c-fd69-45ef-b4fb-a2c792218c21@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57fe079c-fd69-45ef-b4fb-a2c792218c21@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2019 at 8:06 AM Sekhar Nori <nsekhar@ti.com> wrote:
>
> On 08/04/19 1:29 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Enable cpufreq-dt support for da850-evm. The cvdd is supplied by the
> > tps6507 pmic with configurable output voltage, so all operating points
> > can be enabled.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Adam, can you please ack? Looks good to me.

Sekhar,
Based on what I read in the thread about the LCDK, I want to do some
tests on the da850-evm before put my name on it.  I like what I see in
general, so I am excited to this this here.

Bartosz - which kernel branch should I use as a starting point to apply these?

adam
>
> Thanks,
> Sekhar
>
> > ---
> >  arch/arm/boot/dts/da850-evm.dts | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
> > index f04bc3e15332..f94bb38fdad9 100644
> > --- a/arch/arm/boot/dts/da850-evm.dts
> > +++ b/arch/arm/boot/dts/da850-evm.dts
> > @@ -191,6 +191,19 @@
> >       };
> >  };
> >
> > +&cpu {
> > +     cpu-supply = <&vdcdc3_reg>;
> > +};
> > +
> > +/*
> > + * The standard da850-evm kits and SOM's are 375MHz so enable this operating
> > + * point by default. Higher frequencies must be enabled for custom boards with
> > + * other variants of the SoC.
> > + */
> > +&opp_375 {
> > +     status = "okay";
> > +};
> > +
> >  &sata {
> >       status = "okay";
> >  };
> > --
> > 2.21.0
> >
>
