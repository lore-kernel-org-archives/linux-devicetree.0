From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [RESEND PATCH 0/5] Add bluetooth support for Orange Pi 3
Date: Mon, 7 Oct 2019 19:58:31 +0200
Message-ID: <20191007175831.2r2thebie6hxmxym@gilmour>
References: <20190823103139.17687-1-megous@megous.com>
 <20191007141153.7b76t4ntdzdojj5m@core.my.home>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qhahocbwdlja2oay"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191007141153.7b76t4ntdzdojj5m@core.my.home>
Sender: netdev-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--qhahocbwdlja2oay
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2019 at 04:11:53PM +0200, Ond=C5=99ej Jirman wrote:
> Hi Maxime,
>
> On Fri, Aug 23, 2019 at 12:31:34PM +0200, megous hlavni wrote:
> > From: Ondrej Jirman <megous@megous.com>
> >
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
>
> Please consider the DTS patches for 5.5.

Can  you resend them? I don't have access to my old mailbox anymore

Maxime

--qhahocbwdlja2oay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZt8xwAKCRDj7w1vZxhR
xab8AQCoq16pTHJEpC+5lsSAtxuOg5ykvT6nmBObbhL8FtoOTwD+NpvLfhLVo3aM
lI/68DRVnpx1ziS2dwVHXdvmQooJ9Qw=
=TYcE
-----END PGP SIGNATURE-----

--qhahocbwdlja2oay--
