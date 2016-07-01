From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor
 rate application method
Date: Fri, 1 Jul 2016 08:34:21 +0200
Message-ID: <643c2648-ddd6-700a-68c0-2981134965c0@megous.com>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160701073710.1a1fc684ae448577bad5b0db@free.fr>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4bNxUTEGVlOMTDjw9LHONh3RHCn8pVmUf"
Return-path: <linux-sunxi+bncBDXLF6FR5INBB5M53C5QKGQEBBFVRAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160701073710.1a1fc684ae448577bad5b0db-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4bNxUTEGVlOMTDjw9LHONh3RHCn8pVmUf
Content-Type: multipart/mixed; boundary="IIcQAmqR07FEsnkmRxpRKgmD9isjhWU8p"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>,
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org,
 Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>,
 Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, open list
 <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?=
 <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>,
 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
 linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Message-ID: <643c2648-ddd6-700a-68c0-2981134965c0-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate application
 method
References: <20160625034511.7966-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
 <20160625034511.7966-7-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
 <20160701073710.1a1fc684ae448577bad5b0db-GANU6spQydw@public.gmane.org>
In-Reply-To: <20160701073710.1a1fc684ae448577bad5b0db-GANU6spQydw@public.gmane.org>

--IIcQAmqR07FEsnkmRxpRKgmD9isjhWU8p
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 1.7.2016 07:37, Jean-Francois Moine wrote:
> On Fri, 1 Jul 2016 02:50:57 +0200
> Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
>=20
>>> Since this is really specific, I guess you could simply make the
>>> clk_ops for the nkmp clocks public, and just re-implement set_rate
>>> using that logic.
>>
>> I would argue that this may be necessary for other PLL clocks too, if
>> you can get out of bounds output frequency, by changing the dividers too
>> early or too late. So perhaps this code should be generalized for other
>> PLL clocks too, instead.
>=20
> The documentation says that only the CPU and DDR PLLs can be dynamically
> changed after boot.

The question is what exactly is meant by after boot. :) Anyway, if the
kernel has no business changing some other PLLs, if there's code for
changing them, should it be dropped?

regards,
  Ondrej

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--IIcQAmqR07FEsnkmRxpRKgmD9isjhWU8p--

--4bNxUTEGVlOMTDjw9LHONh3RHCn8pVmUf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdg7zAAoJEG5kJsZ3z+/xrngP/ip9+tVZKEa7Ih/J+LciNXkY
H4shEKUJHnUd1vu/TmYyngXJ4S2kWTYcxyKHPTcEq70zmtsYQ+rxsZXuPZOY29El
lm4LLaLFBueJ+yBwddZ12of5V8W67VuDVuHx21spu6/kso+46SqFQ83r0zK+owIA
AXS1XAHY+F57mmTQT+7TLKH5DpM5UYQYrUXvsN0ecaMSN8m1qhP53AynhX9MNs5U
oCDA/qp68HorfL/NHf0l2UAu8lWYqqQ7r0hgaoXCk9x6dql7rj1c1ctQEWJHplDZ
YdI1ncojlHioy6m7k4/8jIDzQecTtJfn+c4vEwmaGqNeZnHEJUNG6eUTq6CL6zsG
2EzOQWzY06mZ25zwsQd6rzevLXIjlKzzRyEDTkp1BC8b07VxTt7AxtbL9WRvPVUC
KAloFZ9kpOwGpxwQyivdBPnHt6In9HuZ1NVNnAYJEObisbQQmslATdg4N7efXaQm
3WV7yDbFa4O8PEyvqNBXEbZAZMQmYJ5kel7uCx6ak6/rm+AthpnjKuutb1b7HS6W
eNqumOj3HKt2pUaLR5FgkBrkxuKvMswLheX3oS0sCeVv292NT9PeiAtCRQeWBYju
wXiAnd+dJm+m6RfzDt38nLkttWhA2HWmzHefxLC6wzSsT7GomYGobPhpKoYfArnS
AWNR7ioU18CcgQPHLDrR
=1n/V
-----END PGP SIGNATURE-----

--4bNxUTEGVlOMTDjw9LHONh3RHCn8pVmUf--
