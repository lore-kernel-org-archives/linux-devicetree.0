From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [RESEND PATCH 0/5] Add bluetooth support for Orange Pi 3
Date: Thu, 5 Sep 2019 14:56:53 +0300
Message-ID: <20190905115653.o2w7eyl4hvqegucv@flea>
References: <20190823103139.17687-1-megous@megous.com>
 <5524D5E9-FA82-4244-A91F-78CF1C3FB3FB@holtmann.org>
 <20190830092104.odipmbflounqpffo@flea>
 <D02B89FB-F8C0-40AD-A99A-6C1B4FEB72A0@holtmann.org>
 <20190830132034.u65arlv7umh64lx6@flea>
 <76FD40C7-10C5-4818-8EF9-60326ECA4243@holtmann.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="66mhhep6w5jiiqrl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <76FD40C7-10C5-4818-8EF9-60326ECA4243@holtmann.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: megous@megous.com, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--66mhhep6w5jiiqrl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 04, 2019 at 04:19:37PM +0200, Marcel Holtmann wrote:
> Hi Maxime,
>
> >>>>> (Resend to add missing lists, sorry for the noise.)
> >>>>>
> >>>>> This series implements bluetooth support for Xunlong Orange Pi 3 board.
> >>>>>
> >>>>> The board uses AP6256 WiFi/BT 5.0 chip.
> >>>>>
> >>>>> Summary of changes:
> >>>>>
> >>>>> - add more delay to let initialize the chip
> >>>>> - let the kernel detect firmware file path
> >>>>> - add new compatible and update dt-bindings
> >>>>> - update Orange Pi 3 / H6 DTS
> >>>>>
> >>>>> Please take a look.
> >>>>>
> >>>>> thank you and regards,
> >>>>> Ondrej Jirman
> >>>>>
> >>>>> Ondrej Jirman (5):
> >>>>> dt-bindings: net: Add compatible for BCM4345C5 bluetooth device
> >>>>> bluetooth: bcm: Add support for loading firmware for BCM4345C5
> >>>>> bluetooth: hci_bcm: Give more time to come out of reset
> >>>>> arm64: dts: allwinner: h6: Add pin configs for uart1
> >>>>> arm64: dts: allwinner: orange-pi-3: Enable UART1 / Bluetooth
> >>>>>
> >>>>> .../bindings/net/broadcom-bluetooth.txt       |  1 +
> >>>>> .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 19 +++++++++++++++++++
> >>>>> arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 10 ++++++++++
> >>>>> drivers/bluetooth/btbcm.c                     |  3 +++
> >>>>> drivers/bluetooth/hci_bcm.c                   |  3 ++-
> >>>>> 5 files changed, 35 insertions(+), 1 deletion(-)
> >>>>
> >>>> all 5 patches have been applied to bluetooth-next tree.
> >>>
> >>> The DTS patches (last 2) should go through the arm-soc tree, can you
> >>> drop them?
> >>
> >> why is that? We have included DTS changes for Bluetooth devices
> >> directly all the time. What is different with this hardware?
> >
> > I guess some maintainers are more relaxed with it than we are then,
> > but for the why, well, it's the usual reasons, the most immediate one
> > being that it reduces to a minimum the conflicts between trees.
> >
> > The other being that it's not really usual to merge patches supposed
> > to be handled by another maintainer without (at least) his
> > consent. I'm pretty sure you would have asked the same request if I
> > would have merged the bluetooth patches through my tree without
> > notice.
>
> I took the two DTS patches out now and let the submitter deal with
> getting these merged.

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--66mhhep6w5jiiqrl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXXD4BQAKCRDj7w1vZxhR
xRuEAQD4NBPiyuvLlo3LM5wXaUbunkvUUCDpAZ3nIkj1OvPjIgD8Da8U574V2FaU
aFSxv34yqbNn72v/P/KP/9zxT3Y40g8=
=SOn6
-----END PGP SIGNATURE-----

--66mhhep6w5jiiqrl--
