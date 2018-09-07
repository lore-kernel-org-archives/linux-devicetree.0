From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/4] of: Convert to using %pOFn instead of
 device_node.name
Date: Fri, 7 Sep 2018 14:29:28 +0200
Message-ID: <20180907122928.GA5821@ulmo>
References: <20180828155254.10709-1-robh@kernel.org>
 <20180828155254.10709-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180828155254.10709-4-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 28, 2018 at 10:52:53AM -0500, Rob Herring wrote:
> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
>=20
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/of/device.c   |  4 ++--
>  drivers/of/of_mdio.c  | 12 ++++++------
>  drivers/of/of_numa.c  |  4 ++--
>  drivers/of/overlay.c  |  4 ++--
>  drivers/of/platform.c |  8 ++++----
>  drivers/of/unittest.c | 12 ++++++------
>  6 files changed, 22 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 5957cd4fa262..daa075d87317 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -219,7 +219,7 @@ static ssize_t of_device_get_modalias(struct device *=
dev, char *str, ssize_t len
>  		return -ENODEV;
> =20
>  	/* Name & Type */
> -	csize =3D snprintf(str, len, "of:N%sT%s", dev->of_node->name,
> +	csize =3D snprintf(str, len, "of:N%pOFnT%s", dev->of_node,
>  			 dev->of_node->type);
>  	tsize =3D csize;
>  	len -=3D csize;

This seems to cause the modalias to be improperly constructed. As a
consequence, automatic module loading at boot time is now broken. I
think the reason why this fails is because vsnprintf() will skip all
alpha-numeric characters after a call to pointer(). Presumably this
is meant to be a generic way of skipping whatever specifiers we throw
at it.

Unfortunately for the case of OF modaliases, this means that the 'T'
character gets eaten, so we end up with something like this:

	# udevadm info /sys/bus/platform/devices/54200000.dc
	[...]
	E: MODALIAS=3Dof:Ndc<NULL>Cnvidia,tegra124-dc
	[...]

instead of this:

	# udevadm info /sys/bus/platform/devices/54200000.dc
	[...]
	E: MODALIAS=3Dof:NdcT<NULL>Cnvidia,tegra124-dc
	[...]

Everything is back to normal if I revert this patch. However, since
that's obviously not what we want, I think perhaps what we need is a
way for pointer() (and its implementations) to report back how many
characters in the format string it consumed so that we can support
these kinds of back-to-back strings.

If nobody else has the time I can look into coding up a fix, but in the
meantime it might be best to back this one out until we can handle the
OF modalias format string.

Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluSbyUACgkQ3SOs138+
s6ELBBAAi8cbuJZHQabJPhB7Y0fsJZet4soXDZWmrJsfMNd+AuT3LXjV5HtR2rC7
M5ltpxZhbFx0+JhtQI0dK6l/2NvJQhE/X0tN1V6k2VT+hni6FcyWHxEQQJpUpLLl
VAEt3Mcp7vLBC0fqgu7ASFW05lO0FMXLiSChrw6lbvvVNh5ITd8Q2YKxP6LmmQ9S
6YF1hN5QOnR7wkypqf2KvFuemMtuKv3YYXPIdVesOBayOnUMTneIlWt3SZv8U+m/
qy3LR6m43n76RB6lAMcaMTZfBTP8kiM0r5/jZsDlHqu3svgp174Ft8TtRBHcstN+
rOoFz1Bddd4PtXlJtum9YZyN0n+SBs6lTe7NZlJC0VmQz29yloz8MDaOJwjoanxo
Tyr5D84eHTfMh1lpNbyMZqnqcQD3t6EboZZCrZ/Q1Gd2zfUohiWV1In9UolmeQvJ
Ij1eE0u7DeLizIzYtUpKMfRxcL1NlaAWw7VmtDJnZ5TPN0ASNCO2vvz+ev45i3fq
2enBq2DlNDzlnGdFdZNqx3RlHH6APsGUjTXYlafF/dQG/jVTteQ0M7jj4nvOUZiN
q51Rk9l30a6hUDt4LZliOt0Vt7TnK1FLyKAXgPxhHmEEZRUFJuan2afefPendC+K
VYHwXZAJCfHdeFxDbmyoegiqiLoXo8PS0Kb5L+7KtqnFMTm8Iic=
=E/Bc
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
