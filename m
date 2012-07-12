From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH v2 07/19] tegra: fdt: Add LCD definitions for
	Tegra
Date: Thu, 12 Jul 2012 10:40:51 +0200
Message-ID: <20120712084051.GA27022@avionic-0098.adnet.avionic-design.de>
References: <1339604395-6621-1-git-send-email-sjg@chromium.org>
	<1339604395-6621-8-git-send-email-sjg@chromium.org>
	<4FDA749D.2030201@wwwdotorg.org>
	<CAPnjgZ2MUpjGS-BwQ6yASahFiu2OTWx4RUrJ7bkSkq72QmX++Q@mail.gmail.com>
	<20120711054842.GB10344@avionic-0098.mockup.avionic-design.de>
	<CAPnjgZ0Lv2rjVzNottsY+NWYmred5Au+hebUuTTOSAJufTkLjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1986883763=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ0Lv2rjVzNottsY+NWYmred5Au+hebUuTTOSAJufTkLjA@mail.gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: Stephen Warren <swarren@nvidia.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Alex Courbot <acourbot@nvidia.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org


--===============1986883763==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 12, 2012 at 10:21:01AM +0200, Simon Glass wrote:
> Hi Thierry,
>=20
> On Wed, Jul 11, 2012 at 7:48 AM, Thierry Reding
> <thierry.reding@avionic-design.de> wrote:
> > On Wed, Jul 11, 2012 at 06:44:10AM +0200, Simon Glass wrote:
> >> Hi Stephen,
> >>
> >> On Fri, Jun 15, 2012 at 1:32 AM, Stephen Warren <swarren@wwwdotorg.org=
>wrote:
> >>
> >> > On 06/13/2012 10:19 AM, Simon Glass wrote:
> >> > > Add LCD definitions and also a proposed binding for LCD displays.
> >> > >
> >> > > The PWFM is in progress on the device-tree-discuss list, so only a
> >> > > very basic binding is offered here.
> >> >
> >> > I believe we have settled on a final representation, it just hasn't =
been
> >> > added into linux-next yet. See:
> >> >
> >> >
> >> > http://gitorious.org/linux-pwm/linux-pwm/commit/d3ce73e5dc86646a6302=
f2b0f7dd40e8c552fa04
> >>
> >>
> >> Thanks for the pointer. I suppose this doesn't address clocks as yet, =
but
> >> that's fine.
> >
> > I was waiting for the common clock framework and DT bindings to get
> > ready. This should happen RSN for Tegra so I will probably look at
> > adding support for it in.
>=20
> OK, are you looking at adding it in U-Boot?

No. I don't have much time to spend on U-Boot right now.

[...]
> I also need a place to put the pwm and GPIOs for the panel itself.
> Something like this:
>=20
> 		nvidia,pwm =3D <&pwm 2 0>;
> 		nvidia,backlight-enable-gpios =3D <&gpio 28 0>;	/* PD4 */
> 		nvidia,lvds-shutdown-gpios =3D <&gpio 10 0>;	/* PB2 */
> 		nvidia,backlight-vdd-gpios =3D <&gpio 176 0>;	/* PW0 */
> 		nvidia,panel-vdd-gpios =3D <&gpio 22 0>;		/* PC6 */
> 		nvidia,panel-timings =3D <4 203 17 15>;  (number of ms before turning
> on the next gpio)
> 		nvidia,bits-per-pixel =3D <16>;    (er, TBD)
>=20
> I am thinking of something like a phandle in your rgb node:
>=20
> 	host1x {
> 		dc@54200000 {
> 			rgb {
> 				nvidia-panel =3D <&lcd_panel>;
> ...
>=20
> 	lcd_panel: panel {
> 		nvidia,pwm =3D <&pwm 2 0>;
>                 ...
>         }
>=20
> Or have you already solved this problem another way?

Linux has a generic PWM backlight driver. This is currently solved by
using this in the DT:

	backlight {
		compatible =3D "pwm-backlight";
		pwms =3D <&pwm 0 5000000>;

		brightness-levels =3D <0 4 8 16 32 64 128 255>;
		default-brightness-level =3D <6>;
	};

Alex Courbot (Cc'd) has been working on adding a generic way to add GPIO
and regulator support to that. I don't know exactly what the
lvds-shutdown-gpios and panel-vdd-gpios properties do. If they control
hardware connected behind the display controller I suppose they could go
into the rgb node.

The panel alternative that you propose sounds interesting as well. Maybe
the panel should itself contain either a phandle or a subnode for the
backlight and collect the properties that you listed above.

Thierry

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP/o2TAAoJEN0jrNd/PrOhgVIQAL7uoA315D0ojVd5SUNq06q9
PaPqrKgoZhaGmty0AB59A7C0OTJnHi7o5twtt+N8avcjHJ0ntezsv2QiEI3OlH8a
X1Vi/kGoEi7/F0wNaOuR4hOwmvwMMSeTFdJOlYwHBTZ0urDThlIEiVBApgEt7JvS
vKESu33o0YaBYsfzJ9yxaiHxRdAW5MgXTPw70fPZTjNabYn/Z2Hxr3MFt0IFcyuC
7trRL4gF77cgxExzTZjzZ3FGtXeHfkx/pH7LGlLjGYRFNhbOnQeTK4vvAimi5QsA
oBo4D9PUrDF0tkhGVkgqGoUimmSDPNZqOp90wVmvitBUPUFOxCgB6o2tibEMxK7M
KfYNfEicBO+VqUKaJM9TJgcu7DpA8Ah5EadJF6NG79gmVmeCfl5t3hk2gdWrMQRP
buuhCf58ACI4lXSEXwnuQX6Gd4Rk9RijsBtCaaYJ6ZtvoEnp4zinpJAwjQtbGgIM
aeC6fPTVkKezSQUID616JauabSxoZgqGsNN6EAUwZcWT4oVJVKEQCBdvcsiCZWID
Czufq9O8tpcFy3BVXf4tpHm4LzA9HmR7qPEkWqv19Bopkx2FUBFjNAFRSYnxTU7M
sLsMzNWjzvF1uGtU50bvmRLmp60ZA+VrtXFAjc788Ogegf0OexBbtV3RUMldk+VY
mnmc7kZj6jF81LMFP8Fr
=L/et
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--

--===============1986883763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============1986883763==--
