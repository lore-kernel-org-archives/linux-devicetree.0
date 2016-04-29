From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V11 4/6] pinctrl: max77620: add pincontrol driver for
 MAX77620/MAX20024
Date: Fri, 29 Apr 2016 15:27:27 +0200
Message-ID: <20160429132725.GB17000@ulmo.ba.sec>
References: <1461837540-17071-1-git-send-email-ldewangan@nvidia.com>
 <1461837540-17071-5-git-send-email-ldewangan@nvidia.com>
 <57220E92.90105@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57220E92.90105-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2016 at 06:52:26PM +0530, Laxman Dewangan wrote:
> Hi Lee,
>=20
> On Thursday 28 April 2016 03:28 PM, Laxman Dewangan wrote:
> > MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO pins
> > which also act as the special function in alternate mode. Also
> > there is configuration like push-pull, open drain, FPS timing
> > etc for these pins.
> >=20
> > Add pin control driver to configure these parameters through
> > pin control APIs.
> >=20
> > Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> It seems there is some mismatches on kernel-next and the mfd/for-next for
> one of patch for generic function name.
>=20
> /**
> 2016-04-01    pinctrl: Rename pinctrl_utils_dt_free_map to
> pinctrl_utils_free_map    Irina Tirdea    1    -1/+1
>=20
> d32f7fd3bbc32732b094d938b95169521503a9fb (patch)
>=20
> pinctrl: Rename pinctrl_utils_dt_free_map to pinctrl_utils_free_map
>=20
> Rename pinctrl_utils_dt_free_map to pinctrl_utils_free_map, since
> it does not depend on device tree despite the current name. This
> will enforce a consistent naming in pinctr-utils.c and will make
> it clear it can be called from outside device tree (e.g. from
> ACPI handling code).
> **/
>=20
> But this is not there in MFD sub system.
>=20
> In mfd tree
> .dt_free_map =3D pinctrl_utils_dt_free_map,
>=20
> In kernel next
> .dt_free_map =3D pinctrl_utils_free_map,
>=20
>=20
>  I used APIs from the kernel-next.
> > +static const struct pinctrl_ops max77620_pinctrl_ops =3D {
> > +	.get_groups_count =3D max77620_pinctrl_get_groups_count,
> > +	.get_group_name =3D max77620_pinctrl_get_group_name,
> > +	.get_group_pins =3D max77620_pinctrl_get_group_pins,
> > +	.dt_node_to_map =3D pinconf_generic_dt_node_to_map_pin,
> > +	.dt_free_map =3D pinctrl_utils_free_map,
> > +};
>=20
>=20
> If you see any issue on this patch, please drop this patch and we will fix
> this later once the renamed change available all the places.

To avoid this, it's usually best to base your patches on a recent
linux-next, which I suppose is what you did, since you picked up the
new symbol. The reason that this isn't in the MFD tree is most likely
because it's a new symbol being introduced in the next release cycle
and it's not relevant in pinctrl.

You patch series will most likely be applied via different trees. MFD
patches will go through Lee's MFD tree and pinctrl patches through
Linus' pinctrl tree. Your patches based on linux-next should then apply
cleanly and build correctly in the respective trees and everything will
come together in linux-next again.

Thierry

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXI2E9AAoJEN0jrNd/PrOh3R4P/2OQjetJmGRCB1M6MRY7tclS
S0u3LyyDUYyI4c8NtBiCNpXVuxoAGgXKSnuu8z+dH0+LGabKNLzRFokJ+h1QuGnX
zBb/juSsSYsjMd82tHuXbu2d1I8PubOuYQ9F4bYwpeeme+jF2YK+TKq9QlhYrC1o
32UglnfdG+QY9gjldT/PFcwZ+FmjG5OBsEg5MwWrE53TqEjhapks+F9tA5dmhu20
OZBN3cai7EoMRUgdYitOQgvXSjKOXMMyY5g5Ut80450X3B8tqv7smhZ2yQ4nRbV5
mgOYDN4XHNXDbENaRZv9dUc6rgr2p+6n2nJwF+dVkm/rtEqp4f73r/Ock4BJGvwN
0V3+kdnZASZFcnyYG2zuATtBZoNFRZfLyg47FXjXEmI4GK2qlx4DX3qAUPVlWkX/
y0vAY6B82qFvY6FIBiIkjolhh6VeW4w+oL8dGGiPwIk/kxGTPS9yYE7bJfSCH0Gt
tjduvHWssjcUzeqVENKJIataJot6T7UWkQNmQpJ9Tc+Sf6z0/EtumHZv3ovfne86
wL8n4i5OHHyuU/42cK8RvlToiQM0udFC3AUPPyOLr8DArXeS4p1V3Up2qC58QXrd
XkrriBWFahClNL/XG0Rt4SfMiaBIc3PLopqQkT5fjV3g2TuE1gAtpgi9M3zkcqhU
mM2lubyufhWGFs6w9h5y
=/T4q
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
