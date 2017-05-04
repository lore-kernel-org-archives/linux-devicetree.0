From: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] [media] platform: add video-multiplexer subdevice
 driver
Date: Thu, 4 May 2017 16:21:23 +0200
Message-ID: <20170504142123.3hiblxfkdtbrvotb@earth>
References: <1493905137-27051-1-git-send-email-p.zabel@pengutronix.de>
 <1493905137-27051-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="utlgz4krdowvbg5b"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1493905137-27051-2-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--utlgz4krdowvbg5b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 04, 2017 at 03:38:57PM +0200, Philipp Zabel wrote:
> This driver can handle SoC internal and external video bus multiplexers,
> controlled by mux controllers provided by the mux controller framework,
> such as MMIO register bitfields or GPIOs. The subdevice passes through
> the mbus configuration of the active input to the output side.
>=20
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> ---
> Changes since v2 [1]:
>  - Extend vmux->lock to protect mbus format against simultaneous access
>    from get/set_format calls.
>  - Drop is_source_pad(), check pad->flags & MEDIA_PAD_FL_SOURCE directly.
>  - Replace v4l2_of_parse_endpoint call with v4l2_fwnode_endpoint_parse,
>    include media/v4l2-fwnode.h instead of media/v4l2-of.h.
>  - Constify ops structures.
>=20
> This was previously sent as part of Steve's i.MX media series [2].
> Tested against
> https://git.linuxtv.org/sailus/media_tree.git/log/?h=3Dv4l2-acpi-merge
>=20
> [1] https://patchwork.kernel.org/patch/9708237/
> [2] https://patchwork.kernel.org/patch/9647869/

Looks fine to me. Just one nitpick:

> +static int video_mux_probe(struct platform_device *pdev)
> +{

[...]

> +	vmux->pads =3D devm_kzalloc(dev, sizeof(*vmux->pads) * num_pads,
> +				  GFP_KERNEL);
> +	vmux->format_mbus =3D devm_kzalloc(dev, sizeof(*vmux->format_mbus) *
> +					 num_pads, GFP_KERNEL);
> +	vmux->endpoint =3D devm_kzalloc(dev, sizeof(*vmux->endpoint) *
> +				      (num_pads - 1), GFP_KERNEL);

devm_kcalloc(dev, num_pads, sizeof(*foo), GFP_KERNEL).

-- Sebastian

--utlgz4krdowvbg5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlkLOOMACgkQ2O7X88g7
+prCzw/7BKwix/pzQL6Y30vrVYb+OHnyYzoH5bpa83qgywfAX/GvR4MMbuf5JTvX
ugzWiFFyzQ3LQ5eBDj7VOSIY/wtoDOJ2rItaefc/i/vc/sWLfvozj2d4YrrnDRjX
Q2F8VAXF8FP8hOcEss4KKtUEum/de7sWos6DlM94tVkGurtrFaQKW3VP8NzaagS8
U+CXXThA/SZPTBamW8H7mx2jV6AlFIma85qx/TYhtFsRiQxlIKpCEv+VAeuXXSBt
1i1kbvrVTn4hSseejBfZG2/xUor4zokJBzUzPqOaJiaB8RDYU2AO3zAKL0TKNAca
3eilLLbM8soht+1TY0gvIy4/e3IV5k9VOyymm2paoUzGyajH3WoMROHi6vzmILzK
iEKyH7pn3o1PHEq+Ov0Og6UHhB2OZLWgbVmQWii96M+bG1+4kcv/umIPAQ7QfzRn
Pntd5UDu+F88U8UXjipMJsOg6qFwwLaOW1Kja4Gp3FVJWfKVM2PEjz6sJIoTR/xU
ag49BSxq3nJ7R4cmdl/Aqd1OfCbOiH56L1UkilKNH3dbwVX9NJAnolUoP03NGk7S
6f3R6P/tcbfqhY3/1RAO1bPXWzsBwVoFYpI4UHEwtGiFqCwPVHZWY7/Ew0ygTIV6
4vRaSs1CP8NMUeJndsJBmlD6dtrORJOXctIwwwrbYsuW5ZqkP+I=
=bpc0
-----END PGP SIGNATURE-----

--utlgz4krdowvbg5b--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
