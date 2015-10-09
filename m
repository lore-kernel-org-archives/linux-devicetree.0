From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/7] drm/vc4: Add devicetree bindings for VC4.
Date: Sat, 10 Oct 2015 01:31:49 +0200
Message-ID: <20151009233148.GA31997@earth>
References: <1444426068-15817-1-git-send-email-eric@anholt.net>
 <1444426068-15817-2-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444426068-15817-2-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 09, 2015 at 02:27:42PM -0700, Eric Anholt wrote:
> VC4 is the GPU (display and 3D) subsystem present on the 2835 and some
> other Broadcom SoCs.
>=20
> This binding follows the model of msm, imx, sti, and others, where
> there is a subsystem node for the whole GPU, with nodes for the
> individual HW components within it.

I think it would be useful to have the acronyms written out one time
in the document (VC4, HVS).

-- Sebastian

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWGE5hAAoJENju1/PIO/qajW0P/RA+S4JAoZ8+9+jv6Z8qQyN1
ZYe8p/QuL8rYjcsvAamYRGjCZJo5s4obmZDVShVI3nBq0+3hNdipbgFhnqwz2eRw
PHGYyRduX1LilgKErQzWYkQPeEdg5V6bNpinZFyD75zrz6wt+XhvQzxhIVG6CbBM
nESBagyZr4QwaW4r99FT3ddAI/nhTej8JD5uNl/R++lxamDTUd2ZsKsyaU+z4G6z
WtPoeyKMI0exo6JTcWW9cwS8K2ijX2SgZ6SQlLZ+dKtgBbewWO9Dq0gfxv45bZ9F
uELS5jUyPLj1M/hQumWhP+yaBJWVIg1/24einvB47NUJaC+7DgaySB+pPChKsLH4
JYFCIVMv85B1UVDH9ihMzvnPGvul/uQmkbnrmzLPgZtU07EDJ81gWwGduC/a4RMM
bG9LaYioC6+lyv0uR6KnVt66KHcsnSysHNiBnT6C4a55eKL2PRVbW7uU6xQILro2
b8agyOwRbPIJCkD2wjNdMCSR7inerMDx6aSVXfk6Lh4ai+t/Log3iuBJk21npBH6
cS/VH7Azv9EKLvtPOwBIlq3536KbIePdGaaEdMwPLuaUDFnLXjTN2bRIhuAqRGrO
wG8NAL8c3aHLYB1lkvI8JxkLyvry8bOvLVHzuu2Fl0h0AKqcRKa/mQlc4naX4/Ul
x0ZgtQI8OPxSjqcqt0Tz
=sSYw
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
