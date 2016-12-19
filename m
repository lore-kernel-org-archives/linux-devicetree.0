From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sun8i-q8-common: enable bluetooth on SDIO Wi-Fi
Date: Mon, 19 Dec 2016 11:09:52 +0100
Message-ID: <20161219100952.bspym36nsehda3za@lukather>
References: <20161213233658.atGuNCNY@smtp1h.mail.yandex.net>
 <20161216124748.rkvnnlo4x5onzpvk@lukather>
 <4720181481899200@web7g.yandex.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1985710823836435038=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4720181481899200@web7g.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1985710823836435038==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="53d2dee7icl3m6f7"
Content-Disposition: inline


--53d2dee7icl3m6f7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2016 at 10:40:00PM +0800, Icenowy Zheng wrote:
> >> =A0> >=A0 &r_pio {
> >> =A0> >=A0 wifi_pwrseq_pin_q8: wifi_pwrseq_pin@0 {
> >> =A0> > - pins =3D "PL6", "PL7", "PL11";
> >> =A0> > + pins =3D "PL6", "PL7", "PL8", "PL11";
> >> =A0> >=A0 function =3D "gpio_in";
> >> =A0> >=A0 bias-pull-up;
> >> =A0> >=A0 };
> >> =A0>
> >> =A0> There's several things wrong here. The first one is that you rely
> >> =A0> solely on the pinctrl state to maintain a reset line. This is very
> >> =A0> fragile (especially since the GPIO pinctrl state are likely to go=
 away
> >> =A0> at some point), but it also means that if your driver wants to re=
cover
> >> =A0> from that situation at some point, it won't work.
> >> =A0>
> >> =A0> The other one is that the bluetooth and wifi chips are two device=
s in
> >> =A0> linux, and you assign that pin to the wrong device (wifi).
> >> =A0>
> >> =A0> rfkill-gpio is made just for that, so please use it.
> >>
> >> =A0The GPIO is not for the radio, but for the full Bluetooth part.
> >
> > I know.
> >
> >> =A0If it's set to 0, then the bluetooth part will reset, and the
> >> =A0hciattach will fail.
> >
> > Both rfkill-gpio and rfkill-regulator will shutdown when called
> > (either by poking the reset pin or shutting down the regulator), so
> > that definitely seems like an expected behavior to put the device in
> > reset.
> >
> >> =A0The BSP uses this as a rfkill, and the result is that the bluetooth
> >> =A0on/off switch do not work properly.
> >
> > Then rfkill needs fixing, but working around it by hoping that the
> > core will probe an entirely different device, and enforcing a default
> > that the rest of the kernel might or might not change is both fragile
> > and wrong.
>=20
> I think a rfkill-gpio here works just like the BSP rfkill...
>=20
> The real problem is that the Realtek UART bluetooth driver is a userspace
> program (a modified hciattach), which is not capable of the GPIO reset...

Can't you run rfkill before attaching? What is the problem exactly?
It's not in reset for long enough?

This seems more and more like an issue in the BT stack you're
using. We might consider workarounds in the kernel, but they have to
be correct.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--53d2dee7icl3m6f7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYV7HwAAoJEBx+YmzsjxAg8DEP/02nDXDz0ujqtzKV5wsVCkt2
R8YZmtcc0Tt10x9uXf8F26otNpY3nBMRCwRvmBxMXHCUBzVsS9icoOOX+drEHq/3
RVWs49sVFzqbJWI68AzT/8iMObYvXB7EvQg61Lt6MNhwjABlmBehyzLDcllqwyG/
TB/dYk5pfLwxIWFyQ5cUq61lsc02vCxVhqZj3y4gW5A08dj7exko5fgvJ8F83sO7
lfs0TzJpCExepMlnhZkFemt5DEg0yuFYJwmy5rbMwb37whSi6DmcdJbuscfg+JqN
5HyV3FPBxUrYL/rPwk95UxN9lPsRTLxMjfBfRJp6U5onEwB/9A9wTCTOo89nNAcX
C/RNX43T2nK38Z3hg1VFbHG7pyIjHk5uMseGr+PibbsjpEybYB0TCW8eXg8zgBn3
kAZAyh7b8xvGh4k53qKRRocLVX8zNGy0FIcW4xtFFCpQLTii2TthkvcnRgfNMKd/
pSIGJVJmTDsREsi9GTEkSU2Txg72GWwFWa/bOdyaVFjha+XIfGKf9DbYvn8DXwj9
ZH2Flz/ZQz8rIZP9LSOQ5WHgRccnh9IXze9hpDLSVYUmgtog0S8zAb78KAbioqYO
BJQE/IvjeEhOZ6rKMic1yAHkm9Bjf5JCT1bv4u9iPakpOSfIY6h25MRUYHjaTlRm
Tfhrztyghe3RWK3Rtl0Z
=DrTH
-----END PGP SIGNATURE-----

--53d2dee7icl3m6f7--


--===============1985710823836435038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1985710823836435038==--
