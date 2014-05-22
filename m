From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun7i: cubietruck: set mmc3
 bus-width property
Date: Thu, 22 May 2014 11:40:53 +0200
Message-ID: <20140522094053.GA27329@lukather>
References: <1400694211-29903-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s8ux8MQukyWAm3r7"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBH4O66NQKGQEZXLK2WI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1400694211-29903-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--s8ux8MQukyWAm3r7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2014 at 07:43:30PM +0200, Hans de Goede wrote:
> bus-width defaults to 1, and all 4 lines are hooked up at the cubietruck,
> properly set bus-width to 4.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Merged the two patches, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--s8ux8MQukyWAm3r7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTfcYlAAoJEBx+YmzsjxAg6boP/iJ3OT3RPjxdM/pjImH3dsiY
ETOk54uUxbB4WJPAepU/KdGFuzR0Kv52mmjgPCP40YARueTPKCxDaDqOWI7kplf2
XWSGbaQka5VwhUAXUr+WVeUa1gZYKG7uAjheEoOAZrQ3wqGstKf4tbh8KOws7hRU
ceZgr/wZGKZLa4ZM51hNEajZoEXUnAr4+pK6xcQtYSpM+uZOtiBSWA8p34/x3WwY
HIWUqMt2Ad56h0aVihA4wUM2kBPCRzWKAzdsOZmnoK76SJ01JgWQLvWmdbZzV3BH
cisiZYCixom4pRSDpu3LHs/xN3+tF+o2g9zJpSUcPe6dDpmgRRg23OE/omBQwU+k
gsg9wD/gS60I764lVr8uAMIMIYbGQWSXtnuJVC4Pwlz/h5tU1tTuEEp1sDNHM85x
uKYePVCPo5bm5feaw2BSTsUgzWdKMLP2r6zLP94t+rBUzvx5871gbG9l6pdBDYtD
Usu4tJvo0YVEiMr76sR4V2xjrj1EJMxnsPEV1h1STqnWTQq4OAyNAXp2OpQa5RQ3
Dx/SXOBBF9l/AfU/MeMyBSg6fmlyOEhQ43MALPnmQRWSoltWsfh4xH9cunA32Lfr
YTk5KJSNMOg/MvCC8uBKdiyatYtb2BnJsjmK9vT2H/OQfbVQvF/VHWVqs4tysEBp
kzxr4kkrCkgk3hIs43/g
=DSF/
-----END PGP SIGNATURE-----

--s8ux8MQukyWAm3r7--
