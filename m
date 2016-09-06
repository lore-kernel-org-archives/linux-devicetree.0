From: Jorik Jonker <jorik@kippendief.biz>
Subject: Re: [PATCH v2 4/7] dts: sun8i-h3: add UART1-3 to Orange Pi Plus
Date: Tue, 6 Sep 2016 10:52:02 +0200
Message-ID: <20160906085202.GA4854@carbon.kippendief.biz>
References: <1472671858-29220-1-git-send-email-jorik@kippendief.biz>
 <1472671858-29220-5-git-send-email-jorik@kippendief.biz>
 <20160902070425.GB6313@lukather>
 <20160903120932.GA6289@carbon.kippendief.biz>
 <20160905193111.GC4728@lukather>
 <CAGb2v67dnnxOp_yPyC8icu-m0WZ-Rs1STs1tnxJMOLfcRfRzUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67dnnxOp_yPyC8icu-m0WZ-Rs1STs1tnxJMOLfcRfRzUg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2016 at 11:04:38AM +0800, Chen-Yu Tsai wrote:
>In short, I'm ok with it. But please put an explicit
>
>    status =3D "disabled";
>
>and probably a comment about how/where the peripheral can be
>used in the board dts.

Allright, I will do that in v3.

>I intended to do this for the Banana Pis. Though my original plan
>was to enable Raspberry Pi compatible peripherals by default, and
>list the other peripherals that are defined by the vendor as
>"disabled".
>
>"Defined by the vendor" means that the vendor has some sort of
>document associating the gpio header pins with the peripherals,
>as shown in:
>
>    http://www.orangepi.org/Docs/Pindefinition.html#CON3_Definition
>
>This should make it easier for the average user to enable the
>peripherals. I'm not sure we should list _all_ possible ones
>though. That would make the list very large, and some might
>end up never being used.

This is exactly what I was thinking, albeit I wanted to go a bit=20
'bigger': move all unambiguous pinmux/peripheral associations from the=20
H3 DTS files to the DTSI, complete them with known associations for=20
which there are drivers, and have all of these disabled. Reduce the=20
existing blocks in the DTS files to just "status =3D okay".

Peripherals requiring board-specific things (like emac, USB, voltage=20
regulators, displays) stay put in the DTS.

It will explodes the scope of my proposed change a bit, but if you are=20
OK with this, I will gladly do it.

Maxime, Chen-Yu: what do you think of this?

Best,

Jorik

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlfOg7IACgkQ0IyxrguT4/+p3gCaA6DRZDWOpqRlASRMHFhP9L+s
hZgAnie/cUq4K1/BggEMUguiAH3wh419
=0A8G
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
