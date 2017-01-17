From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
Date: Tue, 17 Jan 2017 20:23:47 +0100
Message-ID: <20170117192347.GA1438@katana>
References: <SG2PR06MB1165D0D67AD68A12030C961D8A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdUVnUS-iOM8cbXNP7jMLNFb5+hgnMp3edkCzpbEpAePzw@mail.gmail.com>
 <SG2PR06MB11659339E4A08373D3626BB28A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdX=cNuBSMqvPKYa7J5g7T4dSfHhSjcGdmuOPw_as=6RQQ@mail.gmail.com>
 <20170116114023.GA3029@katana>
 <SG2PR06MB11656A823E53F55C4FBCA7E88A7C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170117082118.GA1487@katana>
 <CAMuHMdVW=HORcCA0brX4tZdtG9knqE7D_wnM5VtSrxz2LdBgUA@mail.gmail.com>
 <20170117094529.GC1487@katana>
 <SG2PR06MB11653D8853CB565A629B782E8A7C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB11653D8853CB565A629B782E8A7C0-ESzmfEwOt/xoAsOJh7vwSm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So, should sh_mobile_sdhi_remove() be changed to call sh_mobile_sdhi_clk_disable()?

Give me a minute, I already did a patch for this :)


--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYfm9DAAoJEBQN5MwUoCm2+HEP/RA0Q9zt/PCWRIOHsc1WKujB
IHOD5qHPxI6CmSwMQmbxpXZQDCrl6dY7eK/s7RkwySGw+xdMzLN8/6LsEOcSYFFk
AEQAn0HLpbbT2xmL7o50bBy8YhGoL7eWSHFr/86TL7X6rw0RLVZJjG183O4N+D3R
zzqUwmHHLhmnHzwgM8h88BXIr5bAbQjkKgrqo9uFDNM5nE7kg4yfnq/wP0HfcslR
1TeRGAopJTGwuUGyqfWgF8e88Os7zv5c6YTKRrBkIZ936CKHzGMuyLoS6iwvxzrj
D2pwl7JAXvq04VSWAbOp7ZyXfeNuQnvA2svjj/vP3doRGgRToMbWAYPdOKb3zNx4
KEcrUUbx6QNiQf0WkTSDAL7Yvj8b5Eg8xmG85URr8Sl6uHolXI8EMJsXA7Fcg0pU
NnFmyXM2pBapqyw0zvPBhZzeVrI9AKxlqJxxG36aDvVddk9OlhYLRqwAj/Rc1I4L
26kWMOv/RL8pmj4hOKmbg9jFmQBT8mGYLkS0qKqarphx+qs5rCxto+G5iQ7CfXlW
BrPF+hssFVMvw5GT4ar9sCiGP39RuPohi8AsnJQ2ZVIIT2KzyOvA2c0YzMZNrPqw
jlTxXUpALxVt01iGtvNg9ak695cHnKzSzHqdL7tolSJ8P35mexR9Q5FNFW0lWqA4
rbsQpDqiCiUfl51jqqyT
=usJF
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
