From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v3 08/14] MIPS: dts: qca: introduce AR9331 devicetree
Date: Mon, 14 Mar 2016 21:53:45 +0300
Message-ID: <20160314215345.00df3fa56c363061e730572e@gmail.com>
References: <1453580251-2341-1-git-send-email-antonynpavlov@gmail.com>
	<1453580251-2341-9-git-send-email-antonynpavlov@gmail.com>
	<20160125234630.16098b7f@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160125234630.16098b7f@tock>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 25 Jan 2016 23:46:30 +0100
Alban <albeu-GANU6spQydw@public.gmane.org> wrote:

> On Sat, 23 Jan 2016 23:17:25 +0300
> Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> > This patch introduces devicetree for Atheros AR9331 SoC (AKA Hornet=
).
> > The AR9331 chip is a Wi-Fi System-On-Chip (WiSOC),
> > typically used in very cheap Access Points and Routers.
> >=20
> > Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> > Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> > Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> >  arch/mips/boot/dts/qca/ar9331.dtsi | 123 +++++++++++++++++++++++++=
++++++++++++
> >  1 file changed, 123 insertions(+)
> >=20
> > diff --git a/arch/mips/boot/dts/qca/ar9331.dtsi b/arch/mips/boot/dt=
s/qca/ar9331.dtsi
> > new file mode 100644
> > index 0000000..bf128a2
> > --- /dev/null
> > +++ b/arch/mips/boot/dts/qca/ar9331.dtsi
> > @@ -0,0 +1,123 @@
> > +#include <dt-bindings/clock/ath79-clk.h>
> > +
> > +/ {
> > +	compatible =3D "qca,ar9331";
> > +
>=20
> [...]
>=20
> > +
> > +	extosc: oscillator {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +	};
>=20
> This oscillator is on the board and not in the SoC, so it should
> be in the board DTS.

However oscillator is inside SoC!

Please see https://en.wikipedia.org/wiki/Electronic_oscillator

    An electronic oscillator is an electronic circuit that produces a p=
eriodic,
    oscillating electronic signal, often a sine wave or a square wave.

Please see AR9331 data sheet: the SoC has no input for external oscilla=
tor,
only two pins (XTALO and XTALI) for connecting 25 MHz or 40 MHz quartz =
crystal.
The crystal can't produce a square wave itself! The crystal is only a p=
art
of a complete oscillator.

So we have a good reason to put basic oscillator node into the SoC dtsi=
-file.

--=A0
Best regards,
=A0 Antony Pavlov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
