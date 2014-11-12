From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/5] ARM: sunxi: Add support for USB OTG PHY
Date: Wed, 12 Nov 2014 21:32:00 +0100
Message-ID: <20141112203200.GC20972@lukather>
References: <cover.1415645258.git.rbyshko@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB54IR6RQKGQE4AP4ODQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1415645258.git.rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ALfTUftag+2gvp1h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2014 at 07:55:05PM +0100, Roman Byshko wrote:
> Hi,
>=20
> There is already support for two USB phys, which are used for
> USB host controllers on Allwinner SoC aka sunxi.
>=20
> This patch series add support for the USB OTG phy (aka phy0).
>=20
> The code has been tested on Allwinner A20 aka sun7i (Cubietruck).
>=20
> Best regards,
> Roman Byshko

Merged patches 2-5. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUY8PAAAoJEBx+YmzsjxAgmhsQAJzsvZTFj73kt/ritg2steOS
txPTl0qikhSJ0r/h+PcqKt8ZxXRtTCvHYKJukwbHC6udZTXOYYAMk7GBw/LDOh+8
D80qWXgWTLaRpU3eLYoxVlYUgklGmPab4U2nE/VY/lzHM8T7PUD7/SlgOB/DerdL
3K/QiCVhKkYKoZi+UQ9WaewtYY9JdQJww+sTwze/kQzCv3OK6GYi/LMbKnfZknJk
ZpAItZ6KWv2nM+AsNvkB1bfM8o7Ci0OHEp3/xt9gldTMmPJDuGhjCJXGwUnrZKuE
bO15fvzKuLcHMvVsTQxkRVWOe1eykecQsWrId7kS+uD1+YYqf8LjMymz4w9PnZgR
BMbPZ1fL+5hLV0XPBok2WEG/oZ0791AQFVY9NqEYTHDLa0xrk8/xq7Sy39GtEqNL
8eOETdiq7iquz8LLhOunC8lgZLGaiXUV9eReDFoVzAwFtT/ddo+BAXG+vkZLewRY
3127bbZf4/SD87yzvsnqFUOvv/x5NNiw6hLDMocWfHA8HLRQLL8TYtnm47g4E83M
Fr6hojHcSpUKZ3FGH7syBJjO0+mlPVkz4mrUHYqBpjVUS70oQysBwDT2OzkAs8Di
QuWn7HQgduorYf3nRUHBkhvFOD2m3BcAZ+Jie47AT1Zl97HnI16+lN84yvhHXrXU
NJAKKmVTim5mVRjUVaqh
=4nBX
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--
