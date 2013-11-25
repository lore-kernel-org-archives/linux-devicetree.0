From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mfd: cros ec: spi: Add delay for raising CS
Date: Mon, 25 Nov 2013 12:28:53 +0100
Message-ID: <20131125112852.GK22043@ulmo.nvidia.com>
References: <1385143550-31901-1-git-send-email-treding@nvidia.com>
 <20131125094503.GD17722@lee--X1>
 <20131125100428.GG22043@ulmo.nvidia.com>
 <20131125104532.GF17722@lee--X1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45wMVEkw4XUbiYON"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131125104532.GF17722@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--45wMVEkw4XUbiYON
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2013 at 10:45:32AM +0000, Lee Jones wrote:
> > > > From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > >=20
> > > > The EC has specific timing it requires. Add support for an optional=
 delay
> > > > after raising CS to fix timing issues. This is configurable based on
> > > > a DT property "google,cros-ec-spi-msg-delay".
> > > >=20
> > > > If this property isn't set, then no delay will be added. However, i=
f set
> > > > it will cause a delay equal to the value passed to it to be inserte=
d at
> > > > the end of a transaction.
> > > >=20
> > > > Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > Reviewed-by: Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > Reviewed-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > > > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > > > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > > > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > > Changes in v2:
> > > > - make property description more verbose
> > > >=20
> > > >  Documentation/devicetree/bindings/mfd/cros-ec.txt |  9 +++++++
> > >=20
> > > We need a DT dude to look over this.
> >=20
> > I think Mark Rutland looked at this last week and I think I've addressed
> > all his comments. Hopefully he'll find the time to review this.
>=20
> Right, I just need his (or one of the other guy's) Ack(s) before I can
> apply the patch.

Sure, no problem.

> > > > +	/* Check for any DT properties */
> > > > +	if (IS_ENABLED(CONFIG_OF) && dev->of_node)
> > >=20
> > > No need for the first check.
> >=20
> > Why not? While it is true that dev->of_node would be enough to determine
> > that the device was instantiated from a device tree, the IS_ENABLED()
> > will allow the compiler to throw away cros_ec_spi_dt_probe() if OF isn't
> > enabled. At the same time it's nicer than #ifdeffery sprinkled across
> > the file and it actually compile-tests all the code. Win-win-win, isn't
> > it?
>=20
> I agree that it's better than #ifdeffery, but I didn't know that if
> this check tested negative that the subordinate method would be
> optimised out by the compiler. Are you sure that happens?

I'm pretty sure that's what happens. If you have code like this (which
is pretty much what the above evaluates to if !OF):

	static void foo(void)
	{
		...
	}

	void bar(void)
	{
		if (0)
			foo();
	}

Then the compiler would be actively stupid if it kept foo around. Note
that this is only thrown away because foo() is static and therefore it
cannot be used by anything else except that dead branch. While I have
never checked this personally, I remember it being highlighted as a
feature of the IS_ENABLED() macro back when it was introduced. It is
also quite commonly used throughout the kernel.

> Also, how often is this used without DT?

Well, it doesn't have a dependency on OF, so it can be used without it.
In-tree there seems to be no indication that it is used without DT, but
given that there's no dependency it makes sense to keep it optional.

Of course we could also add the dependency if it really isn't used
outside of a DT context.

Thierry

--45wMVEkw4XUbiYON
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSkzR0AAoJEN0jrNd/PrOh+JQP/Ap2D0FIiIvbUfnQV2Df4YJx
uCNv2VwYVZwhQ0do2v01zM+apuB3ZoNwdbAx6DUbBtjuao+goZNBPJDQaOPpfigB
6uBD3Exwy4iiTcdCFMeAJMHIb/ObDEdd6JEY1VobdcJH2oxIUi2m0TNIfDdrJ+U5
4YKUhAs0pDnREmz+PIZRsnJ3x3hwlkFjlrhy3ylImUJ0qdSmXG941YXXqlfgh0EB
Krtiy/TYJwnF4jVFKMcBmS0z5fnDiDLRsMYL5SOt2JHCvDhpGbtwV7zthIpJez1D
fsr/pjiu44tfKAh5hCEGVClSi0hc79kjpB18jfrhIzq5aDCt5E8VSTo4ss3b8Qyb
v0EkLhkS8iwl2Q3CtpYQXfoWyGFYy/wDQ5KtpmsW8LINJcgxKtWhv/HCffzScC76
R94KIBTspvzZXBVxpbHapWOoARC+q26njFfesCsxSTFFBZaaInsFUmbpeMufsFic
sK3X4DskVmVF3pvfVKMSppIbtqKPlmXYeL7UXHx+nh38APHXHp8xE9f7Mg2rzVUE
/CZN+wsscuMRBCaVTlimJUovRmJidITYM4bFWK1T5bxYPZ8dFCKj7pyfgQ9N5rbU
ijxMENYG6d9b+kGMUYMvTwQdPXdEqRKvIj2R8f7OzK9OkrLeb0xYIGXPZVp34IjO
CY+PdiCvYZM9TUeYlPL0
=7oBn
-----END PGP SIGNATURE-----

--45wMVEkw4XUbiYON--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
