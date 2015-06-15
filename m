From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 12/12] MIPS: Add basic support for the TL-WR1043ND
 version 1
Date: Mon, 15 Jun 2015 10:42:13 +0300
Message-ID: <20150615104213.92258d2d0616c12e4aa7bf1a@gmail.com>
References: <1433029955-7346-1-git-send-email-albeu@free.fr>
	<1433031506-7984-5-git-send-email-albeu@free.fr>
	<20150608131758.9d76be074998ea3de0e976a4@gmail.com>
	<20150610235811.0b18af9b@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150610235811.0b18af9b@tock>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 10 Jun 2015 23:58:11 +0200
Alban <albeu-GANU6spQydw@public.gmane.org> wrote:

> On Mon, 8 Jun 2015 13:17:58 +0300
> Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> > IMHO AR9132 SoC can't work without external oscilator.
> >=20
> > Can we just move basic extosc declaration to SoC dt file
> > (ar9132.dtsi)? So board dt file ar9132_tl_wr1043nd_v1.dts will
> > contain only oscilator clock frequency value.
>=20
> I would prefer to keep the split between the files in sync with the
> hardware. I understand that most simple board designs use a fixed
> oscillator, but that might not always be the case.
>=20

The AR9132 SoC __always__ use one external oscilator. So it's reasonabl=
e
to have the first mention of extosc in ar9132.dtsi not in a board file.
This description style is always sync with hardware.
On the other hand pll-controller is always part of the SoC
not a part of a board. So pll-controller on extosc dependency
have to go to SoC dts file not to a board file. In your dts description
pll-controller is a part of a dts board file.

It looks like my previous device tree structure proposal contains a sma=
ll error
(extra clock-frequency field in ar9132.dtsi). I have fixed it. Please c=
omment it.

ar9132.dtsi:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

	extosc: oscillator {
		compatible =3D "fixed-clock";
		#clock-cells =3D <0>;
	};
=2E..
	ahb {
		apb {

=2E..

			pll-controller@18050000 {
=2E..
				clocks =3D <&extosc>;
=2E..



ar9132_tl_wr1043nd_v1.dts:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

=2E..
	&extosc {
		clock-frequency =3D <40000000>;
	};


--=20
--=A0
Best regards,
=A0 Antony Pavlov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
