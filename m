From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 06/15] clk: sunxi: add A31 APB0 gates compatible string
 to the documentation
Date: Wed, 9 Apr 2014 16:51:33 +0200
Message-ID: <20140409145133.GF28585@lukather>
References: <1397051478-4113-1-git-send-email-boris.brezillon@free-electrons.com>
 <1397051478-4113-7-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mrJd9p1Ce66CJMxE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1397051478-4113-7-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--mrJd9p1Ce66CJMxE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 03:51:09PM +0200, Boris BREZILLON wrote:
> Add the new "allwinner,sun6i-a31-apb0-gates-clk" compatible string to the
> sunxi clock documentation.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>

I'd probably merge this with the previous patch.

There's not really any new bindings introduced here, so I guess you
don't really have to make it two commits.

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--mrJd9p1Ce66CJMxE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTRV50AAoJEBx+YmzsjxAgrV0P/3IXGkl4mujmMyFea2GF7PfW
6Jh0q5W9QrzfNxLV8H2Q8Ez07WB/rJTEm2YLMSzDkBMxtiBB0oG0iH8z6Va8aHdD
AWurX6snwMZIWulZey76qF1tVRBSwqRYshtwmxACPp+4uMUe0tHDVc2S1eGcR0tE
YGGPl7dCmjihvak5UwwMLUPW9Y/odAD8Hv3T/AFS0n6WBsxjS1Nl6HIcHoPxJ6hZ
onBTmGumQXTkFGVwGfNRyAhPlPzc4S8dJS/Hwvn3IruwnPt6GBGNFZWyUZg+2VKN
p90DolY3r0G4Nwe1/p2CQPatgY7o6K4pNw84F1LlDKOCmu23QkABOyy2J4d6yfdK
UviXtN57rcv9oq5cXAJNtx+lL8TmCquRmAFHBUc/gC2Mbib8TuaE6XlBwQmlIKRE
ZLqEGMiSH9BcMSEbGIhD8Em3xfTGX/hHHF7U6qV8UkGg1q3CnoPYq4iZ2JuVIcEN
rbLchKPDe41LMSNDe9bz1qGItWBG17Re17CeJej/Ik0n++6Ji7RTVUVhmsu8mM8z
uGikpnb0gg6tDWibr2LyIPoEi33lakRLgTkgpMXkK6zIVejPUm0DplZ/XbmIsJmR
Wrj0BPRf0uw4t6y+gnzKbf5wY0T8fFDZN7UzVcAgUREqw6G12p42hNMeoh3kqlau
uKpLQzgSzqGqTH9jmjoz
=1dGf
-----END PGP SIGNATURE-----

--mrJd9p1Ce66CJMxE--
