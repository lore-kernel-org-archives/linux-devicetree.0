From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: cros ec: spi: Add delay for raising CS
Date: Mon, 25 Nov 2013 12:10:35 +0000
Message-ID: <20131125121035.GG17722@lee--X1>
References: <1385143550-31901-1-git-send-email-treding@nvidia.com>
 <20131125094503.GD17722@lee--X1>
 <20131125100428.GG22043@ulmo.nvidia.com>
 <20131125104532.GF17722@lee--X1>
 <20131125112852.GK22043@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131125112852.GK22043-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > > > > +	/* Check for any DT properties */
> > > > > +	if (IS_ENABLED(CONFIG_OF) && dev->of_node)
> > > >=20
> > > > No need for the first check.
> > >=20
> > > Why not? While it is true that dev->of_node would be enough to de=
termine
> > > that the device was instantiated from a device tree, the IS_ENABL=
ED()
> > > will allow the compiler to throw away cros_ec_spi_dt_probe() if O=
=46 isn't
> > > enabled. At the same time it's nicer than #ifdeffery sprinkled ac=
ross
> > > the file and it actually compile-tests all the code. Win-win-win,=
 isn't
> > > it?
> >=20
> > I agree that it's better than #ifdeffery, but I didn't know that if
> > this check tested negative that the subordinate method would be
> > optimised out by the compiler. Are you sure that happens?
>=20
> I'm pretty sure that's what happens. If you have code like this (whic=
h
> is pretty much what the above evaluates to if !OF):
>=20
> 	static void foo(void)
> 	{
> 		...
> 	}
>=20
> 	void bar(void)
> 	{
> 		if (0)
> 			foo();
> 	}
>=20
> Then the compiler would be actively stupid if it kept foo around.

+1

> > Also, how often is this used without DT?
>=20
> Well, it doesn't have a dependency on OF, so it can be used without i=
t.
> In-tree there seems to be no indication that it is used without DT, b=
ut
> given that there's no dependency it makes sense to keep it optional.
>=20
> Of course we could also add the dependency if it really isn't used
> outside of a DT context.
=09
This would obviously be my preference. I'd be surprised if anyone was
using this with platform data, but as you say, you never know. Perhaps
it would be worth obtaining for clarification from the Google guys?=20

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
