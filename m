From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: cros ec: spi: Add delay for raising CS
Date: Mon, 25 Nov 2013 10:45:32 +0000
Message-ID: <20131125104532.GF17722@lee--X1>
References: <1385143550-31901-1-git-send-email-treding@nvidia.com>
 <20131125094503.GD17722@lee--X1>
 <20131125100428.GG22043@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131125100428.GG22043-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > > From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > > The EC has specific timing it requires. Add support for an option=
al delay
> > > after raising CS to fix timing issues. This is configurable based=
 on
> > > a DT property "google,cros-ec-spi-msg-delay".
> > >=20
> > > If this property isn't set, then no delay will be added. However,=
 if set
> > > it will cause a delay equal to the value passed to it to be inser=
ted at
> > > the end of a transaction.
> > >=20
> > > Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > Reviewed-by: Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > Reviewed-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > > Changes in v2:
> > > - make property description more verbose
> > >=20
> > >  Documentation/devicetree/bindings/mfd/cros-ec.txt |  9 +++++++
> >=20
> > We need a DT dude to look over this.
>=20
> I think Mark Rutland looked at this last week and I think I've addres=
sed
> all his comments. Hopefully he'll find the time to review this.

Right, I just need his (or one of the other guy's) Ack(s) before I can
apply the patch.

> > > +	/* Check for any DT properties */
> > > +	if (IS_ENABLED(CONFIG_OF) && dev->of_node)
> >=20
> > No need for the first check.
>=20
> Why not? While it is true that dev->of_node would be enough to determ=
ine
> that the device was instantiated from a device tree, the IS_ENABLED()
> will allow the compiler to throw away cros_ec_spi_dt_probe() if OF is=
n't
> enabled. At the same time it's nicer than #ifdeffery sprinkled across
> the file and it actually compile-tests all the code. Win-win-win, isn=
't
> it?

I agree that it's better than #ifdeffery, but I didn't know that if
this check tested negative that the subordinate method would be
optimised out by the compiler. Are you sure that happens? Also, how
often is this used without DT?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
