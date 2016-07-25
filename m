From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: dts: sun8i: Add cpu0 label to sun8i-h3.dtsi
Date: Mon, 25 Jul 2016 10:26:48 +0200
Message-ID: <20160725082648.GG7419@lukather>
References: <20160623192104.18720-1-megous@megous.com>
 <20160623192104.18720-7-megous@megous.com>
 <CAGb2v66eskVAxdz8VtjBJBCO7VV9WL4bdFDVrPWrSmxk4RASCw@mail.gmail.com>
 <adaf7f61-af80-cc02-8c47-af721b86f81e@megous.com>
 <CAGb2v665O75vQEfo5WdWtWJSbKEbLi6MBAHbgZC7pyrOCOu+6g@mail.gmail.com>
 <20160625070208.GA4000@lukather>
 <49ce09ae-052a-bb2b-ce66-f0aa0d0024e3@megous.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nhYGnrYv1PEJ5gA2"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBSM2266AKGQEP7KL6EQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <49ce09ae-052a-bb2b-ce66-f0aa0d0024e3-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dev <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nhYGnrYv1PEJ5gA2
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2016 at 04:39:27PM +0200, Ond=C5=99ej Jirman wrote:
>=20
>=20
> On 25.6.2016 09:02, Maxime Ripard wrote:
> > On Sat, Jun 25, 2016 at 09:02:48AM +0800, Chen-Yu Tsai wrote:
> >> On Sat, Jun 25, 2016 at 6:51 AM, Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org=
> wrote:
> >>> Hello,
> >>>
> >>> comments below.
> >>>
> >>> On 24.6.2016 05:48, Chen-Yu Tsai wrote:
> >>>> On Fri, Jun 24, 2016 at 3:20 AM,  <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
> >>>>> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >>>>>
> >>>>> Add label to the first cpu so that it can be referenced
> >>>>> from derived dts files.
> >>>>>
> >>>>> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >>>>> ---
> >>>>>  arch/arm/boot/dts/sun8i-h3.dtsi | 2 +-
> >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/su=
n8i-h3.dtsi
> >>>>> index 9938972..82faefc 100644
> >>>>> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> >>>>> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> >>>>> @@ -52,7 +52,7 @@
> >>>>>                 #address-cells =3D <1>;
> >>>>>                 #size-cells =3D <0>;
> >>>>>
> >>>>> -               cpu@0 {
> >>>>> +               cpu0: cpu@0 {
> >>>>>                         compatible =3D "arm,cortex-a7";
> >>>>>                         device_type =3D "cpu";
> >>>>>                         reg =3D <0>;
> >>>>
> >>>> Can you also set the cpu clock here? It is part of the SoC
> >>>> and does not belong in the board DTS files.
> >>>
> >>> Do you mean operating-points, or something else? Different SBCs will
> >>> probably require different combinations of operating points just for
> >>> safety's sake, because they have different regulators and [some have
> >>> botched] thermal designs, so it might make sense to customize it for
> >>> differnt boards, and I don't feel adventurous enough setting it for a=
ll
> >>> H3 boards out there.
> >>
> >> I meant clocks =3D <...> and clock-latency =3D <...>.
> >>
> >> These 2 are part of the SoC.
> >>
> >> The OPP can stay in the board files. It's a pity there's no standard
> >> OPP table for H3 though. :(
> >=20
> > This has never been the case, and we always had some deviation in the
> > FEX files for all the SoCs.
> >=20
> > If we could come up with standard OPPs that work for every one,
> > there's no reason it can't happen here.
> >=20
> > I don't really see why the thermal design should change anything. If a
> > boards heats faster, it will throttle down to a lower OPP faster, but
> > those OPPs are not going to change.
>=20
> So I tried, and found out that it will not be so easy. Different boards
> have different regulators, and linux doesn't deal well with voltages
> that are not supported by the regulator.
>=20
> So even if the board can run at certain frequency if you round the
> voltage to the next higher voltage supported by the regulator, opp
> implementation doesn't do the rounding and just drops the operating
> points that have no support in the voltage regulator.
>=20
> We have boards that have 1.1/1.3V switching, only 1.3V, fine tuned
> voltage regulation and every such board will need it's own set of
> operating points.
>=20
> I'd leave the OPP definitions in the board files for now.

Works for me.

Maxime


--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--nhYGnrYv1PEJ5gA2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXlc1IAAoJEBx+YmzsjxAg7pMP/jLMfGN/RkMWbVPvUa3eX/5X
6b88JTyst5W68NKABWuxmtsxHqcDnnO6C66h/dSoCqspItg31GrHhCcSZA8b6pV2
FJW8HXKYeI/zb5ZWsxDQCu/GmFAe46YNGZpgYwL8IBU77wrgOeMwmh9jTnPq6ch+
6rN05z3xf3drl8anRQm0aaCu2DA4zr5lQ6RbBF/VZCJ2AQpy/z17cf21ehzY1Db2
p9FnMWfCOR3TYzF6geCRtYcLdo1J2M5BMIhG6tVEmbdaWKIujg3IWy3Eri8EzcIz
tHK/LwHREPSH3qK4Dn/N7CDQNJRi+mFQvUn9Y+IGMKw3X48LS2TObw1rxUaCyWax
ltchUIU/BImgs2ykTjoRHr6W0pexRjF+N8SMxoGIKXt3EkVB8Wq94uy3qgZ1NaVW
3OgFIkHwbIWNaf9MvcTsga76/uybxlKcMd+32eBUBxgFxEoQdBq52n8dA9fTfrHi
C1PaoOHGYM2ez3lA2VSeVsBDrgizDd/UwfFFrRjNFi77WqVFRiBQIO1PRdYm35Wx
A1M1qBY2yCPHDYeyfBxZAgb1Zb4/bpgPZQebO1+fM5CMQnF2DQRUkL9r2tibxWJa
D5UtQN0Jvq8YQaUwRrKCiiVWIlZvT9IfefX/b44smeJ9JGAQBZpn/+OP77K6QDWQ
k4toYVvqYjBSXdjWuq7d
=xHzM
-----END PGP SIGNATURE-----

--nhYGnrYv1PEJ5gA2--
