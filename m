From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 01/14] ARM: clk: sunxi: Add driver for
 the H3 THS clock
Date: Tue, 28 Jun 2016 13:52:16 +0200
Message-ID: <20160628115216.GF5550@lukather>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-2-megous@megous.com>
 <20160625071338.GC4000@lukather>
 <6a37450f-35fe-3296-da4b-10f7d645e2b9@megous.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5CUMAwwhRxlRszMD"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB66JZG5QKGQEQKDM52A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <6a37450f-35fe-3296-da4b-10f7d645e2b9-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jun 25, 2016 at 05:23:12PM +0200, Ond=C5=99ej Jirman wrote:
> Hi Maxime,
>=20
> I try to base everything on the torvalds's kernel.
>=20
> I did notice the patches. Is there some main git tree/branch where this
> work is tracked in? I'd gladly use it.

I just pushed it, branch sunxi/pen/clk-rework, on my github repo:
https://github.com/mripard/linux

> Also there's a PLL1 rate application patch, that would need to be ported
> to the new CCU code, in the case I would use it as a base for this work.
> Given that the new CCU code is your work and it's fresh in your mind, do
> you have suggestion how to approach it?
>=20
> It is [PATCH v2 06/14] in this series.

Yes, it's still in my queue of things to review, let's discuss this on
this patch thread.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--5CUMAwwhRxlRszMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcmTwAAoJEBx+YmzsjxAguPYQAKtoPbrkHdAmkUsLsRQqJg0H
+hB7Ga0FWtCus+vgiRTVRAO9dboXz/MiCHr2kC3pLSuK2/T4jk9tufPrDy4ynUc+
AFllBgCxfenK5oE18yhY0ZLBOeJRzhBT9GuuYIGMF1x8ps3Kx3HqAqn+OVWnZjVM
pgV9Fm/jSt+VWQ+SfSqbDj4p8jtLwIDfcGgRGBQ5z3momDCNKsXyC5CJGOwznV/s
+OPsmaFwxtdDIq9RqSjzBjunFxP03Y0E7veCB9iUaSYbKEBhG4+ZEbDkapDslA0r
cg93cfAgRdQaPyxjzH4PccHLqASIdpBBmdS45JTN9ciB1+lG2i0f6u5kCYel+FZI
31RY/07kFZab7E32kFDc7fOTz+S59e4RjQk0Mmp5wMyh1n0Y/ccyRyywGvHoRDQx
r8mGuPX2IsJSLww95u/zC64aukB4TsTz2+WjPKWE2w1B8HK1KnYq32s2eXAwqYaa
6OZkPmaPjZb3SlTUWAubJN0a4zUOP46HoTtpKtX59Cy4Flp26TZck/IDRiz5s5J5
cgIs5iyKIEMGOqOEZmWnLxtKJIfbr7hB+IR7XVJr0mmHpUSO52RcpY39Q508HtYj
Er53IW1r5v43hyGTa4NTglvR7xblio+CsgAa/BVbQgaOaM3Gau1+9SMkPuP4smkn
BqmHUfDcB96uyLRj9JUU
=95dk
-----END PGP SIGNATURE-----

--5CUMAwwhRxlRszMD--
