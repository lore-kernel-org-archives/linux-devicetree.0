From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: gnss: add u-blox binding
Date: Fri, 4 May 2018 13:42:13 +0200
Message-ID: <20180504114213.3xlzqxe74n55tk5s@earth.universe>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180424163458.11947-5-johan@kernel.org>
 <CAL_Jsq+mCp=geT8t_j+0fuTxAB7C9RYn6pESRpLc2GH273fM1Q@mail.gmail.com>
 <20180426091018.GU4615@localhost>
 <CAL_JsqK=xQBx2YCd0kDP0zLn_LAZb6Mi5UfSTQf2soooVz2unQ@mail.gmail.com>
 <20180502081637.GE2285@localhost>
 <5242FCAD-3139-4A9C-B9FA-7BBAA0E6AE57@goldelico.com>
 <20180503205037.7be552c1@aktux>
 <44A0BC7C-67C7-4116-849F-90FF7CF2B1F0@goldelico.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fr6vxnvn3axa4j5k"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <44A0BC7C-67C7-4116-849F-90FF7CF2B1F0@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Johan Hovold <johan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
List-Id: devicetree@vger.kernel.org


--fr6vxnvn3axa4j5k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[+cc Tony]

Hi,

On Fri, May 04, 2018 at 07:16:00AM +0200, H. Nikolaus Schaller wrote:
> > Am 03.05.2018 um 20:50 schrieb Andreas Kemnade <andreas@kemnade.info>:
> > On Thu, 3 May 2018 11:35:21 +0200
> > H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >=20
> >> I have realized that the w2sg0004 is an exception (although a Sirf chi=
p)
> >> that it does not provide a WAKEUP signal. And another significant
> >> difference is that we have to keep the serdev UART enabled even if the=
re
> >> is no user-space client. Otherwise we are not able to detect unexpected
> >> activity. So we unfortunately can't move serdev open/close into the .o=
pen
> >> and .close ops but need to open it in probe.
> >>=20
> > how much power does it use to keep the uart enabled? Or should it
> > better be reprogrammed as gpio?
>=20
> I think it does not need much more (if at all) than a gpio controller on
> the OMAP3 chip (I think the clocks are active anyways for use by the other
> UARTs).
>
> We had proposed years ago to reprogram the UART RX pin by pinmux-states
> into an interrupt gpio but that was rejected because it was not general
> enough and ugly in the device tree (an rx-gpios record where the rx-line
> is already connected to the UART-rx).
>=20
> Then we did experiment with tapping the UART driver and finally the
> serdev API was developed to solve this problem. Hence we use it now this
> way.

Having any UART active on OMAP results in the SoC not entering
idle/off wasting energy. For normal (i.e. not connected to a peripheral)
TTYs you can enable runtime autosuspend and configure the RX pin as
wakeup interrupt. This will wakeup the TTY on incoming traffic, but you
will lose the first few characters (since the serial device needs some
time to wakeup). This is for example supported by the N900 uart3
(debug uart):

$ grep -A4 "&uart3 {" arch/arm/boot/dts/omap3-n900.dts=20
&uart3 {
	interrupts-extended =3D <&intc 74 &omap3_pmx_core OMAP3_UART3_RX>;
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&uart3_pins>;
};

To get it working, you also need to enable autosuspend for the tty
in userspace (echo 3000 /sys/class/tty/ttyS2/device/power/autosuspend_delay=
_ms).
This is not enabled by default due to the character loss characteristic
during wakeup.

Having said all of this, serdev does not yet support runtime PM (at
all). Tony is currently looking into it. Fortunately serdev allows
us to enable runtime PM by default (once implemented), since we know
the remote side and can (hopefully) avoid losing characters (i.e.
with sideband wakeup gpios).

-- Sebastian

--fr6vxnvn3axa4j5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlrsRw8ACgkQ2O7X88g7
+pqGdg//elQzv9AQMj6Bh2X1IMnncHM5o8P+66xvaTfO3HsdYPKnMchK3CaThTSg
g3pGreNXkWqbj9YFiAWeyIAXs2WNjQ3dxtz3r3LuivdCboZ4BI7vnYj/mtZ8h5rP
PYS7XarMTgAB0ieZgVfxUTP7+jJTAKdOOwICpO4A+pYXJAKjeH3HORAILhYyRs9L
7Ve0fEeNcdIp0XEQ9ZNH1698KhOmaBiPC5qekcNLA0jb1mg0czpcM7vXVfldqrNX
9pb9XDZNW2VmDUqISbf5oO2p25p34d02ffv0ccdXt0foGzb6Km/a6SufjcTtIcy7
Labmo1XNSQWuPxIM6o1FZFrfEE404k3zDdWN0H3QwNZ8EylWZBOVT0eZtmmr99Js
AD7l1KzD+k1sVL1yJyAm4qr3armQkymDVraLi3QxU0iouhHNr++OP1eNx7Esbc4W
zF07J0cuGdc2zQR+NkWKNc2K4UF0F6MjGd9n2jiHrMpyKy4ZgVkFH+qkGJcIG0tD
QQpmoLrNlu9+nDjy8doACRd1+LZd2F5GqDfT7IGawNOo/qqvIjwKB7CbNhKymrow
Yu/MgfOU0d+53VCU4uVruvdSKL1+c7fsf32fgfc1eqG1W01LQQmxTdIbH7vZlFab
+ECGmzbz6wV5ePpRh5Uk5UepE7dLbgyDYB/RXxTtwQ/tQGytgEg=
=bbq8
-----END PGP SIGNATURE-----

--fr6vxnvn3axa4j5k--
