From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/3] thermal: sun50i: add thermal driver for h6
Date: Tue, 21 May 2019 09:47:23 +0200
Message-ID: <20190521074723.s3hcrnpc5pkdreqe@flea>
References: <20190512082614.9045-1-tiny.windzz@gmail.com>
 <20190512082614.9045-3-tiny.windzz@gmail.com>
 <20190512133930.t5txssl7mou2gljt@flea>
 <CA+E=qVe82xXPBXpgyLgt2ME6EjGMWWMVvD5eU-b3ntQk_okMdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uzo2p4ihnuoqkun5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+E=qVe82xXPBXpgyLgt2ME6EjGMWWMVvD5eU-b3ntQk_okMdg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Mark Rutland <mark.rutland@arm.com>, daniel.lezcano@linaro.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, bjorn.andersson@linaro.org, mchehab+samsung@kernel.org, paulmck@linux.ibm.com, Stefan Wahren <stefan.wahren@i2se.com>, linux-pm@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Jagan Teki <jagan@amarulasolutions.com>, andy.gross@linaro.org, rui.zhang@intel.com, devicetree <devicetree@vger.kernel.org>, marc.w.gonzalez@free.fr, edubezval@gmail.com, enric.balletbo@collabora.com, Rob Herring <robh+dt@kernel.org>, Jonathan.Cameron@huawei.com, arm-linux <linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, Olof
List-Id: devicetree@vger.kernel.org


--uzo2p4ihnuoqkun5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 17, 2019 at 12:21:57PM -0700, Vasily Khoruzhick wrote:
> On Sun, May 12, 2019 at 6:39 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > +static int tsens_get_temp(void *data, int *temp)
> > > +{
> > > +     struct tsensor *s = data;
> > > +     struct tsens_device *tmdev = s->tmdev;
> > > +     int val;
> > > +
> > > +     regmap_read(tmdev->regmap, tmdev->chip->temp_data_base +
> > > +                 0x4 * s->id, &val);
> > > +
> > > +     if (unlikely(val == 0))
> > > +             return -EBUSY;
> >
> > I'm not sure why a val equals to 0 would be associated with EBUSY?
>
> First few reads of temp data return 0, and in case of H6 (and A64) it
> means max temperature, so kernel does emergency shutdown. I used
> -ETIMEDOUT as a workaround in my tree, but it's not appropriate here
> either. Any suggestions are welcome.

If we can use the interrupts and wait for a value to be converted
before we read, then we should do that.

> > Also, it's not in a fast path, so you can drop the unlikely. Chances
> > are it's not that unlikely anyway.
>
> As I said earlier, it's just few samples after start up.

That's not really my point though. unlikely is tricky to get right,
because the compiler has his own meaning of what exactly unlikely
means statistically to be able to do the right branching
optimisations.

However, this particular real case scenario might not have the same
probability, which might result in a poor optimisation choice due to
the unlikely being there.

Moreover, this probability can evolve in the future. For example,
let's assume that we enable dynamic PM in the driver. Starting from
there, most of the reads become "first" reads, and your unlikely case
becomes the likely one.

My point was that, because of this, and because of the fact that it's
really not a hot path, we should just drop it.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--uzo2p4ihnuoqkun5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOOtCwAKCRDj7w1vZxhR
xagHAQDdykPbWKdDic/RhsfGFYna5RZkWIPRvdVdikshfRJofQEAoFj6rDEFv4qd
usQ5po0YFvhjL3xoWPQb0PQV4k9yLwI=
=oWJX
-----END PGP SIGNATURE-----

--uzo2p4ihnuoqkun5--
