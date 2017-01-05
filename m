From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 9/9] ARM: sunxi: Convert pinctrl nodes to generic
 bindings
Date: Thu, 5 Jan 2017 16:35:56 +0100
Message-ID: <20170105153556.pzec5jjuz7pmvsmn@lukather>
References: <cover.7edc6c25be8a5e2efdda6a82e102dbf7ece6aa64.1476200742.git-series.maxime.ripard@free-electrons.com>
 <e32d044d2d967f24f12d83eea50e7f14f2ae1073.1476200742.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67_4iriM2WS33hUWzNZY8R2WvGjqzntGBPGmNkr1Ryr_w@mail.gmail.com>
 <58723369-50ad-1792-9be1-c277eb719044@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="skclcjjttxdh2jz4"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <58723369-50ad-1792-9be1-c277eb719044@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--skclcjjttxdh2jz4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 04, 2017 at 02:16:23AM +0000, Andr=E9 Przywara wrote:
> So can I ask that we start taking this seriously and stop doing things
> which prevent Allwinner boards from being supported properly?
> Which would first involve dropping this very patch?

The driver still supports the old binding.

> Having done breakage in the past (with "allwinner,sun7i-a20-mmc", for
> instance) is no excuse for doing it again.

I'm not sure which breakage we introduced with a new compatible: the
old compatible is working just like it used to, and the new one is
working like we need it to.

> And especially I want to avoid this habit creeping into the arm64
> world (thinking about the H5 here, which may be impacted by this
> very patch, for instance).

And again, if you looked at the entire serie, you would have seen that
I took this into account.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--skclcjjttxdh2jz4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYbmfMAAoJEBx+YmzsjxAgeMsP+wXSVtzU3aRzeFVcgnM1+tCF
G7KDxWSCDWBsUD4iwbloZQVl3AsY45I2dEskZkISsVLEc7OGs0wmluxlpqfRAuPC
pjlmNEP9InfKcJgZ89ql2Ffc66VOE+WX83JRGa3Ld1ZQLfpYrTAt7V2yb01jUDre
w/c+Y/YGn4lABevLCxBaKUFQX5u54d6XIDoajwcKNmVm4oPLswjxm+4vrywh1tXh
pXa7dVRgvkRd4+562Ikg27OyCp9jZE06F8OmKgVvDIvp8xh36TmWrFYD1Gw3isXN
2hEn5xTxXRcwl1kOGsihV2bXdB5a6kRar12H69d23jN1pe4pye+snF/3l06M2jws
EeYrj0FH56e8KO15CItAzRaKdjkuzT4ipxw/pUwZlJB8pRvEaNUkdCJ996rwP2eb
BPdrJ2VBNGSncwfVEdvHXoPTwLwxixLqGuUJ853Vh1Erow4tjqlLizjS6UOOyCtV
QCABAr2EtP7dZQ4oWwvzJSanPI0Cjhyl5o+FkCNwQQUQHEHBOpafywNnNXt1onkl
s+fxTKglTGKRwgxvX6Utn1tIr8hjvkAu5rdm3SFDnCi0IQggDTBO9tchn/I8p7dI
qZ+JTo/K0TK0uUiEl2alhUhWngau+ei3zgYllyqTZ4t8ssJdEKUF7j8n2jN4J9Tz
bKIg2gKoufWF5T4CcbTU
=7mbC
-----END PGP SIGNATURE-----

--skclcjjttxdh2jz4--
