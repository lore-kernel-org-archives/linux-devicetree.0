From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4] regulator: core: add support for configuring turn-on
 time through constraints
Date: Wed, 18 Sep 2013 17:13:29 +0100
Message-ID: <20130918161329.GC21013@sirena.org.uk>
References: <1379508482-10550-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+hZM3YBJafcqGfHn"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1379508482-10550-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--+hZM3YBJafcqGfHn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2013 at 06:18:02PM +0530, Laxman Dewangan wrote:
> The turn-on time of the regulator depends on the regulator device's
> electrical characteristics. Sometimes regulator turn-on time also
> depends on the capacitive load on the given platform and it can be
> more than the datasheet value.

Applied, thanks.

--+hZM3YBJafcqGfHn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSOdElAAoJELSic+t+oim9A9AP/3sD+fGhZG0KxDf/qgGsHKMV
T5fEROdvqTo4IRNCY+TuLVeSKuuWbfhZaWNkU2NYca9XuAhPHZmB8vBkxV0IBV6O
AGAezW2L4f0kmveCc4PGdu/aNAiHawgOo1qjXySrt3A7BfXbXjOObDu4IydvQW+O
EEaKodWZw2YHg+PRq5QUyP2118QkSE4S8jA5COr3YOzLWi/X7iaSqPL+WLpZ37xm
hcXWXfAN3z9zFVj+ex5IBYgJaxQUTnVRRJVRW5b0GZl5/UQ7dJHra5okp4/EdXG5
sqXON/leCntc9Q8/wxLOdS7q67oeWuOvDs3UMNPJ/Ec2oRwO31JkWhh/H3E49cPf
FcFwALVhG24ml7gsO/BL6BhdNZICjRc7jgCCyCZALYuvtu1N4ho1I64ng28idZA9
kdwA7mbBJI2yBVQ+s1KQ9TSbjRiZiOAjRR5ac/UNnvKjMXqWb5edPJZVHzvlQgjs
3eRNr9ZKrvhtAvkeJcQVGwJXtKwrMghcqnu6rtSfBgYTx7QX5Qm9KzuWj2H0f6GS
FmZckkpz1Z0TV3CUsvkJ4USBfLCNKkVADYaGsIsHrdrhmiCK3qxT3EgP4qkRF84s
iJnk4CTGhROEjuFKNkjnBC5QK1rbfRWXzHRR9iSOxXwLAl5a20grSSE1DwGnTzWX
UYIOG7u+YbZoy8l0uQGu
=vLZP
-----END PGP SIGNATURE-----

--+hZM3YBJafcqGfHn--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
