From: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: r8a7791: Don't disable referenced optional
 clocks
Date: Thu, 07 Apr 2016 09:00:50 +0200
Message-ID: <1460012450.13819.38.camel@collabora.co.uk>
References: <1459947173-6664-1-git-send-email-sjoerd.simons@collabora.co.uk>
	 <57059874.1070309@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57059874.1070309-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hey Sergei,

Thanks for your review.

On Thu, 2016-04-07 at 02:15 +0300, Sergei Shtylyov wrote:
> On 04/06/2016 03:52 PM, Sjoerd Simons wrote:
>=20
> >=20
> > clk_get on a disabled clock node will return EPROBE_DEFER, which
> > can
> > cause drivers to be deferred forever if such clocks are referenced
> > in
> > their clocks property.
> >=20
> > Update the various disabled external clock nodes to default to a
> > frequency of 0, but don't disable them to prevent this.
> >=20
> > Signed-off-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> >=20
> > ---
> >=20
> > =C2=A0 arch/arm/boot/dts/r8a7791-koelsch.dts | 1 +
> > =C2=A0 arch/arm/boot/dts/r8a7791-porter.dts=C2=A0=C2=A0| 1 +
> > =C2=A0 arch/arm/boot/dts/r8a7791.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0| 5 +----
> > =C2=A0 3 files changed, 3 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts
> > b/arch/arm/boot/dts/r8a7791-koelsch.dts
> > index 1adf877..da59c28 100644
> > --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
> > +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
> > @@ -660,6 +660,7 @@
> > =C2=A0 };
> >=20
> > =C2=A0 &pcie_bus_clk {
> > +	clock-frequency =3D <100000000>;
> =C2=A0=C2=A0=C2=A0=C2=A0Hmmm, looking at the Koelsch schematics, I do=
n't see this clock.
> :-/

I don't have the schematics so i was simply keeping the current state.
I've added Phil Edworthy to the list as he was the one originally
enable the bus clk for Koelsh according to git. Hopefully he can
clarify :)

> > =C2=A0=C2=A0	status =3D "okay";
> > =C2=A0 };
> >=20
> > diff --git a/arch/arm/boot/dts/r8a7791-porter.dts
> > b/arch/arm/boot/dts/r8a7791-porter.dts
> > index 9554d13..19b257e 100644
> > --- a/arch/arm/boot/dts/r8a7791-porter.dts
> > +++ b/arch/arm/boot/dts/r8a7791-porter.dts
> > @@ -413,6 +413,7 @@
> > =C2=A0 };
> >=20
> > =C2=A0 &pcie_bus_clk {
> > +	clock-frequency =3D <100000000>;
> > =C2=A0=C2=A0	status =3D "okay";
> > =C2=A0 };
> >=20
> =C2=A0=C2=A0=C2=A0=C2=A0Again, looking at the Porter schematics, I do=
n't see this clock
> either. :-/

You were the one enabling this clock for Porter ;) I don't have PCIE
hardware to test with on my porter board, might be worth if you could
disable this clock and see if PCI-E still fucntions as expected (maybe
in practise it just happens to prefer the internal clock?) ?

> >=20
> > diff --git a/arch/arm/boot/dts/r8a7791.dtsi
> > b/arch/arm/boot/dts/r8a7791.dtsi
> > index 8693888..676df63 100644
> > --- a/arch/arm/boot/dts/r8a7791.dtsi
> > +++ b/arch/arm/boot/dts/r8a7791.dtsi
> > @@ -1104,8 +1104,7 @@
> > =C2=A0=C2=A0		pcie_bus_clk: pcie_bus {
> > =C2=A0=C2=A0			compatible =3D "fixed-clock";
> > =C2=A0=C2=A0			#clock-cells =3D <0>;
> > -			clock-frequency =3D <100000000>;
> > -			status =3D "disabled";
> > +			clock-frequency =3D <0>;
> =C2=A0=C2=A0=C2=A0=C2=A0If the clock has a good default frequency, I =
don't think you need
> to=C2=A0
> remove it. Otherwise you missed USB_EXTAL which is 48 MHz (and can be
> overridden).

I did that as it was by default disabled, so if i do enable it but
don't drop the default frequency to 0 board swithout that clock will
suddenly have it added to their dtb.

=46or the usb external clock I didn't touch it as it was already enable=
d
by default with a proper frequency, so it wouldn't hit the issue i was
trying to fix here. But i agree, both looking at other Renesas dtsis
and how all other external clocks are done in this dtsi, this node is
odd.


--=20
Sjoerd Simons
Collabora Ltd.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
