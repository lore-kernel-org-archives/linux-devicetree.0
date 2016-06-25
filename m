From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: dts: sun8i: Add cpu0 label to sun8i-h3.dtsi
Date: Sat, 25 Jun 2016 09:02:08 +0200
Message-ID: <20160625070208.GA4000@lukather>
References: <20160623192104.18720-1-megous@megous.com>
 <20160623192104.18720-7-megous@megous.com>
 <CAGb2v66eskVAxdz8VtjBJBCO7VV9WL4bdFDVrPWrSmxk4RASCw@mail.gmail.com>
 <adaf7f61-af80-cc02-8c47-af721b86f81e@megous.com>
 <CAGb2v665O75vQEfo5WdWtWJSbKEbLi6MBAHbgZC7pyrOCOu+6g@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB4OYXC5QKGQEPB43SLA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v665O75vQEfo5WdWtWJSbKEbLi6MBAHbgZC7pyrOCOu+6g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, dev <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 25, 2016 at 09:02:48AM +0800, Chen-Yu Tsai wrote:
> On Sat, Jun 25, 2016 at 6:51 AM, Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> w=
rote:
> > Hello,
> >
> > comments below.
> >
> > On 24.6.2016 05:48, Chen-Yu Tsai wrote:
> >> On Fri, Jun 24, 2016 at 3:20 AM,  <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
> >>> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >>>
> >>> Add label to the first cpu so that it can be referenced
> >>> from derived dts files.
> >>>
> >>> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >>> ---
> >>>  arch/arm/boot/dts/sun8i-h3.dtsi | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8=
i-h3.dtsi
> >>> index 9938972..82faefc 100644
> >>> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> >>> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> >>> @@ -52,7 +52,7 @@
> >>>                 #address-cells =3D <1>;
> >>>                 #size-cells =3D <0>;
> >>>
> >>> -               cpu@0 {
> >>> +               cpu0: cpu@0 {
> >>>                         compatible =3D "arm,cortex-a7";
> >>>                         device_type =3D "cpu";
> >>>                         reg =3D <0>;
> >>
> >> Can you also set the cpu clock here? It is part of the SoC
> >> and does not belong in the board DTS files.
> >
> > Do you mean operating-points, or something else? Different SBCs will
> > probably require different combinations of operating points just for
> > safety's sake, because they have different regulators and [some have
> > botched] thermal designs, so it might make sense to customize it for
> > differnt boards, and I don't feel adventurous enough setting it for all
> > H3 boards out there.
>=20
> I meant clocks =3D <...> and clock-latency =3D <...>.
>=20
> These 2 are part of the SoC.
>=20
> The OPP can stay in the board files. It's a pity there's no standard
> OPP table for H3 though. :(

This has never been the case, and we always had some deviation in the
FEX files for all the SoCs.

If we could come up with standard OPPs that work for every one,
there's no reason it can't happen here.

I don't really see why the thermal design should change anything. If a
boards heats faster, it will throttle down to a lower OPP faster, but
those OPPs are not going to change.

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

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXbixwAAoJEBx+YmzsjxAgrTAQAKsTGeMHORmiNiC+JRR1ZjVm
PG8xuKcLna3cY4ptPTPhyOLdi2gb0HCf3McSywbFi6DsRqgwqumVoQkMzriLbrsA
VFmOLStadCCCaiSASInhmZAC5pLtwN5oZybdOytMUC2yqy2coPkIfn5ZgTgYvbGK
oIhyLjlS37LJsoS2nZfxuzSKGQ9PcQVgLNOVfjGZmOp272ZjHlYEBos+UpSDy8GQ
fVSHw4nFm7GgBFMnoC4IDmaSML8AYXu8p/QTQ0Yde+jyOKAKLKBA9OyDElkrmWvr
AJTqGYXRfH4WEtFyqtcYg6HBS7S3eeAuuObFs5yFFKM6/6dbV+eVYSEvt0gv3Cc4
eBVDrd208HDTm+7XjMy5FUpAT6bHZ7DOBjYsrDuldY4xxlnknOYmjA1MdinooUux
Qr4jTS9+AqSOiuhW7Jfe1hJ0G6wW4rqTqVhYVSYZhyIhE2ukxutqEBlpK7iXrTiK
73j66k2Ns9uhuaUc/pdO97MuXxs0DJuEstpLRs7NJNQ3gkg0he7Q0jhyxqqIu797
JFTTwi6WfZqKipfCP7QuwDTqVzstaQghMpSMaIHFH2BBdVr4YKL8NgXVzt3xS9ac
/XXl15JM8EzoMjwcWh37oyFyywnuoGQ2JN1xdfO8WB2lpd69eKgQX/r4ohrmOVRA
QzDVsj9NXGV2DXxQ7UKG
=PNl8
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
