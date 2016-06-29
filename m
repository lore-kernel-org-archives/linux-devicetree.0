From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: dts: sun8i: Add cpu0 label to sun8i-h3.dtsi
Date: Wed, 29 Jun 2016 22:45:53 +0200
Message-ID: <20160629204553.GJ6095@lukather>
References: <20160623192104.18720-1-megous@megous.com>
 <20160623192104.18720-7-megous@megous.com>
 <CAGb2v66eskVAxdz8VtjBJBCO7VV9WL4bdFDVrPWrSmxk4RASCw@mail.gmail.com>
 <adaf7f61-af80-cc02-8c47-af721b86f81e@megous.com>
 <CAGb2v665O75vQEfo5WdWtWJSbKEbLi6MBAHbgZC7pyrOCOu+6g@mail.gmail.com>
 <20160625070208.GA4000@lukather>
 <380ebf34-fd4a-ea2d-f9cf-68b8ede44757@megous.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sU4rRG038CsJurvk"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBDPH2C5QKGQEMEHLKXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <380ebf34-fd4a-ea2d-f9cf-68b8ede44757-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dev <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--sU4rRG038CsJurvk
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jun 25, 2016 at 04:50:24PM +0200, Ond=C5=99ej Jirman wrote:
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
> I've no way to test, but I've been told some Sinovoip boards are really
> bad in this regard (SoC is not even well thermally connected to the
> PCB/PCB not having copper layer to spread the heat). Thermal sensor
> readings happen at fixed intervals, so the question is if you can heat
> up the soc from say 80=C2=B0C (first trip point) to over 110=C2=B0C in le=
ss than
> that period (330ms currently).
>=20
> I say it shouldn't be a problem, if that small thing is drawing say 2W
> at max load. It will burn or trigger a second trip point before the
> first one has a chance to trigger and the kernel will shut down. I
> remember tkaiser saying that he has to run that board at 240MHz max. But
> perhaps I'm misremembering.
>=20
> I'm just speculating.

Yes, but that's just poor thermal design. What I was saying is that
even if we really need to throttle the SoC to 240 MHz on that board
because it heats too much, the couple of the frequency and the voltage
will likely be the same across all boards. It's just the amount of
time we'll spend using it that will differ.

But that's just my understanding, I might be speaking non-sense :)

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

--sU4rRG038CsJurvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXdDOBAAoJEBx+YmzsjxAg/pEP/3+AAWn5HopdZzJibDfvJ1uH
nUmVD1Jay9oizAxf+QEVFKNM700NVkEFVJIz4Vnu6glfCwAP+RT+MQg7StctwXTs
YtKl2AMbPcv2AfvAA9LqW3tbhqrZKGcQd8YLLDqnwu9yRFA8EGUtcdmZUczIUdX/
N/Cby4vKi7bDoVvtjYEB+i5VDRGPQXzs/3UOJrE/eyvlKGm0mcMBkDRmzNs6mt5d
nW5nYACi6iQtkLNXEGcOVvWhi/hWGafHI8stjulfG5x8wkxdthj1u1tlaNosCika
zgio7LwDNN5YzX9O3Ll7z1gnJq4VNAS/S9yl2OU3g4Dk/STTZM3yLM3jS2ejf/cQ
rDgXVeV9HJ9yoN4sUN5T7R8f9LogxWsQxNDcKcgfAOaVSozWtV6algQQQpWfnFe2
DgldgvsK4MEejPNnsiUrLSwD4wntYKhFWmSjp7R4/74dbUsAtPU3Qf47NmwIXNcT
q+HmF2I6y6Ycmi15CgvhcUGKlTqASdk8N9+ma0TM6EnW5SKsKMGfmOAoV/yVDzBw
LSRUUd52C+Uh3HeHdTXpJNa5w5A50fMKNI3+B5ktLF5IANC7t9xQK/4pGn3xFrph
f5X0sDpBVP8UP5q1BNT9q/QrdBVvqENnEuUl/jO3nMDq9FS27E53BBYmvf6yAuLV
vmZ1yHaIvMWhLJSXIbGR
=rg3R
-----END PGP SIGNATURE-----

--sU4rRG038CsJurvk--
