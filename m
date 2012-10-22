From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 2/3] PWM: vt8500: Update vt8500 PWM driver support
Date: Mon, 22 Oct 2012 09:24:48 +0200
Message-ID: <20121022072448.GB30026@avionic-0098.mockup.avionic-design.de>
References: <1350643135-13197-1-git-send-email-linux@prisktech.co.nz>
 <1350643135-13197-2-git-send-email-linux@prisktech.co.nz>
 <20121022063423.GA17181@avionic-0098.mockup.avionic-design.de>
 <1350888712.3592.11.camel@gitbox> <1350889747.3592.17.camel@gitbox>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7238801296702582285=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1350889747.3592.17.camel@gitbox>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============7238801296702582285==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2012 at 08:09:07PM +1300, Tony Prisk wrote:
> On Mon, 2012-10-22 at 19:51 +1300, Tony Prisk wrote:
> > >=20
> > > >  	chip =3D devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> > > >  	if (chip =3D=3D NULL) {
> > > >  		dev_err(&pdev->dev, "failed to allocate memory\n");
> > > > @@ -123,26 +144,32 @@ static int __devinit pwm_probe(struct platfor=
m_device *pdev)
> > > >  	chip->chip.ops =3D &vt8500_pwm_ops;
> > > >  	chip->chip.base =3D -1;
> > > >  	chip->chip.npwm =3D VT8500_NR_PWMS;
> > > > +	chip->clk =3D of_clk_get(np, 0);
> > >=20
> > > I thought this was supposed to work transparently across OF and !OF
> > > configurations by using just clk_get() or devm_clk_get()? I guess that
> > > if the driver depends on OF, then this would be moot, but we should
> > > probably stick to the standard usage anyway.
> > >=20
> > > Furthermore, of_clk_get() doesn't seem to be managed, so you'd need to
> > > add explicit clk_put() in the error cleanup paths. One more argument =
in
> > > favour of using devm_clk_get() instead.
> >=20
> > Hmm good point. I stuck with of_ functions because its an OF only driver
> > and it seemed 'backward' to mix old code with new. It does pose the
> > question of 'why have of_clk_get() if existing functions work better'.
>=20
> Was about to fix this but noticed why it wasn't like this to start
> with :)
>=20
> struct clk *devm_clk_get(struct device *dev, const char *id);
> struct clk *of_clk_get(struct device_node *np, int index);
>=20
> devm_clk_get requires me to 'get' the clock by name. arch-vt8500 (and I
> believe a lot of other arch's) don't enforce names for clocks defined in
> devicetree, therefore there is no way for me to know what name the clk
> has unless I include in the binding that the clock must be named 'xxx'.

I thought clk_get() was supposed to return the first clock specified in
DT if you pass NULL as the consumer name. I haven't tested this though.
And I haven't looked at the code.

> of_clk_get retrieves it by the dt-node + index, so it doesn't care as
> long as its the 1st clock listed.

So the usual way to do this, I believe, is:

	clocks =3D <&clk_foo>;
	clock-names =3D "foo";

Then use:

	clk =3D devm_clk_get(&pdev->dev, "foo");

And as I said above, I was under the impression that the default would
be to use the first clock if NULL was specified instead of "foo".

Thierry

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQhPTAAAoJEN0jrNd/PrOhMKUP/Ro+EHsFO9/l47hs3h6JEupl
Xz6WFf8xN/Zlhb9kE9OfmtwqwDvSwXjW8VUe+b4VbRQ1MZYXTZrxobdoCQeEdQ9y
9z8W4XgS2/iroQ8mCPrAnGrxQ2JysF/IkQuzI9YgKCnLh2+8gyUnrZYidXemNTC6
jEAD8NQEl5r+OQYi+TMDQ3AVtf+XgVTx18d9BzQA8J4w3DVB8CIrYVgX0JiihxKn
5+NisPYpFAosDxkBJi+kCIwhrTAP+1MSVk292D5NHMcV2Nb3Kdwd5fe6bRFd+v+X
9081djRSg9wpdZ/Tnsq8mq2WarQvTGDOYVae3Q7UU6KvvHHNsFYv29hpjWPiCUS/
P1uaanG18/5z4przZhzVsAzXy6dSqwhDxMKyP7g0pB1SuvbpDAyD2ZKMGd6cSHIO
4T2KtH2OsrADtoBZngV7tQ8IttroTkuw8+OC6+S81a4mZX4y0JHQ0dSINsWme2JP
0kEnxpfKXXQ8orGKmE/cMGA0WLdef0lopDCLgYCTXzVGJYxTmJCjNauGWgvArE0I
uNnjgYj/9Rr6bAWiB+j8dsebur9+KxBguplyn0rHhJqGSouONM7M7jvYUAKur4G/
DQEFQ455dOwiIbSMeyj8gTfaAeMvOjV67GvIrJr+8NKnNi45bSe9sJflM+7m6YPM
Wr/DO/1itVhiCJy6Rb1F
=mmbG
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--

--===============7238801296702582285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7238801296702582285==--
