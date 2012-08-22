From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/7] mfd: add imx syscon driver based on regmap
Date: Wed, 22 Aug 2012 17:02:41 +0100
Message-ID: <20120822160241.GR7995@opensource.wolfsonmicro.com>
References: <1345619928-15446-1-git-send-email-b29396@freescale.com>
 <1345619928-15446-2-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8277188655391589207=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1345619928-15446-2-git-send-email-b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, paul.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============8277188655391589207==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q56cwELb5ReCVVQh"
Content-Disposition: inline


--q56cwELb5ReCVVQh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 22, 2012 at 03:18:42PM +0800, Dong Aisheng wrote:

> From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> Add regmap based imx syscon driver.

Nice to see more regmap-mmio usage!

Reviwed-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

=66rom a regmap point of view.

> +int imx_syscon_write(struct device_node *np, u32 reg, u32 val)
> +{
> +	struct device *dev;
> +	struct imx_syscon *syscon;
> +	int ret =3D 0;
> +
> +	dev =3D driver_find_device(&imx_syscon_driver.driver, NULL, np,
> +				 imx_syscon_match);
> +	if (!dev)
> +		return -EPROBE_DEFER;
> +
> +	syscon =3D dev_get_drvdata(dev);
> +	ret =3D regmap_write(syscon->regmap, reg, val);

It'd be good to provide a way of retrieving the regmap so that drivers
for subsystems with generic regmap code could use the framework features
(regulator is one example that I just mentioned in my other mail).

--q56cwELb5ReCVVQh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQNQKaAAoJEFJkBDiqVpZ49UgP+wWOKBCk9UOj5BNa76qKuj2K
jinGoe/x7e9g7IF4Ni42PiVw2QyP/4aTist9vHB1tqK956K1Xvlhzets8PG+nL6P
4Omflw/X8JEqCNxZB2N5kXHZd7F9fM6uiJtVh+zFFbI4JIAFTu0gNiAJl1PfP4pJ
atSq1Fwn9FMCPog4mHTR0kvkrlBP1gDohe+1lfWnclP0FHSg5Ty2osYbsAqmas7J
ccW3YWL+qEQwhfIDrZS65+t0+ujebtpv293m+GqgvA51gOBpSIuFiRQQhX2WvogX
6xJfPlVDKtZBmw5XMgIh51sQsw341JbRjTGXaZNvcjt7zJEoUw9NFI8IPA3H6AIP
sevpVo3JUvE1pvPLZupKLgL1ZPoMrIWgF+HCEmwMTUAuOfLNCCWIs34Pyx2B9AMc
QoJOcB2n3BodxXlhZVnC+QRRQV+OYje33kei1cEP3ndlV8qFFAeOKUyITdjt4zgc
Fif8Ykizm7m6L0t2n5yhe9N1tl5ZRDKqhTk1jXFrZxqvgWaKjb0dEWN2jDLGOJ0Q
I6CXcdcXSVLVhBgOHwvi/tOFFaAAH/pSxwopiwwWoPmkedSuGCuzjx90mt+AvkXX
v4/jiZCSrhe961omGOGt8vcvGU98wpgLtlqzDFsh5Kkrlxa/PDSOWK6SvU826oQH
EXke92GKkMSmRUm8qHH3
=/a7A
-----END PGP SIGNATURE-----

--q56cwELb5ReCVVQh--

--===============8277188655391589207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8277188655391589207==--
