From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mfd: cros ec: spi: Add delay for raising CS
Date: Fri, 6 Dec 2013 22:02:45 +0100
Message-ID: <20131206210244.GA1280@mithrandir>
References: <1385143550-31901-1-git-send-email-treding@nvidia.com>
 <20131125094503.GD17722@lee--X1>
 <20131125100428.GG22043@ulmo.nvidia.com>
 <20131125104532.GF17722@lee--X1>
 <20131125112852.GK22043@ulmo.nvidia.com>
 <20131125121035.GG17722@lee--X1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131125121035.GG17722@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2013 at 12:10:35PM +0000, Lee Jones wrote:
> > > > > > +	/* Check for any DT properties */
> > > > > > +	if (IS_ENABLED(CONFIG_OF) && dev->of_node)
> > > > >=20
> > > > > No need for the first check.
> > > >=20
> > > > Why not? While it is true that dev->of_node would be enough to dete=
rmine
> > > > that the device was instantiated from a device tree, the IS_ENABLED=
()
> > > > will allow the compiler to throw away cros_ec_spi_dt_probe() if OF =
isn't
> > > > enabled. At the same time it's nicer than #ifdeffery sprinkled acro=
ss
> > > > the file and it actually compile-tests all the code. Win-win-win, i=
sn't
> > > > it?
> > >=20
> > > I agree that it's better than #ifdeffery, but I didn't know that if
> > > this check tested negative that the subordinate method would be
> > > optimised out by the compiler. Are you sure that happens?
> >=20
> > I'm pretty sure that's what happens. If you have code like this (which
> > is pretty much what the above evaluates to if !OF):
> >=20
> > 	static void foo(void)
> > 	{
> > 		...
> > 	}
> >=20
> > 	void bar(void)
> > 	{
> > 		if (0)
> > 			foo();
> > 	}
> >=20
> > Then the compiler would be actively stupid if it kept foo around.
>=20
> +1
>=20
> > > Also, how often is this used without DT?
> >=20
> > Well, it doesn't have a dependency on OF, so it can be used without it.
> > In-tree there seems to be no indication that it is used without DT, but
> > given that there's no dependency it makes sense to keep it optional.
> >=20
> > Of course we could also add the dependency if it really isn't used
> > outside of a DT context.
> =09
> This would obviously be my preference. I'd be surprised if anyone was
> using this with platform data, but as you say, you never know. Perhaps
> it would be worth obtaining for clarification from the Google guys?=20

Bernie, Andrew, Rhyland, can anyone of you comment. Are you aware of
this driver being used with a non-DT setup? I suspect maybe on Intel
Chromebooks it might be, but I couldn't find any evidence of that in
the upstream kernel.

In fact the only upstream user of cros-ec seems to be exynos5250-snow,
which I think is one of the Chromebooks, but it uses DT as well.

Are there any objections to removing non-DT support from the driver?

Thierry

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSojt0AAoJEN0jrNd/PrOhfzEQAL7n4hSFlDEH+8/s8lwTLk6m
KB9fRwXckuR8i+JIUPLofO21kb6H6KfTWwx9UIi3HX9s1+/MJ9nCPkdkOCcUBOVl
p/TISa6omjrQI1xYL5byXebV8G2WcYWMNdIvinXjjC+Pjdp50fMxN38vRZfRlmAX
Gi/QF/qF7cee/klT7GK8cZ1d1JsXGu5pOY5uTVtCiS9BNAVuG4rBmqbz0ZYb37vi
cfIMtoiEsquMYTsXITlA1ptFbjljhnhO+g03m9yphpsUvniGZ052Lll4XZrlS+Rp
mv8SCXNPYs3yL814lLwCTNtT3WFYtSXKUZUCubC4vJE6vCCwS4WBW70HyQuiuQW1
U5NNLqE22UqUkaZWxdcvp1cxD1UXe+WxIl3M6zwwjEfgtfeMBMIM4gco0Xl6Kt2t
lPCQhNL8xrrdxjFUjNdtNddcQ82ijqe9zy7N4HoRcRuFkxnjrEeGErmlRbBXvL8z
gF4SOSJezgWEqzFPHHIHtdo1QZGitFo0vlKMnmixcmLnIs1IakxsJwrndIcNE2Hd
jp4LZ9+iSDWw3T3aWGKhKYdt2OFdUSCUobdOnKVoOs5zVMnfwmLN+C3lH1asuaxB
cmLj6ersTKWf71SCLmmMH2HhF2nwLhlBe+VLWF7YmXIeW7xelbmIUTvQLqTRB0yc
npwbu+55dB1DiPryAwli
=UmLA
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
