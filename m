From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH]  of/base: Fix PowerPC address parsing hack
Date: Thu, 13 Nov 2014 12:02:38 +1100
Message-ID: <20141113120238.44b75c82@canb.auug.org.au>
References: <1415771461.5124.33.camel@kernel.crashing.org>
	<20141113091036.4e9ec43d@canb.auug.org.au>
	<1415833725.5124.53.camel@kernel.crashing.org>
	<1415839522.5124.58.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_eW2/tve9mYpwuPinUdxq1m"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415839522.5124.58.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/_eW2/tve9mYpwuPinUdxq1m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ben,

On Thu, 13 Nov 2014 11:45:22 +1100 Benjamin Herrenschmidt <benh-XVmvHMARGAQ9aPiWuuUPmg@public.gmane.org=
hing.org> wrote:
>
> What about this one instead ? I want to cache it because that function
> can be called quite a while and doing two additional property lookup
> and string compares every time might hurt some platforms.

Looks good to me.

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org

--Sig_/_eW2/tve9mYpwuPinUdxq1m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUZAM0AAoJEMDTa8Ir7ZwVrnoP/A24CIX3wKmsCcSQJC4xXQQ6
yJy3tW0SnQYqrbLcYlu9P0Lxr/lm519TJt8BHik7qLAPCm62/XH4mHeARb83yKFA
XJDCmTcgLlMxd6be5OsAXJLzmuWv/NHk7DAqd4vgpgZHAgwV0rL6kSA7aHNRugjs
vo/y+aTsJ9gfGw8Nj0e6sXd/ESEOTPbW6LtbriofuI0jn6SmESmXnSjDWBGF8PdD
hAhBOSLtrGWubLvjbNkGWW+OBTey9DZGdv/8uWoV/O+mex5mKjYJ3A74NNfRgyi6
q7ADFO/EhTjHoVj72yo9Xvgz+nqtrJuLTEsDHQZAcu2atz4MdFEK/H6UAQRrQtYu
tEFNASCx7/hsjMPFwcjd44nAEVgfArFYZccz5p1XOAxY1UQlIg8Dp4zyQX3mXpdA
pAWikXuhh5Pq+SkicjEXvmwCxM/7LO4VYiafGo9SRmF7HCjUyTnCXxqMtu+y5hlQ
ekQgqG/ZXlU5TMYnMt3FV7wby4o32ihah71j6TI/nhqlJ8QkpnEVAMW7XJjjgkHY
s3u8pguu95zbkLK0+NdxMV2MI8+pyg6gINRXSQdla1sbbh9IIvczBVMyL7zxqcGI
3Bauhn3ANksvycEJy2LLPuh8R2+/BMM1m94ymmRtsc+wxfsnT3iVNWSTV3IaAyQt
Ev9cYcBAa/YONC9dMlBw
=qQ5C
-----END PGP SIGNATURE-----

--Sig_/_eW2/tve9mYpwuPinUdxq1m--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
