From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] irqchip: sun4i: Fix acomment about mask
 register initialization
Date: Wed, 12 Mar 2014 11:10:10 +0100
Message-ID: <20140312101010.GZ2815@lukather>
References: <1394553273-30473-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWT/WNRdoJORH3Bm"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBKPHQCMQKGQEWTEOUBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394553273-30473-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pWT/WNRdoJORH3Bm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2014 at 04:54:33PM +0100, Hans de Goede wrote:
> The comment was claiming that we were masking all irqs, while the code ac=
tually
> *un*masks all of them.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--pWT/WNRdoJORH3Bm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTIDKCAAoJEBx+YmzsjxAgjsQP/iyWBiAdAzIbcaWvjDMnqiTO
JSYDx3ANyIUt/J9EyfFTcaOjshda6Y6dFqrs+cHn4um2h9+ND+C2O23iurGy8BmF
zRk8v3o1uUz60+vIVIwLd8Ufcsb6fS/dEEculucE79+LhkkkrE0dl5ZsYkNdmBeA
Dbqv8nIu2r9N3YOgWeNIpKu+yyfIa8uxvmfTPHrK0inyJlT1qoZFPPR3+qi1FP3C
iwvLqit7imtKYW2hjTg8bWV49GlNcOUouSpwX7rdVwzLeBvq9PTGsVVHp44F8TVL
V6lC8VGVt1saR2LvRL+X/Rp90SdH0I4JCAW2iG2hE7P0PQRtApq757wQuJATC/Q+
g8BX/rIuuHTGty7PhSokfiOvjd0luBszC6j+IujipNPmI154zxfI0j5OkTYbre0a
tu8lsHZmUY9e8px3NZ3Gw8zvbvotFHXnsA75wk2IGEaQdu/+cWNsecKZRnBJQcSk
d3pZsx3ahQaLZuB7OYzyniJ/RcWKU1iSPz/QSB52P9fe1zchEvHWtF58yzk9tNOx
OeSwEl1uM4jsYC+7v/1L5+v/TWuiM5g1UAqTI5iU37A9FhJvB3Aoo26PyLtGQT8D
zKYNzLmeV1YYnRAQUs2Qp5UxJROCfrEjDLb3HhPmYr05l8VkoH9dMSRQliYKIpWW
RJSTPhn6AuGSND7i6xT4
=daao
-----END PGP SIGNATURE-----

--pWT/WNRdoJORH3Bm--
