From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [RESEND PATCH 0/5] Add bluetooth support for Orange Pi 3
Date: Fri, 30 Aug 2019 11:21:04 +0200
Message-ID: <20190830092104.odipmbflounqpffo@flea>
References: <20190823103139.17687-1-megous@megous.com>
 <5524D5E9-FA82-4244-A91F-78CF1C3FB3FB@holtmann.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zvsfua4pdi5vswnn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5524D5E9-FA82-4244-A91F-78CF1C3FB3FB@holtmann.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: megous@megous.com, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--zvsfua4pdi5vswnn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marcel,

On Fri, Aug 30, 2019 at 09:53:16AM +0200, Marcel Holtmann wrote:
> > (Resend to add missing lists, sorry for the noise.)
> >
> > This series implements bluetooth support for Xunlong Orange Pi 3 board.
> >
> > The board uses AP6256 WiFi/BT 5.0 chip.
> >
> > Summary of changes:
> >
> > - add more delay to let initialize the chip
> > - let the kernel detect firmware file path
> > - add new compatible and update dt-bindings
> > - update Orange Pi 3 / H6 DTS
> >
> > Please take a look.
> >
> > thank you and regards,
> >  Ondrej Jirman
> >
> > Ondrej Jirman (5):
> >  dt-bindings: net: Add compatible for BCM4345C5 bluetooth device
> >  bluetooth: bcm: Add support for loading firmware for BCM4345C5
> >  bluetooth: hci_bcm: Give more time to come out of reset
> >  arm64: dts: allwinner: h6: Add pin configs for uart1
> >  arm64: dts: allwinner: orange-pi-3: Enable UART1 / Bluetooth
> >
> > .../bindings/net/broadcom-bluetooth.txt       |  1 +
> > .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 19 +++++++++++++++++++
> > arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 10 ++++++++++
> > drivers/bluetooth/btbcm.c                     |  3 +++
> > drivers/bluetooth/hci_bcm.c                   |  3 ++-
> > 5 files changed, 35 insertions(+), 1 deletion(-)
>
> all 5 patches have been applied to bluetooth-next tree.

The DTS patches (last 2) should go through the arm-soc tree, can you
drop them?

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--zvsfua4pdi5vswnn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXWjqgAAKCRDj7w1vZxhR
xV8CAP417aV0QNmWtbn2xiBjkD9flY36PSlMOjyVjsX2zxv2GgEAyCygOXXu4S1z
X+AQg5RIlPCGhi8UpGGBfw2i1qEr5gQ=
=bUKu
-----END PGP SIGNATURE-----

--zvsfua4pdi5vswnn--
