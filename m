From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: sunxi: document new
 generic binding
Date: Fri, 24 Nov 2017 13:03:24 +0100
Message-ID: <20171124120324.da6ihbdirtyi7unx@flea.lan>
References: <20171113012523.2328-1-andre.przywara@arm.com>
 <20171113012523.2328-2-andre.przywara@arm.com>
 <CACRpkdbpfkM4odz425+4qyUCF5vqPWBQ=F5Yk7AtJL5SqXghpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hbwltjxhbxb664pf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbpfkM4odz425+4qyUCF5vqPWBQ=F5Yk7AtJL5SqXghpg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--hbwltjxhbxb664pf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, Nov 24, 2017 at 11:19:52AM +0100, Linus Walleij wrote:
> On Mon, Nov 13, 2017 at 2:25 AM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =
wrote:
>=20
> > So far all the Allwinner pinctrl drivers provided a table in the
> > kernel to describe all the pins and the link between the pinctrl functi=
ons
> > names (strings) and their respective mux values (register values).
> >
> > Extend the binding to put those mappings in the DT, so that any SoC can
> > describe its pinctrl and GPIO data fully there instead of relying on
> > tables.
> > This uses a generic compatible name, to be prepended with an SoC
> > specific name in the node.
> >
> > Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> (...)
>=20
> I definately want feedback from Maxime before I do anything with
> this patch series.

So I've been opposed to it as well, for the reasons Rob, Thierry and
you pointed out already in that thread

I just wasn't sure what your opinion on it was, so I didn't answer
just so that I could see if I was the only one pushing back.

So I guess we all agree here.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hbwltjxhbxb664pf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloYCngACgkQ0rTAlCFN
r3RXOw/+N0hB4o9P72lsPVzfSSkeuikxRLhHlXrvwPl+HGDWpila2zOegfBVT+w5
8MA9s6zCZQv3hGlwxX+An0IIsej/Qid+Lh+YeXs0saf97J4csbYtkgU2q3yiTyMZ
RTyt1t5X46gfq678VoYSkU+IInH3iaEDnPaJPPNqrwbpAvXvSQzWtJP/5JQQk728
fsUW/LOlVuC6bxjKRn21AU0vI+10SNSxLKBqyRpybQKtZljsuNuu0a8mxOUNCllv
pqaZIG1YA1cqCnDR+sNzoIlC2vzVjewoppgFlGdrjNpSRg+O+R8RbaUiUMX6imlP
4RN6UupJH1wwwXZ4vdBefEQsb4eUH4T1bPORn/iaviD4AMbLlvBdaONMx6H67UJr
D4n5fZbtWUqgWqj2E0531COQixwOeK6Jtq7XyGMIlmI2w1/hWgVgn7wy00TbyzoT
uMbczjfboZPoGRbD1Qd4Lj8vOT2ry6DlkgELQvuDsU2Hf4YKBs7xYbvYDZZ9zWQJ
kAn89a0FC9Ui9w7yHVUniIM8jWjN/DRP184WtFGK0ZDisQR6ROlPEvBBoLshy+tt
VIYLCHfVXbkegvAcPLttg441hjy+EPDPoo6qum7xFDJIeY5fFWxKDYcJ1x/2Mgrt
SQfo3rinar4nZKqbekAJbxcNbXEOxejBeWAE6bmguIjofJrJfOU=
=sYWL
-----END PGP SIGNATURE-----

--hbwltjxhbxb664pf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
