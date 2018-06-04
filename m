From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: add support for Pinebook
Date: Mon, 4 Jun 2018 10:49:25 +0200
Message-ID: <20180604084925.wbtz7cdcleyaei62@flea>
References: <20180601062901.8052-1-anarsoul@gmail.com>
 <20180601062901.8052-4-anarsoul@gmail.com>
 <20180601092346.g2iixqupumn7xo7r@flea>
 <CA+E=qVffecgkCG2V_5ptS9oRxo4XwjpQQhWmf8ywpfF78Yy+7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5041387100736168116=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CA+E=qVffecgkCG2V_5ptS9oRxo4XwjpQQhWmf8ywpfF78Yy+7A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>, arm-linux <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============5041387100736168116==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2b3wiee55panlvid"
Content-Disposition: inline


--2b3wiee55panlvid
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 01, 2018 at 10:37:29AM -0700, Vasily Khoruzhick wrote:
> On Fri, Jun 1, 2018 at 2:23 AM, Maxime Ripard <maxime.ripard@bootlin.com>=
 wrote:
> > On Thu, May 31, 2018 at 11:29:01PM -0700, Vasily Khoruzhick wrote:
> >> From: Icenowy Zheng <icenowy@aosc.xyz>
> >>
> >> Pinebook is a A64-based laptop produced by Pine64, with the following
> >> peripherals:
> >>
> >> USB:
> >> - Two external USB ports (one is directly connected to A64's OTG
> >> controller, the other is under a internal hub connected to the host-on=
ly
> >> controller.)
> >> - USB HID keyboard and touchpad connected to the internal hub.
> >> - USB UVC camera connected to the internal hub.
> >>
> >> Power-related:
> >> - A DC IN jack connected to AXP803's DCIN pin.
> >> - A Li-Polymer battery connected to AXP803's battery pins.
> >>
> >> Storage:
> >> - An eMMC by Foresee on the main board (in the product revision of the
> >> main board it's designed to be switchable).
> >> - An external MicroSD card slot.
> >>
> >> Display:
> >> - An eDP LCD panel (1366x768) connected via an ANX6345 RGB-eDP bridge.
> >> - A mini HDMI port.
> >>
> >> Misc:
> >> - A Hall sensor designed to detect the status of lid, connected to GPI=
O PL12.
> >> - A headphone jack connected to the SoC's internal codec.
> >> - A debug UART port muxed with headphone jack.
> >>
> >> This commit adds basical support for it.
> >>
> >> [vasily: squashed several commits into one, added simplefb node, added=
 usbphy
> >>        to ehci0 and ohci0 nodes]
> >>
> >> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> >> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> >> ---
> >>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >>  .../dts/allwinner/sun50i-a64-pinebook.dts     | 285 ++++++++++++++++++
> >>  2 files changed, 286 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.=
dts
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/=
dts/allwinner/Makefile
> >> index 8bebe7da5ed9..a8c6d0c6f2c5 100644
> >> --- a/arch/arm64/boot/dts/allwinner/Makefile
> >> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> >> @@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-nanopi-a64.dtb
> >>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-olinuxino.dtb
> >>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-orangepi-win.dtb
> >>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pine64-plus.dtb sun50i-a64-p=
ine64.dtb
> >> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pinebook.dtb
> >>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-sopine-baseboard.dtb
> >>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-teres-i.dtb
> >>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-pc2.dtb
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> >> new file mode 100644
> >> index 000000000000..d952db217702
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> >> @@ -0,0 +1,285 @@
> >> +/*
> >> + * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.xyz>
> >> + * Copyright (C) 2018 Vasily Khoruzhick <anarsoul@gmail.com>
> >> + *
> >> + * SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >
> > The SPDX tag should be the first one.
>=20
> OK, but it's not in number of other dts files, e.g.
> sun50i-a64-teres-i.dts or sun50i-h5-orangepi-zero-plus.dts

I guess we'd have to fix it then

> >> +/* The ANX6345 eDP-bridge is on r_i2c. There is no linux (mainline)
> >> + * driver for this chip at the moment, the bootloader initializes it.
> >> + * However it can be accessed with the i2c-dev driver from user space.
> >> + */
> >
> > The comment format is wrong, and the part after r_i2c, about i2c-dev
> > and the mainline support is not really relevant. The DT describes the
> > hardware, and is used by several different projects that might or
> > might not have i2c-dev, an interface similar, or might have or not a
> > driver for the bridge.
>=20
> Comment is identical to sun50i-a64-teres-i.dts (which was merged few
> months ago).
> I'll remove everything but first sentence.

We don't notice everything unfortunately. Feel free to fix it in the
TERES-I DTS as well.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--2b3wiee55panlvid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsU/RQACgkQ0rTAlCFN
r3QwZg/+JHBSDE2O+F87pDwndmAxSBGrO0qgxWbl+uKmhkhc4z0NlIqtgJUoH2qr
3ojH8Tgv2sHZIqlkCo/QcmBKX4VZYiDRfRklgPYoIfI4EOlLprEQwoVKT1jLt8Kr
cIjwr6F52/y9+dHyQdJWp0DO6wLBUOTGpPHTzCZ85+A+v3v/fWl3WIXAJuI3lZbR
OqetyGZUkWXZGNnt26SJ9hmj/6IiBgq2V9uG5bZv/GfR38T2oD24DIXqqopxzIwU
X/206A4NNujMYP4DoBHvNVl+8wASVkbiR7oXXuFlwAE8iCki31YD1EqKl4lbXU9H
L8TzwctjCfReEghxCUMhikP3RARXHM7G4qqE/cjBKCBs3XeQ0/80Xhpa0ULtxUy/
W5Yfdf9KsMsA6Aq6k4RAfOeAZZZ6VMUlRstcJMgUA4CmUCn984zFKd1w4AzDqTqb
jteXmvX1RrUFvcoGDnq3VKdzuHudxFhE4ggHeOKxZKAnHU3ZLQS3GSFjeyyyy90a
KF8qEI4fPVZTrdO1zzaBavsDtws4GiAAIyas7f+7xcEW03ftTysWFGdA5kvaW1Ks
WYRCMOrWVZ1xLAfbYwk+aqmDmzp6vs0aoHwU/5LahMSKzQecjq1IWPTo91LluYdn
nkO7Ob88CNybztxII6iuruQy873NR/+2rC7Z9RO3oHSv+2hqjNg=
=IpR7
-----END PGP SIGNATURE-----

--2b3wiee55panlvid--


--===============5041387100736168116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5041387100736168116==--
